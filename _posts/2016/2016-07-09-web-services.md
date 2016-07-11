---
title: "Python Part 13: Using Web Services"
date: 2016-07-09 08:40
modified: 2016-07-10
categories:
  - Python
tags:
  - Python Application
  - XML
  - JSON
  - API
published: true
excerpt: |
  There are two common formats that we use when exchanging data across the web.
series: "Intro to Python"	
---
{% include series.html %}

* TOC
{:toc}

There are two common formats that we use when **exchanging data** between applications and across the web. 
The “eXtensible Markup Language” or **XML** has been in use for a very long time 
and is best suited for exchanging document-style data. When programs just want 
to exchange dictionaries, lists, or other internal information with each other,
they use JavaScript Object Notation or [JSON](http://www.json.org/) . 

## eXtensible Markup Language - XML

Primary purpose of XML is to help information systems share structured data.

XML looks very similar to HTML, but XML is more structured than HTML. Here is a sample of an XML document:

```xml
<person> # start tag
  <name>Chuck</name>
  <phone type="intl"> # attribute -- Keyword/value pairs on the opening tag of XML
     +1 734 303 4456 # text content
   </phone>
   <email hide="yes"/> #self closing tag
</person> # end tag
```

Often it is helpful to think of an XML document as a tree structure where there is a top tag person and other tags such as phone are drawn as *children* of their parent nodes.

![img](http://www.pythonlearn.com/html-270/book014.png)

> Line ends do not matter.  White space is generally discarded on text elements.  We indent only to be readable.

## XML Schema

Describing a “contract” as to what is acceptable XML.

* Description of the **legal format** of an XML document


* Expressed in terms of constraints on the structure and content of documents


* Often used to specify a **“contract”** between systems - “My system will only accept XML that conforms to this particular Schema.”


* If a particular piece of XML meets the specification of the Schema - it is said to “**validate**”

#### XSD Structure

```xml
<xs:complexType name=”person”>
  <xs:sequence>

    <xs:element name="lastname" type="xs:string"/>
    <xs:element name="age" type="xs:integer"/>
    <xs:element name="dateborn" type="xs:date"/>
  </xs:sequence>
</xs:complexType>
```

## Parsing XML

Here is a simple application that parses some XML and extracts some data elements from the XML:

```python
import xml.etree.ElementTree as ET

data = "'
<person>
  <name>Chuck</name>
  <phone type="intl">
     +1 734 303 4456
   </phone>
   <email hide="yes"/>
</person>"'

tree = ET.fromstring(data)
print 'Name:',tree.find('name').text
print 'Attr:',tree.find('email').get('hide')
```

Calling `fromstring` converts the string representationof the XML into a “tree” of XML nodes. When the XML is in a tree, we have a series of methods we can call to extract portions of data from the XML. 

The `find` function searches through the XML tree and retrieves a node that matches the specified tag. Each node can have some text, some attributes (like hide), and some “child” nodes. Each node can be the top of a tree of nodes.

```
Name: Chuck
Attr: yes
```

## Looping through nodes

Often the XML has multiple nodes and we need to write a loop to process all of the nodes. In the following program, we loop through all of the user nodes:

```python
import xml.etree.ElementTree as ET

input = "'
<stuff>
    <users>
        <user x="2">
            <id>001</id>
            <name>Chuck</name>
        </user>
        <user x="7">
            <id>009</id>
            <name>Brent</name>
        </user>
    </users>
</stuff>"'

stuff = ET.fromstring(input)
lst = stuff.findall('users/user')
print 'User count:', len(lst)

for item in lst:
    print 'Name', item.find('name').text
    print 'Id', item.find('id').text
    print 'Attribute', item.get('x')
```

The `findall` method retrieves a Python list of subtrees that represent the user structures in the XML tree. Then we can write a for loop that looks at each of the user nodes, and prints the `name` and `id` text elements as well as the `x` attribute from the `user` node.

```
User count: 2
Name Chuck
Id 001
Attribute 2
Name Brent
Id 009
Attribute 7
```

## JavaScript Object Notation -- JSON

JSON represents data as nested “lists” and “dictionaries”

```json
{
  "name" : "Chuck",
  "phone" : {
    "type" : "intl",
    "number" : "+1 734 303 4456"
   },
   "email" : {
     "hide" : "yes"
   }
}
```

In general, there is an industry trend away from XML and towards JSON for web services. 

 **JSON** structures are **simpler** than **XML** because JSON has fewer capabilities than XML. But JSON has the advantage that it maps *directly* to some combination of dictionaries and lists. And since nearly all programming languages have something equivalent to Python’s dictionaries and lists, JSON is a very natural format to have two cooperating programs exchange data.

But XML is more self-descriptive than JSON and so there are some applications where XML retains an advantage. For example, most word processors store documents internally using XML rather than JSON.

## Parsing JSON

In the following program, we use the built-in `json` library to parse the JSON and read through the data.

```python
import json

input = "'
[
  { "id" : "001",
    "x" : "2",
    "name" : "Chuck"
  } ,
  { "id" : "009",
    "x" : "7",
    "name" : "Brent"
  } 
]"'

info = json.loads(input)
print 'User count:', len(info)

for item in info:
    print 'Name', item['name']
    print 'Id', item['id']
    print 'Attribute', item['x']
```

The output of this program is exactly the same as the XML version above.

```
User count: 2
Name Chuck
Id 001
Attribute 2
Name Brent
Id 009
Attribute 7
```

## Application Programming Interfaces

We now have the ability to exchange data between applications using HyperTextTransport Protocol (**HTTP**) and a way to represent complex data that we are sending back and forth between these applications using eXtensible Markup Language (**XML**) or JavaScript Object Notation (**JSON**).

The next step is to begin to define and document “**contracts**” between applications using these techniques. The general name for these application-to-application contracts is Application Program Interfaces or **APIs**[^1]. When we use an API, generally one programmakes a set of **services** available for use by other applicationsand publishes the APIs (i.e., the “rules”) that must be followed to access the services provided by the program.

When we begin to build our programs where the functionality of our program includes access to services provided by other programs, we call the approach a **Service-Oriented Architecture** or **SOA**[^2]. A **SOA** approach is one where our overall application makes use of the services of other applications. A non-SOA approach is where the application is a single standalone application which contains all of the code necessary to implement the application.

![img](http://www.pythonlearn.com/html-270/book015.png)

When an application makes a set of services in its API available over the web, we call these **web services**. 

## Google geocoding web service

The following is a simple application to prompt the user for a search string, call the Google geocoding API, and extract information from the returned JSON.

```python
import urllib
import json

serviceurl = 'http://maps.googleapis.com/maps/api/geocode/json?'

while True:
    address = raw_input('Enter location: ')
    if len(address) < 1 : break

    url = serviceurl + urllib.urlencode({'sensor':'false', 
          'address': address})
    print 'Retrieving', url
    uh = urllib.urlopen(url)
    data = uh.read()
    print 'Retrieved',len(data),'characters'

    try: js = json.loads(str(data))
    except: js = None
    if 'status' not in js or js['status'] != 'OK':
        print '==== Failure To Retrieve ===='
        print data
        continue

    print json.dumps(js, indent=4)

    lat = js["results"][0]["geometry"]["location"]["lat"]
    lng = js["results"][0]["geometry"]["location"]["lng"]
    print 'lat',lat,'lng',lng
    location = js['results'][0]['formatted_address']
    print location
```

The output of the program is as follows (some of the returnedJSON has been removed):

```
$ python geojson.py
Enter location: Ann Arbor, MI
Retrieving http://maps.googleapis.com/maps/api/
  geocode/json?sensor=false&address=Ann+Arbor%2C+MI
Retrieved 1669 characters
{
    "status": "OK", 
    "results": [
        {
            "geometry": {
                "location_type": "APPROXIMATE", 
                "location": {
                    "lat": 42.2808256, 
                    "lng": -83.7430378
                }
            }, 
            "address_components": [
                {
                    "long_name": "Ann Arbor", 
                    "types": [
                        "locality", 
                        "political"
                    ], 
                    "short_name": "Ann Arbor"
                } 
            ], 
            "formatted_address": "Ann Arbor, MI, USA", 
            "types": [
                "locality", 
                "political"
            ]
        }
    ]
}
lat 42.2808256 lng -83.7430378
Ann Arbor, MI, USA
Enter location:
```

## Security and API usage

It is quite common that you need some kind of “**API key**” to make use of a vendor’s API. 

Sometimes once you get your API key, you simply include the key as part of POST data or perhaps as a parameter on the URL when calling the API.

Other times, the vendor wants increased assurance of the source of the requests and so they add expect you to send **cryptographically signed messages** using shared keys and secrets. A very common technology that is used to sign requests over the Internet is called **[OAuth](http://www.oauth.net)**. 

[^1]: Application Program Interface - A contract between applications that defines the patterns of interaction between two application components. 
[^2]: Service-Oriented Architecture. When an application is made of components connected across a network.



