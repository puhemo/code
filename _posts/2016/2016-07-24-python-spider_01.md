---
title: "Python Spider test01"
date: 2016-07-24
modified: 2016-08-04
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

### 1.2

本地目录新建图片保存位置

```python
# python 2.x
# encoding: utf-8
import urllib2
import re
import os
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
    fname = '%s%s.jpg'%(s_path,name)
    #name=name+".jpg" 
    f = open(fname, 'wb')
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

p = raw_input('Enter filename: ')
path = os.getcwd() 
s_path='%s/%s/' %(path, p) 
if os.path.exists(s_path):
    print s_path + ' exits!'
else:
    os.mkdir(s_path) 

n = 0
for link in t:
    n = n + 1
    print link
    saveImg(link, str(n))
```

## 淘宝颜色图

### 1.0

获取图片链接

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

### 1.1 

保存到本地

```python
# python 2.x
import urllib2
from BeautifulSoup import *
import re

def findImg(im):
    links = re.findall('(//.*?jpg?)', im)
    if len(links) > 0:
    	link = links[0]
        link = 'https:'+ link
        return link

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
	url = 'https://item.taobao.com/item.htm?id=534076017689&ns=1&abbucket=14#detail'
print 'URL:', url
html = urllib2.urlopen(url).read()
soup = BeautifulSoup(html)

l = list()
tags = soup('a')
for tag in tags:
   img = tag.get('style', None)
   #print img
   if img != None :
       ii = findImg(img)
       if ii != None:
            l.append(ii)
n = 0
for u in l:
    n = n + 1
    print n
    print u
    saveImg(u, str(n))
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

## 2.0 

```python
# python 2.x
# encoding: utf-8
# 2.0
import urllib2
import re
import os
from BeautifulSoup import *

# 获取主图图片链接
def m_findImg(im):
    if 'img' in im:
        i = re.findall('(//.*?)_50', im)[0]
        i = 'https:'+i
        return i
# 获取颜色图片链接
def c_findImg(im):
    links = re.findall('(//.*?jpg?)', im)
    if len(links) > 0:
        link = 'https:'+ links[0]
        return link

# 新建文件保存目录
def Img_path(i_name):
    path = os.getcwd() 
    image_path = '%s/%s/' %(path, i_name)
    if not os.path.exists(image_path):
        os.mkdir(image_path)
    else:
        print image_path + ' exits!' 
    return image_path

# 保存图片
def saveImg(img_URL,img_name,img_path):
    req = urllib2.Request(img_URL, headers = {
        'Connection': 'Keep-Alive',
        'Accept': 'text/html, application/xhtml+xml, */*',
        'Accept-Language': 'en-US,en;q=0.8,zh-Hans-CN;q=0.5,zh-Hans;q=0.3',
        'User-Agent': 'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0) like Gecko'
    }) #伪装浏览器
    oper = urllib2.urlopen(req)
    data = oper.read()
    fname = '%s%s.jpg'%(img_path,img_name)
    f = open(fname, 'wb')
    f.write(data)
    f.close()

url = raw_input('Enter - ')
if len(url) < 1:
    url = 'https://item.taobao.com/item.htm?id=534076017689&ns=1&abbucket=14#detail'
print 'URL:', url
html = urllib2.urlopen(url).read()
html = html.decode('gbk', 'ignore').encode('utf-8') # 转码
soup = BeautifulSoup(html)

ml = list()
cl = list()
tags = soup('a')

for tag in tags:
    m_img = tag.contents
    if len(m_img) > 0:
        im = str(m_img[0])
        if m_findImg(im) != None:
            ml.append(m_findImg(im))

for tag in tags:
    c_img = tag.get('style', None)
    if c_img != None :
        if c_findImg(c_img) != None:
           cl.append(c_findImg(c_img))  

m = raw_input('Enter main filename: ')
if len(m) < 1:
    m = 'main'
c = raw_input('Enter color filename: ')
if len(c) < 1:
    c = 'color'

n = 0
for u1 in ml:
    n = n + 1
    #print u1
    saveImg(u1, str(n), Img_path(m))
p = 0
for u2 in cl:
    p = p + 1
    #print u2
    saveImg(u2, str(p), Img_path(c))
```

### 2.0.1

```python
# python 2.x
# encoding: utf-8
# 2.0.1
import urllib2
import re
import os
from BeautifulSoup import *

# 获取主图链接
def m_findImg(im):
    if 'img' in im:
        i = re.findall('(//.*?)_50', im)[0]
        i = 'https:'+i
        return i

# 获取颜色图链接
def c_findImg(im):
    links = re.findall('(//.*?jpg?)', im)
    if len(links) > 0:
        link = 'https:'+ links[0]
        return link

# 新建文件保存目录
def Img_path(i_name):
    path = os.getcwd() 
    image_path = '%s/%s/' %(path, i_name)
    if not os.path.exists(image_path):
        os.mkdir(image_path)
    else:
        print image_path + ' exits!' 
    return image_path

# 保存单个图片
def saveImg(img_URL,img_name,img_path):
    req = urllib2.Request(img_URL, headers = {
        'Connection': 'Keep-Alive',
        'Accept': 'text/html, application/xhtml+xml, */*',
        'Accept-Language': 'en-US,en;q=0.8,zh-Hans-CN;q=0.5,zh-Hans;q=0.3',
        'User-Agent': 'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0) like Gecko'
    }) #伪装浏览器
    oper = urllib2.urlopen(req)
    data = oper.read()
    fname = '%s%s.jpg'%(img_path,img_name)
    f = open(fname, 'wb')
    f.write(data)
    f.close()

# 批量保存图片
def saveImg2(l, f):
    n = 0
    for u in l:
        n = n + 1
        saveImg(u, str(n), Img_path(f))

url = raw_input('Enter - ')
if len(url) < 1:
    url = 'https://item.taobao.com/item.htm?id=534076017689&ns=1&abbucket=14#detail'
print 'URL:', url
html = urllib2.urlopen(url).read()
html = html.decode('gbk', 'ignore').encode('utf-8') # 转码
soup = BeautifulSoup(html)

ml = list()
cl = list()
tags = soup('a')

for tag in tags:
    m_img = tag.contents
    if len(m_img) > 0:
        im = str(m_img[0])
        if m_findImg(im) != None:
            ml.append(m_findImg(im))

for tag in tags:
    c_img = tag.get('style', None)
    if c_img != None :
        if c_findImg(c_img) != None:
           cl.append(c_findImg(c_img))  

m = raw_input('Enter main filename: ')
if len(m) < 1:
    m = 'main'
c = raw_input('Enter color filename: ')
if len(c) < 1:
    c = 'color'

saveImg2(ml, m)
saveImg2(cl, c)
```

## Reference

[简洁的python，简洁的urllib,保存图片](http://blog.csdn.net/wwaiym/article/details/5829471) 

[零基础自学用Python 3开发网络爬虫(三): 伪装浏览器君](https://jecvay.com/2014/09/python3-web-bug-series3.html)

[用python2和python3伪装浏览器爬取网页](http://www.cnblogs.com/blueel/archive/2013/01/31/2886600.html)

[urllib与urllib2的学习总结(python2.7.X)](http://www.cnblogs.com/wly923/archive/2013/05/07/3057122.html)

[python字符串decode中遇到非法字符的问题](http://www.cnblogs.com/baiyuyang/archive/2011/10/29/2228667.html)
