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

### 1.0

获取图片链接

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

### 1.1

下载图片到本地

```python
# python 2.x
import urllib2
import re
from BeautifulSoup import *


def findImg(im):
    if 'img' in im:
        i = re.findall('(//.*?)_50', im)[0]
        i = 'https:'+i
        return i

def saveImg(imageURL, name):
    req = urllib2.Request(imageURL, headers = {
        'Connection': 'Keep-Alive',
        'Accept': 'text/html, application/xhtml+xml, */*',
        'Accept-Language': 'en-US,en;q=0.8,zh-Hans-CN;q=0.5,zh-Hans;q=0.3',
        'User-Agent': 'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0) like Gecko'
    })
    oper = urllib2.urlopen(req)
    data = oper.read()
    name=name+".jpg" 
    f = open(name, 'wb')
    f.write(data)
    f.close()
            
url = raw_input('Enter - ')
if len(url) < 1:
	url = 'https://item.taobao.com/item.htm?id=523172528872'
print 'URL:', url
html = urllib2.urlopen(url).read()
html = html.decode('gbk', 'ignore').encode('utf-8')
soup = BeautifulSoup(html)

t = list()

tags = soup('a')
for tag in tags:
    img = tag.contents
    if len(img) > 0:
    	im = str(img[0])
        ii = findImg(im)
        if ii != None:
            t.append(ii)


n = 0
for link in t:
    n = n + 1
    print link
    saveImg(link, str(n))
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
## 伪装浏览器

```python
import urllib2
import time

url = 'https://gd1.alicdn.com/imgextra/i8/***.SS2' 

def saveImg(imageURL):
    req = urllib2.Request(url, headers = {
        'Connection': 'Keep-Alive',
        'Accept': 'text/html, application/xhtml+xml, */*',
        'Accept-Language': 'en-US,en;q=0.8,zh-Hans-CN;q=0.5,zh-Hans;q=0.3',
        'User-Agent': 'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0) like Gecko'
    })
    oper = urllib2.urlopen(req)
    data = oper.read()
    name=time.strftime("%H%M%S", time.localtime())
    name=name+".jpg" 
    f = open(name, 'wb')
    f.write(data)
    f.close()

saveImg(url)
```

## Reference

[简洁的python，简洁的urllib,保存图片](http://blog.csdn.net/wwaiym/article/details/5829471) 

[零基础自学用Python 3开发网络爬虫(三): 伪装浏览器君](https://jecvay.com/2014/09/python3-web-bug-series3.html)

[用python2和python3伪装浏览器爬取网页](http://www.cnblogs.com/blueel/archive/2013/01/31/2886600.html)

[urllib与urllib2的学习总结(python2.7.X)](http://www.cnblogs.com/wly923/archive/2013/05/07/3057122.html)
