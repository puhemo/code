---
title: "Python Spider test01"
date: 2016-07-24
modified: 2016-08-11
published: true
categories:
  - Python
tags:
  - Python 2.x
  - Spider
excerpt: |
    Sample code
---

* TOC
{:toc}

## 1.0

淘宝主图

获取图片链接

```python
# 1.0.1
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

### 1.0.1

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
	url = 'https://item.taobao.com/item.htm?id=??????'
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

### 1.0.2

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
	url = 'https://item.taobao.com/item.htm?id=??????'
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

## 1.1

淘宝颜色图

获取图片链接

```python
# 1.1
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

### 1.1.1

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
	url = 'https://item.taobao.com/item.htm?id=?????&ns=1&abbucket=14#detail'
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
    url = 'https://item.taobao.com/item.htm?id=??????&ns=1&abbucket=14#detail'
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
    url = 'https://item.taobao.com/item.htm?id=???????&ns=1&abbucket=14#detail'
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

### 2.0.2

```python
# 2.0.2
# encoding: utf-8
# python 2.x
import urllib2
import re
import os
from BeautifulSoup import *

# 获取主图链接
def m_findImg(t1):
    m_img = t1.contents
    if len(m_img) > 0:
        im = str(m_img[0])
        if 'img' in im:
            m_url = 'https:'+ re.findall('(//.*?)_50', im)[0]
            return m_url

# 获取颜色图链接
def c_findImg(t2):
    c_img = t2.get('style', None)
    if c_img != None :
        links = re.findall('(//.*?jpg?)', c_img)
        if len(links) > 0:
            c_url = 'https:'+ links[0]
            return c_url

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
    url = 'https://item.taobao.com/item.htm?id=???????&ns=1&abbucket=14#detail'
print 'URL:', url
html = urllib2.urlopen(url).read()
html = html.decode('gbk', 'ignore').encode('utf-8') # 转码
soup = BeautifulSoup(html)

ml = list()
cl = list()
tags = soup('a')
for tag in tags:
    ml.append(m_findImg(tag))
    cl.append(c_findImg(tag))


n_ml = [x for x in ml if x is not None]
n_cl = [x for x in cl if x is not None]

m = raw_input('Enter main filename: ')
if len(m) < 1:
    m = 'main'
c = raw_input('Enter color filename: ')
if len(c) < 1:
    c = 'color'

saveImg2(n_ml, m)
saveImg2(n_cl, c)
```

### **2.0.3**

优化细节

```python
# 2.0.3
# encoding: utf-8
# python 2.x
import urllib2
import re
import os
from BeautifulSoup import *

print """
        Taobao Item Image Spider
"""

# 获取主图链接
def m_findImg(t1):
    m_img = t1.contents
    if len(m_img) > 0:
        im = str(m_img[0])
        if 'img' in im:
            m_url = 'https:'+ re.findall('(//.*?)_50', im)[0]
            return m_url

# 获取颜色图链接
def c_findImg(t2):
    c_img = t2.get('style', None)
    if c_img != None :
        links = re.findall('(//.*?jpg?)', c_img)
        if len(links) > 0:
            c_url = 'https:'+ links[0]
            return c_url

# 新建文件保存目录
def Img_path(i_name):
    path = os.getcwd() 
    image_path = '%s/%s/' %(path, i_name)
    if not os.path.exists(image_path):
        os.mkdir(image_path)
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
        print "\nGET %s %d >>> " % (f, n) + u
        saveImg(u, str(n), Img_path(f))

url = raw_input('Enter Taobao Url - ')
if len(url) < 1:
    url = 'https://item.taobao.com/item.htm?xxxxxxxxxxxxx'
print 'URL:', url
m = raw_input('Enter main directory: ')
if len(m) < 1:
    m = 'main'
c = raw_input('Enter color directory: ')
if len(c) < 1:
    c = 'color'

html = urllib2.urlopen(url).read()
html = html.decode('gbk', 'ignore').encode('utf-8') # 转码
soup = BeautifulSoup(html)

ml = list()
cl = list()
tags = soup('a')
for tag in tags:
    ml.append(m_findImg(tag))
    cl.append(c_findImg(tag))

n_ml = [x for x in ml if x is not None]
n_cl = [x for x in cl if x is not None]

saveImg2(n_ml, m)
saveImg2(n_cl, c)

print u"\nHi~Finished~~~"
```

### 2.0.4 

优化代码

```python
# encoding: utf-8
# python 2.x
#2.0.4
import urllib2
import re
import os

print """
        Taobao Item Image Spider
"""

# 新建文件保存目录
def Img_path(i_name):
    path = os.getcwd() 
    image_path = '%s/%s/' %(path, i_name)
    if not os.path.exists(image_path):
        os.mkdir(image_path)
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
        u = 'https:' + u
        print "\nGET %s %d >>> " % (f, n) + u
        saveImg(u, str(n), Img_path(f))

url = raw_input('Enter Taobao Url - ')
if len(url) < 1:
    url = 'https://item.taobao.com/item.htm?spm=a230r.1.14.163.zx416O&id=534076017689&ns=1&abbucket=18#detail'
print 'URL:', url
m = raw_input('Enter main directory: ')
if len(m) < 1:
    m = 'main'
c = raw_input('Enter color directory: ')
if len(c) < 1:
    c = 'color'

html = urllib2.urlopen(url).read()
html = html.decode('gbk', 'ignore').encode('utf-8') # 转码
m_url = re.findall('(//.*?)_50', html)
c_url = re.findall('(//.*?jpg?)_30x30', html)
saveImg2(m_url, m)
saveImg2(c_url, c)

print u"\nHi~Finished~~~"

```

## 3.0

爬取阿里主图和颜色图

```python
# python 2.x
# encoding: utf-8
import urllib2
import re
import os
from BeautifulSoup import *

# 获取主图链接
def m_findImg(t1):
    m_img = t1.contents
    if len(m_img) > 1:
        im = str(m_img[1])
        if 'img' in im and 'png' not in im and len(re.findall('(https.*?).60', im)) > 0:
            m_url = re.findall('(https.*?).60', im)[0] + '.jpg'
            return m_url

# 获取颜色图链接
def c_findImg(t2):
    c_img = t2.contents
    if len(c_img) > 1:
        im = str(c_img[1])
        if 'img' in im and len(re.findall(' data-lazy-src="(https.*?).60x60', im)) > 0:
            c_url = re.findall(' data-lazy-src="(https.*?).60x60', im)[0] + '.jpg'
            return c_url 

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
    url = 'https://detail.1688.com/offer/????????.html'
print 'URL:', url
html = urllib2.urlopen(url).read()
html = html.decode('gbk', 'ignore').encode('utf-8') # 转码
soup = BeautifulSoup(html)

ml = list()
cl = list()
tags = soup('a')
for tag in tags:
    ml.append(m_findImg(tag))
    cl.append(c_findImg(tag))

n_ml = [x for x in ml if x is not None]
n_cl = [x for x in cl if x is not None]

m = raw_input('Enter main filename: ')
if len(m) < 1:
    m = 'main'
c = raw_input('Enter color filename: ')
if len(c) < 1:
    c = 'color'

saveImg2(n_ml, m)
saveImg2(n_cl, c)
```

### 3.1

爬取详情图片

```python
# 3.1
# encoding: utf-8
# python 2.x
import urllib2
from BeautifulSoup import *
import re
import os

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
    url = 'https://detail.1688.com/offer/????????.html'
html = urllib2.urlopen(url).read()
html = html.decode('gbk', 'ignore').encode('utf-8')
soup = BeautifulSoup(html)

img_url = soup.findAll("div", {"class" : "mod-detail-description mod-info mod"})
detail_url = re.findall('(https.*?)",', str(img_url[0]))[0]
detail_html = urllib2.urlopen(detail_url).read()
detail_html = detail_html.decode('gbk', 'ignore').encode('utf-8')
detail_img = re.findall('src.*?(https.*?jpg)', detail_html)

dl = list()
for img in detail_img:
    if 'x' not in img:
        print img
        dl.append(img)

d = raw_input('Enter detail filename: ')
if len(d) < 1:
    d = 'detail'

saveImg2(dl, d)
```

### 3.1.1

修复输入错误网址bug。

```python
# 3.1.1
# encoding: utf-8
# python 2.x
import urllib2
from BeautifulSoup import *
import re
import os

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

try:
    html = urllib2.urlopen(url).read()
except:
	print 'Please enter a url!'
	quit()

html = html.decode('gbk', 'ignore').encode('utf-8')
soup = BeautifulSoup(html)
img_url = soup.findAll("div", {"class" : "mod-detail-description mod-info mod"})

try:
    detail_url = re.findall('(https.*?)",', str(img_url[0]))[0]
except:
    print 'Please enter the right product url'
    quit()

detail_html = urllib2.urlopen(detail_url).read()
detail_html = detail_html.decode('gbk', 'ignore').encode('utf-8')
detail_img = re.findall('src.*?(https.*?jpg)', detail_html)

dl = list()
for img in detail_img:
    if 'x' not in img:
        #print img
        dl.append(img)

d = raw_input('Enter detail filename: ')
if len(d) < 1:
    d = 'detail'

saveImg2(dl, d)
````

### 3.1.2

修复未加密图片网址链接问题

```python
# 3.1.2
# encoding: utf-8
# python 2.x
import urllib2
from BeautifulSoup import *
import re
import os

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

try:
    html = urllib2.urlopen(url).read()
except:
	print 'Please enter a url!'
	quit()

html = html.decode('gbk', 'ignore').encode('utf-8')
soup = BeautifulSoup(html)
img_url = soup.findAll("div", {"class" : "mod-detail-description mod-info mod"})

try:
    detail_url = re.findall('(https.*?)",', str(img_url[0]))[0]
except:
    print 'Please enter the right product url'
    quit()

detail_html = urllib2.urlopen(detail_url).read()
detail_html = detail_html.decode('gbk', 'ignore').encode('utf-8')
detail_img = re.findall('src.*?(http.*?jpg)', detail_html)

dl = list()
for img in detail_img:
    if '0x' not in img: # 排除关联营销图片
        #print img
        dl.append(img)

d = raw_input('Enter detail filename: ')
if len(d) < 1:
    d = 'detail'

saveImg2(dl, d)
````

### 3.2 

获取阿里商品图片

```python
# python 2.x
# encoding: utf-8
import urllib2
import re
import os
from BeautifulSoup import *

# 获取主图链接
def m_findImg(t1):
    m_img = t1.contents
    if len(m_img) > 1:
        im = str(m_img[1])
        if 'img' in im and 'png' not in im and len(re.findall('(https.*?).60', im)) > 0:
            m_url = re.findall('(https.*?).60', im)[0] + '.jpg'
            return m_url

# 获取颜色图链接
def c_findImg(t2):
    c_img = t2.contents
    if len(c_img) > 1:
        im = str(c_img[1])
        if 'img' in im and len(re.findall(' data-lazy-src="(https.*?).60x60', im)) > 0:
            c_url = re.findall(' data-lazy-src="(https.*?).60x60', im)[0] + '.jpg'
            return c_url 

# 获取详情图片链接
def d_findImg(t3):
    img_url = t3.findAll("div", {"class" : "mod-detail-description mod-info mod"})
    detail_url = re.findall('(https.*?)",', str(img_url[0]))[0]
    detail_html = urllib2.urlopen(detail_url).read()
    detail_html = detail_html.decode('gbk', 'ignore').encode('utf-8')
    detail_img = re.findall('src.*?(http.*?jpg)', detail_html)
    dl = list()
    for img in detail_img:
        if '0x' not in img:
            dl.append(img)
    return dl

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
    url = 'https://detail.1688.com/offer/??????????.html'
print 'URL:', url
html = urllib2.urlopen(url).read()
html = html.decode('gbk', 'ignore').encode('utf-8') # 转码
soup = BeautifulSoup(html)

ml = list()
cl = list()
tags = soup('a')
for tag in tags:
    ml.append(m_findImg(tag))
    cl.append(c_findImg(tag))

n_ml = [x for x in ml if x is not None]
n_cl = [x for x in cl if x is not None]

m = raw_input('Enter main filename: ')
if len(m) < 1:
    m = 'main'
c = raw_input('Enter color filename: ')
if len(c) < 1:
    c = 'color'

d = raw_input('Enter main filename: ')
if len(d) < 1:
    d = 'detail'

saveImg2(n_ml, m)
saveImg2(n_cl, c)
saveImg2(d_findImg(soup), d)
```

### 3.2.1

修复re匹配bug

```python
# 3.2.1
# encoding: utf-8
# python 2.x
import urllib2
import re
import os
from BeautifulSoup import *

# 获取主图链接
def m_findImg(t1):
    m_img = t1.contents
    if len(m_img) > 1:
        im = str(m_img[1])
        if 'img' in im and 'png' not in im and len(re.findall('(https.*?).60x60', im)) > 0:
            m_url = re.findall('(https.*?).60x60', im)[0] + '.jpg'
            return m_url

# 获取颜色图链接
def c_findImg(t2):
    c_img = t2.contents
    if len(c_img) > 1:
        im = str(c_img[1])
        if 'img' in im and len(re.findall(' data-lazy-src="(https.*?).60x60', im)) > 0:
            c_url = re.findall(' data-lazy-src="(https.*?).60x60', im)[0] + '.jpg'
            return c_url 

# 获取详情图片链接
def d_findImg(t3):
    img_url = t3.findAll("div", {"class" : "mod-detail-description mod-info mod"})
    detail_url = re.findall('(https.*?)",', str(img_url[0]))[0]
    detail_html = urllib2.urlopen(detail_url).read()
    detail_html = detail_html.decode('gbk', 'ignore').encode('utf-8')
    detail_img = re.findall('src.*?(http.*?jpg)', detail_html)
    dl = list()
    for img in detail_img:
        if '0x' not in img:
            dl.append(img)
    return dl

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
    url = 'https://detail.1688.com/offer/??????????.html'
print 'URL:', url
html = urllib2.urlopen(url).read()
html = html.decode('gbk', 'ignore').encode('utf-8') # 转码
soup = BeautifulSoup(html)

ml = list()
cl = list()
tags = soup('a')
for tag in tags:
    ml.append(m_findImg(tag))
    cl.append(c_findImg(tag))

n_ml = [x for x in ml if x is not None]
n_cl = [x for x in cl if x is not None]

m = raw_input('Enter main filename: ')
if len(m) < 1:
    m = 'main'
c = raw_input('Enter color filename: ')
if len(c) < 1:
    c = 'color'

d = raw_input('Enter main filename: ')
if len(d) < 1:
    d = 'detail'

saveImg2(n_ml, m)
saveImg2(n_cl, c)
saveImg2(d_findImg(soup), d)
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

[python字符串decode中遇到非法字符的问题](http://www.cnblogs.com/baiyuyang/archive/2011/10/29/2228667.html)

[remove None value from a list without removing the 0 value](http://stackoverflow.com/questions/16096754/remove-none-value-from-a-list-without-removing-the-0-value)

[get div from HTML with Python](http://stackoverflow.com/questions/20975400/get-div-from-html-with-python)
