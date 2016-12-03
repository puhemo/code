---
title: "Python Spider test01"
date: 2016-07-24
modified: 2016-08-22
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
    url = 'https://item.taobao.com/item.htm????????'
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

### 2.0.5

```python
# encoding: utf-8
# python 2.x
# 2.0.5
import urllib2
import re
import os

print """
        Taobao Item Image Spider
"""

# 保存单个图片
def saveImg(img_URL,img_name, img_folder):
    req = urllib2.Request(img_URL, headers = {
        'Connection': 'Keep-Alive',
        'Accept': 'text/html, application/xhtml+xml, */*',
        'Accept-Language': 'en-US,en;q=0.8,zh-Hans-CN;q=0.5,zh-Hans;q=0.3',
        'User-Agent': 'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0) like Gecko'
    }) #伪装浏览器
    oper = urllib2.urlopen(req)
    data = oper.read()
    path = os.getcwd() 
    img_path = '%s/%s/' %(path, img_folder)
    if not os.path.exists(img_path):
        os.mkdir(img_path)
    fname = '%s%s.jpg'%(img_path,img_name)
    f = open(fname, 'wb')
    f.write(data)
    f.close()

# 批量保存图片
def saveImg2(url_list, folder):
    n = 0
    for link in url_list:
        n = n + 1
        link = 'https:' + link
        print "\nGET %s %d >>> " % (folder, n) + link
        saveImg(link, str(n), folder)

url = raw_input('Enter Taobao Url - ')
if len(url) < 1:
    url = 'https://item.taobao.com/item.htm??????????'
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

### 2.0.6

换用requests库[^2][^3][^4]

```python
# python 2.x
# encoding: utf-8
try:
    import re
    import os
    import requests
except Exception as error:
    print "MISSING SOME MODULE(s)"
    print (error)
    os.system("pip install requests")
    print "TRY TO INSTALL SOME MODs"
    print "PLEASE UPGRADE PIP IF IT DOESN'T WORK "
    print "Restart this Program!"
    exit(-2)

print """
        Taobao Item Image Spider
"""

# 保存单个图片
def saveImg(img_URL,img_name, img_folder):
    req = requests.get(img_URL)
    headers = {
        'Connection': 'Keep-Alive',
        'Accept': 'text/html, application/xhtml+xml, */*',
        'Accept-Language': 'en-US,en;q=0.8,zh-Hans-CN;q=0.5,zh-Hans;q=0.3',
        'User-Agent': 'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0) like Gecko'
    }
    req = requests.get(img_URL, headers = headers, timeout = 10)
    data = req.content
    path = os.getcwd() 
    img_path = '%s/%s/' %(path, img_folder)
    if not os.path.exists(img_path):
        os.mkdir(img_path)
    fname = '%s%s.jpg'%(img_path,img_name)
    f = open(fname, 'wb')
    f.write(data)
    f.close()

# 批量保存图片
def saveImg2(url_list, folder):
    n = 0
    for link in url_list:
        n = n + 1
        link = 'https:' + link
        print "\nGET %s %d >>> " % (folder, n) + link
        saveImg(link, str(n), folder)

url = raw_input('Enter Taobao Url - ')
if len(url) < 1:
    url = 'https://item.taobao.com/item.htm??????'
print 'URL:', url
m = raw_input('Enter main directory: ')
if len(m) < 1:
    m = 'main'
c = raw_input('Enter color directory: ')
if len(c) < 1:
    c = 'color'

html = requests.get(url).content
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

### 3.0.1 

优化代码

```python
# python 2.x
# encoding: utf-8
# 3.0.1
import urllib2
import re
import os

print """
        1688 Item Image Spider
"""

# 保存单个图片
def saveImg(img_URL,img_name, img_folder):
    req = urllib2.Request(img_URL, headers = {
        'Connection': 'Keep-Alive',
        'Accept': 'text/html, application/xhtml+xml, */*',
        'Accept-Language': 'en-US,en;q=0.8,zh-Hans-CN;q=0.5,zh-Hans;q=0.3',
        'User-Agent': 'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0) like Gecko'
    }) #伪装浏览器
    oper = urllib2.urlopen(req)
    data = oper.read()
    path = os.getcwd() 
    img_path = '%s/%s/' %(path, img_folder)
    if not os.path.exists(img_path):
        os.mkdir(img_path)
    fname = '%s%s.jpg'%(img_path,img_name)
    f = open(fname, 'wb')
    f.write(data)
    f.close()

# 批量保存图片
def saveImg2(url_list, folder):
    n = 0
    for link in url_list:
        n = n + 1
        link += '.jpg'
        print "\nGET %s %d >>> " % (folder, n) + link
        saveImg(link, str(n), folder)

url = raw_input('Enter 1688 Url - ')
if len(url) < 1:
    url = 'https://detail.1688.com/offer/xxxxxxxxx'
print 'URL:', url
m = raw_input('Enter main directory: ')
if len(m) < 1:
    m = 'main'
c = raw_input('Enter color directory: ')
if len(c) < 1:
    c = 'color'

html = urllib2.urlopen(url).read()
html = html.decode('gbk', 'ignore').encode('utf-8') # 转码

i_url = re.findall('(https.*?).60x60', html)

m_url = list()
c_url = list()
for u in i_url:
    if 'data-lazy-src' not in u:
        m_url.append(u)
    else:
        u =  re.findall('data-lazy-src="(https.*)', u)[0]
        c_url.append(u)

saveImg2(m_url, m)
saveImg2(c_url, c)

print u"\nHi~Finished~~~"
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

#### 3.1.1

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

#### 3.1.2

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

#### **3.2.1**

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

#### **3.2.2**

优化代码

```python
# python 2.x
# encoding: utf-8
import urllib2
import re
import os

print """
        1688 Item Image Spider
"""

# 获取链接
def find_url(item_url, img_re):
    html = urllib2.urlopen(item_url).read()
    html = html.decode('gbk', 'ignore').encode('utf-8')
    url = re.findall(img_re, html)
    return url

# 保存单个图片
def saveImg(img_URL,img_name, img_folder):
    req = urllib2.Request(img_URL, headers = {
        'Connection': 'Keep-Alive',
        'Accept': 'text/html, application/xhtml+xml, */*',
        'Accept-Language': 'en-US,en;q=0.8,zh-Hans-CN;q=0.5,zh-Hans;q=0.3',
        'User-Agent': 'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0) like Gecko'
    }) #伪装浏览器
    oper = urllib2.urlopen(req)
    data = oper.read()
    path = os.getcwd() 
    img_path = '%s/%s/' %(path, img_folder)
    if not os.path.exists(img_path):
        os.mkdir(img_path)
    fname = '%s%s.jpg'%(img_path,img_name)
    f = open(fname, 'wb')
    f.write(data)
    f.close()

# 批量保存图片
def saveImg2(url_list, folder):
    n = 0
    for link in url_list:
        n = n + 1
        if 'jpg' not in link:
            link += '.jpg'
        print "\nGET %s %d >>> " % (folder, n) + link
        saveImg(link, str(n), folder)

url = raw_input('Enter 1688 Url - ')
if len(url) < 1:
    url = 'https://detail.1688.com/offer/xxxxxx'
print 'URL:', url
m = raw_input('Enter main filename: ')
if len(m) < 1:
    m = 'main'
c = raw_input('Enter color filename: ')
if len(c) < 1:
    c = 'color'

d = raw_input('Enter main filename: ')
if len(d) < 1:
    d = 'detail'

m_re = '(https.*?).60x60'
c_re = 'imageUrl.*?(https.*?)\",\"name'
d_re = 'data-tfs-url="(https.*?)" data'
d_img_re = 'img alt.*? src.*?(//.*?jpg)'

m_url = [m_img_url for m_img_url in find_url(url, m_re) if  'data-lazy-src' not in m_img_url]
c_url = find_url(url, c_re)

d_html = find_url(url, d_re)[0]
dl = find_url(d_html, d_img_re)
d_url = ['https:' + d_img_url for d_img_url in dl]

saveImg2(m_url, m)
saveImg2(c_url, c)
saveImg2(d_url, d)

print u"\nHi~Finished~~~"
```

#### 3.2.3

图片大小筛选[^1]

```python
# python 2.x
# encoding: utf-8
import urllib2
import re
import os
from PIL import Image
import StringIO

print """
        1688 Item Image Spider
"""

# 获取链接
def find_url(item_url, img_re):
    html = urllib2.urlopen(item_url).read()
    html = html.decode('gbk', 'ignore').encode('utf-8')
    url = re.findall(img_re, html)
    return url

# 保存单个图片
def saveImg(img_URL,img_name, img_folder):
    req = urllib2.Request(img_URL, headers = {
        'Connection': 'Keep-Alive',
        'Accept': 'text/html, application/xhtml+xml, */*',
        'Accept-Language': 'en-US,en;q=0.8,zh-Hans-CN;q=0.5,zh-Hans;q=0.3',
        'User-Agent': 'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0) like Gecko'
    }) #伪装浏览器
    oper = urllib2.urlopen(req)
    data = oper.read()
    f = StringIO.StringIO(data)
    im = Image.open(f)
    ### 宽/高的像素小于300
    if im.size[0] < 300 or im.size[1] < 300:
        print "\nGET <<< USELESS IMG"
        im.close()
        return
    path = os.getcwd() 
    img_path = '%s/%s/' %(path, img_folder)
    if not os.path.exists(img_path):
        os.mkdir(img_path)
    fname = '%s%s.jpg'%(img_path,img_name)
    f = open(fname, 'wb')
    f.write(data)
    f.close()

# 批量保存图片
def saveImg2(url_list, folder):
    n = 0
    for link in url_list:
        n = n + 1
        if 'jpg' not in link:
            link += '.jpg'
        print "\nGET %s %d >>> " % (folder, n) + link
        saveImg(link, str(n), folder)

url = raw_input('Enter 1688 Url - ')
if len(url) < 1:
    url = 'https://detail.1688.com/offer/xxxxxxx'
print 'URL:', url
m = raw_input('Enter main filename: ')
if len(m) < 1:
    m = 'main'
c = raw_input('Enter color filename: ')
if len(c) < 1:
    c = 'color'

d = raw_input('Enter main filename: ')
if len(d) < 1:
    d = 'detail'

m_re = '(https.*?).60x60'
c_re = 'imageUrl.*?(https.*?)\",\"name'
d_re = 'data-tfs-url="(https.*?)" data'
d_img_re = 'img alt.*? src.*?(//.*?jpg)'

m_url = [m_img_url for m_img_url in find_url(url, m_re) if  'data-lazy-src' not in m_img_url]
c_url = find_url(url, c_re)

d_html = find_url(url, d_re)[0]
dl = find_url(d_html, d_img_re)
d_url = ['https:' + d_img_url for d_img_url in dl]

saveImg2(m_url, m)
saveImg2(c_url, c)
saveImg2(d_url, d)

print u"\nHi~Finished~~~"
```

#### 3.2.4

换用Requests库

```python
# python 2.x
# encoding: utf-8
try:
    import re
    import os
    from PIL import Image
    import StringIO
    import requests
except Exception as error:
    print "MISSING SOME MODULE(s)"
    print (error)
    os.system("pip install requests Image")
    print "TRY TO INSTALL SOME MODs"
    print "PLEASE UPGRADE PIP IF IT DOESN'T WORK "
    print "Restart this Program!"
    exit(-2)

print """
        1688 Item Image Spider
"""

# 获取链接
def find_url(item_url, img_re):
    html = requests.get(item_url).content
    url = re.findall(img_re, html)
    return url

# 保存单个图片
def saveImg(img_URL,img_name, img_folder):
    req = requests.get(img_URL)
    headers = {
        'Connection': 'Keep-Alive',
        'Accept': 'text/html, application/xhtml+xml, */*',
        'Accept-Language': 'en-US,en;q=0.8,zh-Hans-CN;q=0.5,zh-Hans;q=0.3',
        'User-Agent': 'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0) like Gecko'
    }
    req = requests.get(img_URL, headers = headers, timeout = 10)
    data = req.content
    f = StringIO.StringIO(data)
    im = Image.open(f)
    ### 宽/高的像素小于300
    if im.size[0] < 300 or im.size[1] < 300:
        print "\nGET <<< USELESS IMG"
        im.close()
        return
    path = os.getcwd() 
    img_path = '%s/%s/' %(path, img_folder)
    if not os.path.exists(img_path):
        os.mkdir(img_path)
    fname = '%s%s.jpg'%(img_path,img_name)
    f = open(fname, 'wb')
    f.write(data)
    f.close()

# 批量保存图片
def saveImg2(url_list, folder):
    n = 0
    for link in url_list:
        n = n + 1
        if 'jpg' not in link:
            link += '.jpg'
        print "\nGET %s %d >>> " % (folder, n) + link
        saveImg(link, str(n), folder)

url = raw_input('Enter 1688 Url - ')
if len(url) < 1:
    url = 'https://detail.1688.com/offer/xxxx'
print 'URL:', url
m = raw_input('Enter main filename: ')
if len(m) < 1:
    m = 'main'
c = raw_input('Enter color filename: ')
if len(c) < 1:
    c = 'color'

d = raw_input('Enter main filename: ')
if len(d) < 1:
    d = 'detail'

m_re = '(https.*?).60x60'
c_re = 'imageUrl.*?(https.*?)\",\"name'
d_re = 'data-tfs-url="(https.*?)" data'
d_img_re = 'img alt.*? src.*?(//.*?jpg)'

m_url = [m_img_url for m_img_url in find_url(url, m_re) if  'data-lazy-src' not in m_img_url]
c_url = find_url(url, c_re)

d_html = find_url(url, d_re)[0]
dl = find_url(d_html, d_img_re)
d_url = ['https:' + d_img_url for d_img_url in dl]

saveImg2(m_url, m)
saveImg2(c_url, c)
saveImg2(d_url, d)

print u"\nHi~Finished~~~"
```

#### 3.2.5

```python
# python 2.x
# encoding: utf-8
try:
    import re
    import os
    from PIL import Image
    import StringIO
    import requests
except Exception as error:
    print "MISSING SOME MODULE(s)"
    print (error)
    os.system("pip install requests Image")
    print "TRY TO INSTALL SOME MODs"
    print "PLEASE UPGRADE PIP IF IT DOESN'T WORK "
    print "Restart this Program!"
    exit(-2)

print """
        1688 Item Image Spider
"""

# 获取链接
def find_url(url, img_re):
    html = requests.get(url).content
    img_url_list = re.findall(img_re, html)
    return img_url_list

# 图片名
def Img_name(folder, name):
    img_path = './%s/' %(folder)
    if not os.path.exists(img_path):
        os.mkdir(img_path)
    fname = '%s%s.jpg'%(img_path,name)
    return fname

# 保存单个图片
def saveImg(img_url,name, folder):
    headers = {
        'Connection': 'Keep-Alive',
        'Accept': 'text/html, application/xhtml+xml, */*',
        'Accept-Language': 'en-US,en;q=0.8,zh-Hans-CN;q=0.5,zh-Hans;q=0.3',
        'User-Agent': 'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0) like Gecko'
    }
    req = requests.get(img_url, headers = headers, timeout = 10)
    data = req.content
    f = StringIO.StringIO(data)
    im = Image.open(f)
    ### 宽/高的像素小于300
    if im.size[0] < 300 or im.size[1] < 300:
        print "\nGET <<< USELESS IMG"
        im.close()
        return
    img = Img_name(folder, name)
    f = open(img, 'wb')
    f.write(data)
    f.close()

# 批量保存图片
def saveImg2(url_list, folder):
    n = 0
    for link in url_list:
        n = n + 1
        if 'jpg' not in link:
            link += '.jpg'
        print "\nGET %s %d >>> " % (folder, n) + link
        saveImg(link, str(n), folder)

url = raw_input('Enter 1688 Url - ')
if len(url) < 1:
    url = 'https://detail.1688.com/offer/532666501125.html?spm=a2615.2177701.0.0.4BMixz'
print 'URL:', url
m = raw_input('Enter main folder name: ')
if len(m) < 1:
    m = 'main'
c = raw_input('Enter color folder name: ')
if len(c) < 1:
    c = 'color'
d = raw_input('Enter detail folder name: ')
if len(d) < 1:
    d = 'detail'

m_re = '(https.*?).60x60'
c_re = 'imageUrl.*?(https.*?)\",\"name'
d_re = 'data-tfs-url="(https.*?)" data'
d_img_re = 'img alt.*? src.*?(//.*?jpg)'

m_url = [m_img_url for m_img_url in find_url(url, m_re) if  'data-lazy-src' not in m_img_url]
c_url = find_url(url, c_re)

d_html = find_url(url, d_re)[0]
dl = find_url(d_html, d_img_re)
d_url = ['https:' + d_img_url for d_img_url in dl]

saveImg2(m_url, m)
saveImg2(c_url, c)
saveImg2(d_url, d)

print u"\nHi~Finished~~~"
```

## 4.0[^5][^6]

```python
# python 2.x
# encoding: utf-8
try:
    import re
    import os
    import sys
    import requests
    from datetime import datetime
except Exception as error:
    print "MISSING SOME MODULE(s)"
    print (error)
    os.system("pip install requests")
    print "TRY TO INSTALL SOME MODs"
    print "PLEASE UPGRADE PIP IF IT DOESN'T WORK "
    print "Restart this Program!"
    exit(-2)

print """
        Taobao Best Sellers Image Spider
"""

# 获取链接
def find_url(url, img_re):
    html = requests.get(url).content
    img_url_list = re.findall(img_re, html)
    return img_url_list

# 图片名
def Img_name(folder, name):
    img_path = './%s/' %(folder)
    if not os.path.exists(img_path):
        os.mkdir(img_path)
    fname = '%s%s.jpg'%(img_path,name)
    return fname

# 保存单个图片
def saveImg(img_url,name, folder):
    req = requests.get(img_url)
    headers = {
        'Connection': 'Keep-Alive',
        'Accept': 'text/html, application/xhtml+xml, */*',
        'Accept-Language': 'en-US,en;q=0.8,zh-Hans-CN;q=0.5,zh-Hans;q=0.3',
        'User-Agent': 'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0) like Gecko'
    }
    req = requests.get(img_url, headers = headers, timeout = 10)
    data = req.content
    img = Img_name(folder, name)
    f = open(img, 'wb')
    f.write(data)
    f.close()

# 批量保存图片
def saveImg2(url_list, folder):
    n = 0
    for link in url_list:
        n = n + 1
        if 'jpg' not in link and 'SS2' not in link and 'png' not in link:
            link += '.jpg'
        print "\nGET %s %d >>> " % (folder, n) + link
        saveImg(link, str(n), folder)

list = list()

print 'Please input the keyword'
keyword = raw_input('>').decode(sys.stdin.encoding)
now = datetime.now()
date = now.strftime('%Y%m%d')

url = 'https://s.taobao.com/search?q=%s&imgfile=&commend=all&ssid=s5-e&search_type=item&sourceId=tb.index&spm=a21bo.50862.201856-taobao-item.1&ie=utf8&initiative_id=tbindexz_%d&sort=sale-desc' % (keyword, int(date))

print 'Please input the number of pages (Default 10)\n'
pages = raw_input('>')
pages = int(pages if pages.isdigit() and pages > 0 else 10)
for n in range(pages):
    url += '&p4ppushleft=%2C44&s=' + str(44*n)
    list.append(url)

n = 0
for url in list:
    n += 1
    folder = 'Page%d' % n
    img_re = 'pic_url\":\"(//g.*?)\"'
    img_url_list = ['https:' + img_url for img_url in find_url(url, img_re)]
    saveImg2(img_url_list, folder)
```

### 4.0.1

换用json

```python
# python 2.x
# encoding: utf-8
try:
    import re
    import os
    import sys
    import requests
    import json
    from datetime import datetime
except Exception as error:
    print "MISSING SOME MODULE(s)"
    print (error)
    os.system("pip install requests")
    print "TRY TO INSTALL SOME MODs"
    print "PLEASE UPGRADE PIP IF IT DOESN'T WORK "
    print "Restart this Program!"
    exit(-2)

print """
        Taobao Best Sellers Image Spider
"""

# 获取链接
def find_url(url, g_page_re):
    html = requests.get(url).content
    g_page = re.findall(g_page_re, html)[0]
    info = json.loads(g_page)
    detail = info["mods"]["itemlist"]["data"]["auctions"]
    img_url_list = []
    for item in detail:
        img_url_list.append(item['pic_url'])
    return img_url_list
# 图片名
def Img_name(folder, name):
    img_path = './%s/' %(folder)
    if not os.path.exists(img_path):
        os.mkdir(img_path)
    fname = '%s%s.jpg'%(img_path,name)
    return fname

# 保存单个图片
def saveImg(img_url,name, folder):
    headers = {
        'Connection': 'Keep-Alive',
        'Accept': 'text/html, application/xhtml+xml, */*',
        'Accept-Language': 'en-US,en;q=0.8,zh-Hans-CN;q=0.5,zh-Hans;q=0.3',
        'User-Agent': 'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0) like Gecko'
    }
    req = requests.get(img_url, headers = headers, timeout = 10)
    data = req.content
    img = Img_name(folder, name)
    f = open(img, 'wb')
    f.write(data)
    f.close()

# 批量保存图片
def saveImg2(url_list, folder):
    n = 0
    for link in url_list:
        n = n + 1
        if 'jpg' not in link and 'SS2' not in link and 'png' not in link:
            link += '.jpg'
        print "\nGET %s %d >>> " % (folder, n) + link
        saveImg(link, str(n), folder)

list = list()

print 'Please input the keyword'
keyword = raw_input('>').decode(sys.stdin.encoding)
now = datetime.now()
date = now.strftime('%Y%m%d')

url = 'https://s.taobao.com/search?q=%s&imgfile=&commend=all&ssid=s5-e&search_type=item&sourceId=tb.index&spm=a21bo.50862.201856-taobao-item.1&ie=utf8&initiative_id=tbindexz_%d&sort=sale-desc' % (keyword, int(date))

print 'Please input the number of pages (Default 10)\n'
pages = raw_input('>')
pages = int(pages if pages.isdigit() and pages > 0 else 10)
for n in range(pages):
    url += '&p4ppushleft=%2C44&s=' + str(44*n)
    list.append(url)

n = 0
for url in list:
    n += 1
    folder = 'Page%d' % n
    g_page_re = 'g_page_config = ({.*?});'
    img_url_list = ['https:' + img_url for img_url in find_url(url, g_page_re)]
    saveImg2(img_url_list, folder)
```

## 4.1[^7][^8][^9][^10][^11]

```python
try:
    import json
    import re
    import requests
    import sys
    import pandas as pd
    import numpy as np
    from datetime import datetime
except Exception as error:
    print "MISSING SOME MODULE(s)"
    print (error)
    os.system("pip install requests pandas numpy")
    print "TRY TO INSTALL SOME MODs"
    print "PLEASE UPGRADE PIP IF IT DOESN'T WORK "
    print "Restart this Program!"
    exit(-2)

print """
        Taobao Best Sellers info Spider
"""

def to_csv(url, n):
    g_page_re = 'g_page_config = ({.*?});'
    html = requests.get(url).content
    g_page = re.findall(g_page_re, html)[0]
    info = json.loads(g_page)
    detail = info["mods"]["itemlist"]["data"]["auctions"]

    detail_url_list = []
    pic_url_list = []
    user_id_list = []
    raw_title_list = []
    nick_list = []
    view_price_list = []
    shopLink_list = []
    view_sales_list = []
    comment_count_list = []

    for item in detail:
        detail_url_list.append(item['detail_url'])
        pic_url_list.append(item['pic_url'])
        user_id_list.append(item['user_id'])
        raw_title_list.append(item['raw_title'])
        nick_list.append(item['nick'])
        view_price_list.append(item['view_price'])
        shopLink_list.append(item['shopLink'])
        view_sales_list.append(item['view_sales'])
        comment_count_list.append(item['comment_count'])


    df = pd.DataFrame({'raw_title': raw_title_list,
                        'user_id': user_id_list,
                        'nick': nick_list,
                        'view_sales': view_sales_list,
                        'view_price': view_price_list,
                        'comment_count': comment_count_list,
                        'detail_url': detail_url_list,
                        'shopLink': shopLink_list,
                        'pic_url': pic_url_list}, index = range(1, 45))

    df.to_csv('Page%d.csv' % n, encoding="gbk")

list = list()

print 'Please input the keyword'
keyword = raw_input('>').decode(sys.stdin.encoding)
now = datetime.now()
date = now.strftime('%Y%m%d')

url = 'https://s.taobao.com/search?q=%s&imgfile=&commend=all&ssid=s5-e&search_type=item&sourceId=tb.index&spm=a21bo.50862.201856-taobao-item.1&ie=utf8&initiative_id=tbindexz_%d&sort=sale-desc' % (keyword, int(date))

print 'Please input the number of pages (Default 10)\n'
pages = raw_input('>')
pages = int(pages if pages.isdigit() and pages > 0 else 10)
for n in range(pages):
    url += '&p4ppushleft=%2C44&s=' + str(44*n)
    list.append(url)

n = 0
for url in list:
    n += 1
    to_csv(url, n)

print u"\nHi~Finished~~~"
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

## 5.0

按分类下载主图

```python
#! python3
# encoding: utf-8
try:
    import re
    import os
    import sys
    import requests
    import bs4
except Exception as error:
    print("MISSING SOME MODULE(s)")
    print (error)
    os.system("pip install requests")
    print("TRY TO INSTALL SOME MODs")
    print("PLEASE UPGRADE PIP IF IT DOESN'T WORK ")
    print("Restart this Program!")
    exit(-2)
	
print("""
        Taobao Image Spider
""")

# 保存图片
def saveImg(url, folder, path):
    print("\nGET %s >>> %s " % (folder, url))
    headers = {
        'Connection': 'Keep-Alive',
        'Accept': 'text/html, application/xhtml+xml, */*',
        'Accept-Language': 'en-US,en;q=0.8,zh-Hans-CN;q=0.5,zh-Hans;q=0.3',
        'User-Agent': 'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0) like Gecko'
    }
    res = requests.get(url, headers = headers, timeout = 10)
    data = res.content
    f = open(path, 'wb')
    f.write(data)
    f.close()

def res(url):
    res = requests.get(url)
    res.raise_for_status()
    soup = bs4.BeautifulSoup(res.text, "html.parser")
    return soup

try:
    url = input('category url >')
    c_re = '-(\d+).htm'
    category = re.findall(c_re, url)[0]
except:
    print('Please input category url!')
    exit(-2)

soup = res(url)
widgetid = soup.select('div[data-title="宝贝列表"]')[0].get('data-widgetid')
domain = 'https:' + soup.select('.shop-name')[0].select('.J_TGoldlog')[0].get('href')
pageUrl = '/i/asynSearch.htm?mid=w-%s-0&wid=%s&path=/category-%s.htm&pageNo=' % (widgetid, widgetid, category)
pageUrl = domain + pageUrl
pageUrls = []
pageNum = input('Page number > ')
for m in range(1, int(pageNum) + 1):
    page = pageUrl + str(m)
    pageUrls.append(page)

f = 0
for page_url in pageUrls:
    f += 1
    folder = 'Page' + str(f)
    os.makedirs(folder, exist_ok=True)
    Soup = res(page_url)
    img = Soup.select('dt > a > img')
    imgUrls = []
    for im in img:
        img_re = '(//.*?)_\d\d\d'
        imgUrl = 'https:' + re.findall(img_re, im.get('src'))[0]
        imgUrls.append(imgUrl)

    dd = Soup.select('dd')
    paths = []
    n = 0
    for cprice in dd:
        n += 1
        try:
            price = cprice.select('div > div')[0].select('span')[1].getText()
        except:
            print("\nHi~Finished~~~")
            exit(-2)
        fname = str(n) + '_' + price + '.jpg'
        path = os.path.join(folder, fname)
        paths.append(path)

    for url, path in zip(imgUrls, paths):
        saveImg(url, folder, path)

print("\nHi~Finished~~~")
```
## 5.1

获取阿里图片

```python
#! python3
# encoding: utf-8

try:
    import os
    import json
    import re
    from io import BytesIO
    from PIL import Image
    import bs4
    import requests
except Exception as error:
    print("MISSING SOME MODULE(s)")
    print (error)
    os.system("pip install beautifulsoup4 Pillow requests ")
    print("TRY TO INSTALL SOME MODs")
    print("PLEASE UPGRADE PIP IF IT DOESN'T WORK ")
    print("Restart this Program!")
    exit(-2)

print("""
        1688 Item Image Spider
""")

def saveImg(imgUrl, folder):
    n = 0
    for url in imgUrl:
        n = n + 1
        print("\nGET %s %d >>> " % (folder, n) + url)
        # 伪装浏览器
        headers = {
            'Connection': 'Keep-Alive',
            'Accept': 'text/html, application/xhtml+xml, */*',
            'Accept-Language': 'en-US,en;q=0.8,zh-Hans-CN;q=0.5,zh-Hans;q=0.3',
            'User-Agent': 'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0) like Gecko'
        }
        res = requests.get(url, headers = headers, timeout = 10)
        res.raise_for_status()
        data = res.content
        im = Image.open(BytesIO(data))
        ### 宽/高的像素小于300
        if im.size[0] < 300 or im.size[1] < 300:
            print("\nGET <<< USELESS IMG")
            im.close()
            return
        # 保存图片
        imgFolder = os.path.join(baseFolder, folder)
        os.makedirs(imgFolder, exist_ok=True)
        imgName = str(n) + '.jpg'
        f = open(os.path.join(imgFolder, imgName), 'wb')
        f.write(data)
        f.close()

url = input('Enter 1688 Url - ')
if len(url) < 1:
    url = 'https://detail.1688.com/offer/44677887013.html'
print('URL:', url)
baseFolder = os.path.basename(url).split('.')[0]

res = requests.get(url)
res.raise_for_status()
soup = bs4.BeautifulSoup(res.text, "html.parser")

# 获取主图颜色图链接
m_urls = []
els= soup.select('li[data-imgs]')
for el in els:
    data = el.get('data-imgs')
    url = json.loads(data)['original']
    m_urls.append(url)

# 获取详情图片链接
elems = soup.select('#desc-lazyload-container')
html =  elems[0].get('data-tfs-url')
data = requests.get(html).text
d_re = 'img alt.*? src.*?(//.*?jpg)'
d_urls = ['https:' + d_url for d_url in re.findall(d_re, data)]

saveImg(m_urls, 'main')
saveImg(d_urls, 'detail')

print("\nHi~Finished~~~")
```

## 5.2 

Taobao Best Sellers Image Spider

```python
#! python3
# encoding: utf-8
try:
    import re
    import os
    import sys
    import requests
    import json
    from datetime import datetime
except Exception as error:
    print("MISSING SOME MODULE(s)")
    print (error)
    os.system("pip install requests")
    print("TRY TO INSTALL SOME MODs")
    print("PLEASE UPGRADE PIP IF IT DOESN'T WORK ")
    print("Restart this Program!")
    exit(-2)

print("""
        Taobao Best Sellers Image Spider
""")

# 保存图片
def saveImg(urls, folder):
    n = 0
    for link in urls:
        n = n + 1
        imgFolder = os.path.join(date+keyword, folder)
        os.makedirs(imgFolder, exist_ok=True)
        imgName = str(n) + '-' + id[link] + '.jpg'
        fname = os.path.join(imgFolder, imgName)
        link = 'https:' + link
        print("\nGET %s %d >>> " % (folder, n) + link)
        headers = {
            'Connection': 'Keep-Alive',
            'Accept': 'text/html, application/xhtml+xml, */*',
            'Accept-Language': 'en-US,en;q=0.8,zh-Hans-CN;q=0.5,zh-Hans;q=0.3',
            'User-Agent': 'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0) like Gecko'
        }
        req = requests.get(link, headers = headers, timeout = 10)
        data = req.content
        f = open(fname, 'wb')
        f.write(data)
        f.close()

# 获取搜索链接
pageUrls = []
print('Please input the keyword')
keyword = input('>')
now = datetime.now()
date = now.strftime('%Y%m%d')
url = 'https://s.taobao.com/search?q=%s&imgfile=&commend=all&ssid=s5-e&search_type=item&sourceId=tb.index&spm=a21bo.50862.201856-taobao-item.1&ie=utf8&initiative_id=tbindexz_%d&sort=sale-desc' % (keyword, int(date))
print('Please input the number of pages (Default 10)\n')
pages = input('>')
pages = int(pages if pages.isdigit() and int(pages) > 0 else 10)
for n in range(pages):
    url += '&p4ppushleft=%2C44&s=' + str(44*n)
    pageUrls.append(url)

# 获取图片链接
n = 0
for url in pageUrls:
    n += 1
    folder = 'Page%d' % n
    html = requests.get(url).text
    img_re = 'g_page_config = ({.*?});'
    g_page = re.findall(img_re, html)[0]
    info = json.loads(g_page)
    detail = info["mods"]["itemlist"]["data"]["auctions"]
    id, img_urls = {}, []
    for item in detail:
        img_urls.append(item['pic_url'])
        id[item['pic_url']] = item['nick']
    saveImg(img_urls, folder)
```

## 5.3

Taobao Item Image Spider

```python
#! python3
# encoding: utf-8

try:
    import os
    import re
    import bs4
    import requests
except Exception as error:
    print("MISSING SOME MODULE(s)")
    print (error)
    os.system("pip install beautifulsoup4 requests ")
    print("TRY TO INSTALL SOME MODs")
    print("PLEASE UPGRADE PIP IF IT DOESN'T WORK ")
    print("Restart this Program!")
    exit(-2)
print("""
        Taobao Item Image Spider
""")

def saveName(folder, name):
    Folder = os.path.join(itemId, folder)
    os.makedirs(Folder, exist_ok=True)
    fname =  os.path.join(Folder, name)
    return fname

# 保存单个图片
def saveImg(imgDict):
    for url in imgDict.keys():
        print("\nGET %s >>> " % url)
        headers = {
            'Connection': 'Keep-Alive',
            'Accept': 'text/html, application/xhtml+xml, */*',
            'Accept-Language': 'en-US,en;q=0.8,zh-Hans-CN;q=0.5,zh-Hans;q=0.3',
            'User-Agent': 'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0) like Gecko'
        }
        res = requests.get(url, headers = headers, timeout = 10)
        data = res.content
        f = open(imgDict[url], 'wb')
        f.write(data)
        f.close()

url = input('Enter Taobao Url - ')
if len(url) < 1:
    url = 'https://item.taobao.com/item.htm?spm=a230r.1.14.163.zx416O&id=534076017689&ns=1&abbucket=18#detail'
print('URL:', url)
itemId = re.findall('id=(\d+)', url)[0]

res = requests.get(url)
res.raise_for_status()
soup = bs4.BeautifulSoup(res.text, "html.parser")

m_dict = {}
els = soup.select('div[class="tb-pic tb-s50"] > a > img')
n = 0
for el in els:
    n += 1
    m_name = str(n) + '.jpg'
    mName = saveName('main', m_name)
    m_data = el.get('data-src').split('_')
    m_url = 'https:' + '_'.join(m_data[:len(m_data)-1])
    m_dict[m_url] = mName

c_dict = {}
cels = soup.select('li[data-value] > a')
for cel in cels:
    c_name = cel.getText().strip('\n') + '.jpg'
    cName = saveName('color', c_name)
    c_data = cel.get('style')
    c_url = 'https:' + re.findall('(//.*?jpg?)_30x30', c_data)[0]
    c_dict[c_url] = cName

saveImg(m_dict)
saveImg(c_dict)
print("\nHi~Finished~~~")
```

## Reference

[简洁的python，简洁的urllib,保存图片](http://blog.csdn.net/wwaiym/article/details/5829471) 

[零基础自学用Python 3开发网络爬虫(三): 伪装浏览器君](https://jecvay.com/2014/09/python3-web-bug-series3.html)

[用python2和python3伪装浏览器爬取网页](http://www.cnblogs.com/blueel/archive/2013/01/31/2886600.html)

[urllib与urllib2的学习总结(python2.7.X)](http://www.cnblogs.com/wly923/archive/2013/05/07/3057122.html)

[python字符串decode中遇到非法字符的问题](http://www.cnblogs.com/baiyuyang/archive/2011/10/29/2228667.html)

[remove None value from a list without removing the 0 value](http://stackoverflow.com/questions/16096754/remove-none-value-from-a-list-without-removing-the-0-value)

[get div from HTML with Python](http://stackoverflow.com/questions/20975400/get-div-from-html-with-python)

[Python读取网络图片](http://liulixiang1988.github.io/pythondu-qu-wang-luo-tu-pian.html)

[Python图像处理库：PIL中Image,ImageDraw等基本模块介绍](http://www.cnblogs.com/wei-li/archive/2012/04/19/2456725.html)

[PIL 简明教程 - 基本用法 ](http://liam0205.me/2015/04/22/pil-tutorial-basic-usage/)

[TaobaoSearchImageBot/TSIB.py](https://github.com/hafrans/TaobaoSearchImageBot/blob/master/TSIB.py)

[^1]: [Python:PIL库处理网络图片利用StringIO避免中途写入文件到硬盘](http://www.polarxiong.com/archives/python-pil-stringio.html)
[^2]: [Python爬虫利器一之Requests库的用法](http://cuiqingcai.com/2556.html)
[^3]: [Requests--快速上手](http://docs.python-requests.org/zh_CN/latest/user/quickstart.html)
[^4]: [Requests--高级用法](http://docs.python-requests.org/zh_CN/latest/user/advanced.html)
[^5]: [[Python爬虫] 中文编码问题：raw_input输入、文件读取、变量比较等str、unicode、utf-8转换问题](http://blog.csdn.net/eastmount/article/details/48841593)
[^6]: [Python 2.7中使用raw_input输入中文时的编码转换](http://www.sijitao.net/2216.html)
[^7]: [10 Minutes to pandas](http://pandas.pydata.org/pandas-docs/stable/10min.html)
[^8]: [pandas读写文件乱码问题](http://blog.sina.com.cn/s/blog_54b09dc90102vfms.html)
[^9]: [3.2:pandas数据的导入与导出【CSV，JSON】](http://www.cnblogs.com/pengsixiong/p/5050833.html)
[^10]: [Pandas之DataFrame操作 ](http://blog.csdn.net/u013045749/article/details/48370007)
[^11]: [pandas怎样处理中文？](https://www.zhihu.com/question/22016184)
