---
title: "Python Part 11: Networked programs"
date: 2016-07-06 09:50
modified: 2016-07-07
categories:
  - Python
tags:
  - Python Application
  - HTTP
published: true
excerpt: |
  The network protocol that powers the web is actually quite simple and there is built-in support in Python called **sockets** which makes it very easy to make network connections and retrieve data over those sockets in a Python program.
series: "Intro to Python"	
---
{% include series.html %}

* TOC
{:toc}

## HyperText Transport Protocol - HTTP

The network protocol that powers the web is actually quite simple and there is built-in support in Python called **sockets** which makes it very easy to make network connections and retrieve data over those sockets in a Python program.

A **socket** is much like a file, except that a single socket provides a two-way connection between two programs. 

A port is a number that generally indicates which application you are contacting when you make a socket connection to a server.As an example, web traffic usually uses port 80 while email traffic uses port 25.

A **protocol** is a set of precise rules that determine who is to go first, what they are to do, and then what the responses are to that message,and who sends next, and so on.

**The HyperText Transport Protocol (HTTP)** is one of the most common protocol.

## The World’s Simplest Web Browser

Retrieve a plain text file which had newlines in the file and copy the data to the screen as the program run.

```python
import socket

mysock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
mysock.connect(('www.py4inf.com', 80))
mysock.send('GET http://www.py4inf.com/code/romeo.txt HTTP/1.0\n\n')

while True:
    data = mysock.recv(512)
    if ( len(data) < 1 ) :
        break
    print data

mysock.close()
```

![img](http://www.pythonlearn.com/html-270/book013.png)

## Retrieving an image over HTTP

Accumulate the data in a string, trim off the headers,and then save the image data to a file.

```python
import socket
import time

mysock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
mysock.connect(('www.py4inf.com', 80))
mysock.send('GET http://www.py4inf.com/cover.jpg HTTP/1.0\n\n')


count = 0
picture = "";
while True:
    data = mysock.recv(5120)
    if ( len(data) < 1 ) : break
    # slow down the successive recv() calls by uncommenting the call to time.sleep(). 
    # time.sleep(0.25)
    count = count + len(data)
    print len(data),count
    picture = picture + data

mysock.close()

# Look for the end of the header (2 CRLF)
pos = picture.find("\r\n\r\n");
print 'Header length',pos
print picture[:pos]

# Skip past the header and save the picture data
picture = picture[pos+4:]
fhand = open("stuff.jpg","wb")
fhand.write(picture);
fhand.close()
```

## Retrieving web pages with urllib

Using `urllib`,you can treat a web page much like a file. You simply indicate which web page you would like to retrieve and urllib handles all of the HTTP protocol and header details.

The equivalent code to read the romeo.txt filefrom the web using `urllib` is as follows:

```python
import urllib

fhand = urllib.urlopen('http://www.py4inf.com/code/romeo.txt')
for line in fhand:
   print line.strip()
```

As an example, we can write a program to retrieve the data forromeo.txt and compute the frequencyof each word in the file as follows:

```python
import urllib

counts = dict()
fhand = urllib.urlopen('http://www.py4inf.com/code/romeo.txt')
for line in fhand:
    words = line.split()
    for word in words:
        counts[word] = counts.get(word,0) + 1   
print counts
```

Again, once we have opened the web page, we can read it like a local file.

## Parsing HTML using regular expressions

One simple way to parse HTML is to use regular expressions to repeatedly search for and extract substrings that match a particular pattern.

Here is a simple web page:

```html
<h1>The First Page</h1>
<p>
If you like, you can switch to the
<a href="http://www.dr-chuck.com/page2.htm">
Second Page</a>.
</p>
```
We can construct a well-formed regular expression to match and extract the link values from the above text as follows:

```
href="http://.+?"
```

```python
import urllib
import re

url = raw_input('Enter - ')
html = urllib.urlopen(url).read()
links = re.findall('href="(http://.*?)"', html)
for link in links:
    print link
```

The `findall` regular expression method will give us a list of allof the strings that match our regular expression, returning only the link text between the double quotes.

## Parsing HTML using BeautifulSoup

There are a number of Python libraries which can help you parse HTML and extract data from the pages. Each of the libraries has its strengths and weaknesses and you can pick one based on your needs.

As an example, we will simply parse some HTML input and extract links using the **[BeautifulSoup](http://www.crummy.com/software/)** library.

We will use `urllib` to read the page and then use **BeautifulSoup** to extract the href attributes from the anchor (a) tags.

```python
import urllib
from BeautifulSoup import *

url = raw_input('Enter - ')
html = urllib.urlopen(url).read()
soup = BeautifulSoup(html)

# Retrieve all of the anchor tags
tags = soup('a')
for tag in tags:
   print tag.get('href', None)
```

The program prompts for a web address, then opens the webpage, reads the data and passes the data to the BeautifulSoup parser, and then retrieves all of the anchor tags and prints out the href attribute for each tag.

When the program runs it looks as follows:

```
python urllinks.py 
Enter - http://www.dr-chuck.com/page1.htm
http://www.dr-chuck.com/page2.htm

python urllinks.py 
Enter - http://www.py4inf.com/book.htm
http://www.greenteapress.com/thinkpython/thinkpython.html
http://allendowney.com/
http://www.si502.com/
http://www.lib.umich.edu/espresso-book-machine
http://www.py4inf.com/code
http://www.pythonlearn.com/
```

You can use BeautifulSoup to pull out various parts of each tag as follows:

```python
import urllib
from BeautifulSoup import *

url = raw_input('Enter - ')
html = urllib.urlopen(url).read()
soup = BeautifulSoup(html)

# Retrieve all of the anchor tags
tags = soup('a')
for tag in tags:
   # Look at the parts of a tag
   print 'TAG:',tag
   print 'URL:',tag.get('href', None)
   print 'Content:',tag.contents[0]
   print 'Attrs:',tag.attrs
```

This produces the following output:

```
python urllink2.py 
Enter - http://www.dr-chuck.com/page1.htm
TAG: <a href="http://www.dr-chuck.com/page2.htm">
Second Page</a>
URL: http://www.dr-chuck.com/page2.htm
Content: [u'\nSecond Page']
Attrs: [(u'href', u'http://www.dr-chuck.com/page2.htm')]
```

Following Links in Python

The program will use urllib to read the HTML from the data files below, extract the href= vaues from the anchor tags, scan for a tag that is in a particular position relative to the first name in the list, follow that link and repeat the process a number of times and report the last name you find. 

Start at: [http://python-data.dr-chuck.net/known_by_Samuel.html](http://python-data.dr-chuck.net/known_by_Samuel.html)  
Find the link at position 18 (the first name is 1). Follow that link. Repeat this process 7 times. The answer is the last name that you retrieve.

```python
import urllib
from BeautifulSoup import *

url = raw_input('Enter - ')
c = int(raw_input('Enter count: '))
p = int(raw_input('Enter position: '))
print 'Retrieving: ', url

for n in range(c):
    html = urllib.urlopen(url).read()
    soup = BeautifulSoup(html)
    l = list()
    tags = soup('a')
    for tag in tags:
        l.append(tag.get('href', None))
    url = l[p-1]
    print 'Retrieving: ', url
```

This produces the following output:

```
$ python solution.py 
Enter - http://python-data.dr-chuck.net/known_by_Samuel.html
Enter count: 7
Enter position: 18
Retrieving:  http://python-data.dr-chuck.net/known_by_Samuel.html
Retrieving:  http://python-data.dr-chuck.net/known_by_Skyler.html
Retrieving:  http://python-data.dr-chuck.net/known_by_Kaidan.html
Retrieving:  http://python-data.dr-chuck.net/known_by_Jo.html
Retrieving:  http://python-data.dr-chuck.net/known_by_Sonni.html
Retrieving:  http://python-data.dr-chuck.net/known_by_Seb.html
Retrieving:  http://python-data.dr-chuck.net/known_by_Yakup.html
Retrieving:  http://python-data.dr-chuck.net/known_by_Merina.html
```

## Reading binary files using urllib

Sometimes you want to retrieve a non-text (or binary) file such as an image or video file. The data in these files is generally not useful to print out, but you can easily make a copy of a URL to a local file on your hard disk using `urllib`.

```python
import urllib

img = urllib.urlopen('http://www.py4inf.com/cover.jpg')
fhand = open('cover.jpg', 'w')
size = 0
while True:
    info = img.read(100000)
    if len(info) < 1 : break
    size = size + len(info)
    fhand.write(info)

print size,'characters copied.'
fhand.close()
```

{% include series.html %}