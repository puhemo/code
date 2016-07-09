---
title: "Python Part 11: Using Web Services"
date: 2016-07-09 08:40
modified: 2016-07-09
categories:
  - Python
tags:
  - Python Application
  - XML
  - JSON
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
they use JavaScript Object Notation or **[JSON]( www.json.org)** . 

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

