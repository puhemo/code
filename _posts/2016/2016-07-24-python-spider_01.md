---
title: "Python Spider test01"
date: 2016-07-24
modified: 2016-07-24
published: true
categories:
  - Python
tags:
  - Python 2.x
  - Spider
excerpt: |
    Sample code
---

## 淘宝主图

```python
# 1.0
import urllib
from BeautifulSoup import *
import re

             
url = raw_input('Enter - ')
html = urllib.urlopen(url).read()
html = html.decode('gbk', 'ignore').encode('utf-8')
soup = BeautifulSoup(html)

# Retrieve all of the anchor tags
tags = soup('a')
for tag in tags:
    img = tag.contents
    if len(img) > 0:
    	im = str(img[0])
    	if 'img' in im:
    		i = re.findall('(//.*?)_50', im)[0]
    		print i
```

## 淘宝颜色图

```python
# 1.0
import urllib
from BeautifulSoup import *
import re
                   
url = raw_input('Enter - ')
html = urllib.urlopen(url).read()
soup = BeautifulSoup(html)

# Retrieve all of the anchor tags
tags = soup('a')
for tag in tags:
   img = tag.get('style', None)
   #print img
   if img != None :
       links = re.findall('(//.*?jpg?)', img)
       x = 0
       for link in links:
	       print link
   else: continue
```

## Reference

[简洁的python，简洁的urllib,保存图片](http://blog.csdn.net/wwaiym/article/details/5829471) 

[零基础自学用Python 3开发网络爬虫(三): 伪装浏览器君](https://jecvay.com/2014/09/python3-web-bug-series3.html)

[用python2和python3伪装浏览器爬取网页](http://www.cnblogs.com/blueel/archive/2013/01/31/2886600.html)
