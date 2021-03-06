---
title: "Python导出Kindle笔记"
date: 2016-06-14
modified: 2016-08-17
categories:
  - Python
tags:
  - Python
  - Kindle
  - Issue
published: ture
excerpt: |
    程序会在桌面创建一个文件夹，为每一本书创建一个TXT文件，里面是每一本书的摘录（Kindle内的摘录是按时间顺序存放的），只保留下正文，位置、时间全都舍去。
---

* TOC
{:toc}

程序会在桌面创建一个文件夹，为每一本书创建一个TXT文件，里面是每一本书的摘录（Kindle内的摘录是按时间顺序存放的），只保留下正文，位置、时间全都舍去。

##  源代码

```python
# 1.0
# encoding: utf-8
import os
note_path='/Volumes/Kindle/documents/My Clippings.txt' #My Clippings文档路径
f=open(note_path,'r+') #打开Clippings文件
digest_path='/Users/yangxin/Desktop/digest/'#笔记保存位置
os.mkdir(digest_path) #新建digest文件夹
while True:
    onenote=[]
    for i in range(0,5):
        line=f.readline()
        if not line:
            exit()
        onenote.append(line)
    book_note=open('%s%s.txt'%(digest_path,onenote[0]),'a+')
    book_note.write(onenote[3]+'\n')
    book_note.close()
```

### 运行报错

  `IOError: [Errno 22] invalid mod ('a') or filename`

### 可能原因

中文编码问题

## 1.1

尝试解决编码问题[^1]

```python
# 1.1
# encoding: utf-8
import os
note_path='G:\documents\My Clippings.txt' #My Clippings文档路径
f=open(note_path,'r+') #打开Clippings文件
digest_path='/Users/Administrator/Desktop/digest/' #笔记保存位置
os.mkdir(digest_path) #新建digest文件夹
while True:
    onenote=[]
    for i in range(0,5):
        line=f.readline()
        if not line:
            exit()
        onenote.append(line)
    book_note=open('%s%s.txt'%(digest_path,onenote[0]),'a+','utf-8') # 添加'utf-8'
    book_note.write(onenote[3]+'\n')
    book_note.close()
```

### 运行报错

```python
lin14: book_note=open('%s%s.txt'%(digest_path,onenote[0]),'a+')  
TypeError: an integer is required
```

### 可能原因

```python
book_note=open('%s%s.txt'%(digest_path,onenote[0]),'a+','utf-8') # 添加'utf-8'
```
可能添加'utf-8'的方法不对

## 1.2

修复文件夹已存在问题[^2]

```python
# 1.2
# encoding: utf-8
import os
note_path='G:\documents\My Clippings.txt' 
f=open(note_path,'r+') 

# 检测目录是否存在
digest_path='/Users/Administrator/Desktop/digest/' 
if os.path.exists(digest_path):
	print digest_path + ' exits!'
else:
	os.mkdir(digest_path) 

while True:
    onenote=[]
    for i in range(0,5):
        line=f.readline()
        if not line:
            exit()
        onenote.append(line)
    book_note=open('%s%s.txt'%(digest_path,onenote[0]),'a+') 
    book_note.write(onenote[3]+'\n')
    book_note.close()
```

### 1.2.1

去除文件名中换行符[^3]

```python
# 1.2.1
# encoding: utf-8
import os
note_path='G:\documents\My Clippings.txt' 
f=open(note_path,'r+') 

# 检测目录是否存在
digest_path='/Users/Administrator/Desktop/digest/' 
if os.path.exists(digest_path):
	print digest_path + ' exits!'
else:
	os.mkdir(digest_path) 

while True:
    onenote=[]
    for i in range(0,5):
        line=f.readline()
        if not line:
            exit()
        onenote.append(line)
    # 去除换行符
    name = onenote[0].strip('\n')
    fname = '%s%s.txt'%(digest_path,name)
    book_note=open(fname,'a+','utf-8') 
    book_note.write(onenote[3]+'\n')
    book_note.close()
```

#### 问题

文件名乱码

### 1.2.2

修复中文名乱码[^4]

```python
# 1.2.2
# encoding: utf-8
import os
note_path='G:\documents\My Clippings.txt' 
f=open(note_path,'r+') 

# 检测目录是否存在
digest_path='/Users/Administrator/Desktop/digest/' 
if os.path.exists(digest_path):
	print digest_path + ' exits!'
else:
	os.mkdir(digest_path) 

while True:
    onenote=[]
    for i in range(0,5):
        line=f.readline()
        if not line:
            exit()
        onenote.append(line)
    # 去除换行符
    name = onenote[0].strip('\n')
    fname = '%s%s.txt'%(digest_path,name)
    # 修复中文名乱码
    book_note=open(fname.decode('utf-8'),'a+')
    book_note.write(onenote[3]+'\n')
    book_note.close()
```

#### 问题

部分文件无‘.txt’后缀

#### 可能原因

文件名不支持':'

### 1.2.3

修复文件名不支持符号（':'）问题

```python
# 1.2.3
# encoding: utf-8
import os
note_path='G:\documents\My Clippings.txt' 
f=open(note_path,'r+') 

# 检测目录是否存在
digest_path='/Users/Administrator/Desktop/digest/' 
if os.path.exists(digest_path):
	print digest_path + ' exits!'
else:
	os.mkdir(digest_path) 

while True:
    onenote=[]
    for i in range(0,5):
        line=f.readline()
        if not line:
            exit()
        onenote.append(line)
    # 去除换行符
    name = onenote[0].strip('\n').replace(':','-') # 替换文件名不支持符号
    fname = '%s%s.txt'%(digest_path,name)
    # 修复中文名乱码
    book_note=open(fname.decode('utf-8'),'a+')
    book_note.write(onenote[3]+'\n')
    book_note.close()
```

## 2.0

只输出笔记

```python
# 2.0
# encoding: utf-8
import os

note_path='G:\documents\My Clippings.txt' 
f=open(note_path,'r+') 

# 检测目录是否存在
digest_path='/Users/Administrator/Desktop/digest/' 
if os.path.exists(digest_path):
	print digest_path + ' exits!'
else:
	os.mkdir(digest_path) 

while True:
    onenote=[]
    for i in range(0,5):
        line=f.readline()
        if not line:
            exit()
        onenote.append(line)
    # 去除换行符
    name = onenote[0].strip('\n').replace(':','-') # 替换文件名不支持符号
    fname = '%s%s.txt'%(digest_path,name)
    # 修复中文名乱码
    book_note=open(fname.decode('utf-8'),'a+')
    book_note.write(onenote[3]+'\n')
    book_note.close()
```

### 2.0.1

删除空白笔记

```python
# 2.0.1
# encoding: utf-8
import os

note_path='G:\documents\My Clippings.txt' 
f=open(note_path,'r+') 

# 检测目录是否存在
digest_path='/Users/Administrator/Desktop/digest/' 
if os.path.exists(digest_path):
	print digest_path + ' exits!'
else:
	os.mkdir(digest_path) 

while True:
    onenote=[]
    for i in range(0,5):
        line=f.readline()
        if not line:
            exit()
        onenote.append(line)
    # 去除换行符
    name = onenote[0].strip('\n').replace(':','-') # 替换文件名不支持符号
    fname = '%s%s.txt'%(digest_path,name)
    # 修复中文名乱码
    book_note=open(fname.decode('utf-8'),'a+')
    # 删除空白笔记
    if len(onenote[3]) > 1:
        book_note.write(onenote[3]+'\n') 
    book_note.close()
```

### 2.0.2

优化文件保存目录

```python
# 2.0.2
# encoding: utf-8
import os

note_path='G:\documents\My Clippings.txt' 
f=open(note_path,'r+') 

path = os.getcwd() # 当前目录
# print path
digest_path='%s/digest/' %(path) # 在当前目录新建文件夹
# 检测目录是否存在
if os.path.exists(digest_path):
	print digest_path + ' exits!'
else:
	os.mkdir(digest_path) 

while True:
    onenote=[]
    for i in range(0,5):
        line=f.readline()
        if not line:
            exit()
        onenote.append(line)
    # 去除换行符
    name = onenote[0].strip('\n').replace(':','-') # 替换文件名不支持符号
    fname = '%s%s.txt'%(digest_path,name)
    # 修复中文名乱码
    book_note=open(fname.decode('utf-8'),'a+')
    # 删除空白笔记
    if len(onenote[3]) > 1:
        book_note.write(onenote[3]+'\n') 
    book_note.close()
```

### 2.0.3

自定义文件保持目录

```python
# 2.0.3
# encoding: utf-8
import os

note_path='G:\documents\My Clippings.txt' 
f=open(note_path,'r+') 

path = os.getcwd() # 当前目录
# 自定义保存目录
digest = raw_input('Enter the folder name: ')
if len(digest) < 1:
	digest = 'digest'
digest_path='%s/%s/' %(path, digest) # 在当前目录新建文件夹
# 检测目录是否存在
if os.path.exists(digest_path):
	print digest_path + ' exits!'
else:
	os.mkdir(digest_path) 

while True:
    onenote=[]
    for i in range(0,5):
        line=f.readline()
        if not line:
            exit()
        onenote.append(line)
    # 去除换行符
    name = onenote[0].strip('\n').replace(':','-') # 替换文件名不支持符号
    fname = '%s%s.txt'%(digest_path,name)
    # 修复中文名乱码
    book_note=open(fname.decode('utf-8'),'a+')
    # 删除空白笔记
    if len(onenote[3]) > 1:
        book_note.write(onenote[3]+'\n') 
    book_note.close()
```

### **2.0.4**

修复盘符变动问题

```python
# encoding: utf-8
# 2.0.4
# python 2.x
import os

# 输入kindle所在盘符
npath = raw_input('Enter kindle disk name: ').upper()
note_path='%s:\documents\My Clippings.txt' %(npath) 
try:  
   f=open(note_path,'r+') 
except:  
   print 'Please enter the right disk name!'
   quit() 

path = os.getcwd() # 当前目录
# 自定义保存目录
digest = raw_input('Enter the folder name: ')
if len(digest) < 1:
	digest = 'digest'
digest_path='%s/%s/' %(path, digest) # 在当前目录新建文件夹
# 检测目录是否存在
if os.path.exists(digest_path):
	print digest_path + ' exits!'
else:
	os.mkdir(digest_path) 

while True:
    onenote=[]
    for i in range(0,5):
        line=f.readline()
        if not line:
            exit()
        onenote.append(line)
    # 去除换行符
    name = onenote[0].strip('\n').replace(':','-') # 替换文件名不支持符号
    fname = '%s%s.txt'%(digest_path,name)
    # 修复中文名乱码
    book_note=open(fname.decode('utf-8'),'a+')
    # 删除空白笔记
    if len(onenote[3]) > 1:
        book_note.write(onenote[3]+'\n') 
    book_note.close()
```

### 2.0.5

```python
# encoding: utf-8
# 2.0.5
# python 2.x
import os
import os.path

# 输入kindle所在盘符
npath = raw_input('Enter kindle disk name: ').upper()
note_path='%s:\documents\My Clippings.txt' %(npath) 
try:  
   f=open(note_path,'r+') 
except:  
   print 'Please enter the right disk name!'
   quit() 

path = os.getcwd() # 当前目录
# 自定义保存目录
digest = raw_input('Enter the folder name: ')
if len(digest) < 1:
	digest = 'digest'
digest_path=os.path.join(path, digest)
# 检测目录是否存在
if os.path.exists(digest_path):
	print digest_path + ' exits!'
else:
	os.mkdir(digest_path)  # 在当前目录新建文件夹

while True:
    onenote=[]
    for i in range(0,5):
        line=f.readline()
        if not line:
            exit()
        onenote.append(line)
    # 去除换行符
    name = onenote[0].strip('\n').replace(':','-') # 替换文件名不支持符号
    fname = os.path.join(digest_path,name + '.txt')
    # 修复中文名乱码
    book_note=open(fname.decode('utf-8'),'a+')
    # 删除空白笔记
    if len(onenote[3]) > 1:
        book_note.write(onenote[3]+'\n') 
    book_note.close()
```

### **2.0.6**

尝试兼容mac

```python
# encoding: utf-8
# 2.0.6
# python 2.x
import os
import os.path

# 输入kindle所在盘符
npath = raw_input('Enter kindle disk name: ').upper()
a = '%s:\documents\My Clippings.txt' %(npath) 
b = '/Volumes/Kindle/documents/My Clippings.txt' 

for x in [a, b]:
	if os.path.isfile(x):
		note_path = x
try:  
   f=open(note_path,'r+') 
except:  
   print 'Please enter the right disk name!'
   quit() 

path = os.getcwd() # 当前目录
# 自定义保存目录
digest = raw_input('Enter the folder name: ')
if len(digest) < 1:
	digest = 'digest'
digest_path=os.path.join(path, digest)
# 检测目录是否存在
if os.path.exists(digest_path):
	print digest_path + ' exits!'
else:
	os.mkdir(digest_path)  # 在当前目录新建文件夹

while True:
    onenote=[]
    for i in range(0,5):
        line=f.readline()
        if not line:
            exit()
        onenote.append(line)
    # 去除换行符
    name = onenote[0].strip('\n').replace(':','-') # 替换文件名不支持符号
    fname = os.path.join(digest_path,name + '.txt')
    # 修复中文名乱码
    book_note=open(fname.decode('utf-8'),'a+')
    # 删除空白笔记
    if len(onenote[3]) > 1:
        book_note.write(onenote[3]+'\n') 
    book_note.close()
```

#### 2.0.6.1

```python
# -*- coding:utf-8 -*-
# 2.0.6.1
# python 2.x

import os
import os.path
from sys import argv

script, input_file = argv

try:  
   f=open(input_file,'r+') 
except:  
   print 'Please enter the right file!'
   quit() 

path = os.getcwd() # 当前目录
# 自定义保存目录
digest = raw_input('Enter the folder name: ')
if len(digest) < 1:
	digest = 'digest'
digest_path=os.path.join(path, digest)
# 检测目录是否存在
if os.path.exists(digest_path):
	print digest_path + ' exits!'
else:
	os.mkdir(digest_path)  # 在当前目录新建文件夹

while True:
    onenote=[]
    for i in range(0,5):
        line=f.readline()
        if not line:
            exit()
        onenote.append(line)
    # 去除换行符
    name = onenote[0].strip('\n').replace(':','-') # 替换文件名不支持符号
    fname = os.path.join(digest_path,name + '.txt')
    # 修复中文名乱码
    book_note=open(fname.decode('utf-8'),'a+')
    # 删除空白笔记
    if len(onenote[3]) > 1:
        book_note.write(onenote[3]+'\n') 
    book_note.close()
```

### **2.0.7**

```python
# -*- coding:utf-8 -*-
# 2.0.7
# python 2.x
import os
import os.path
from sys import argv

print """
        Kindle Clippings Export
"""
print '''
input_file = 'X:\documents\My Clippings.txt' in WINDOWNS\n
input_file = '/Volumes/Kindle/documents/My Clippings.txt' in MAC
'''
script, input_file = argv

try:  
   f = open(input_file,'r+') 
except:  
   print 'Please enter the right file path!'
   quit() 

path = os.getcwd() 
digest = raw_input('Enter the folder name: ')
if len(digest) < 1:
	digest = 'digest'
digest_path = os.path.join(path, digest)
if os.path.exists(digest_path):
	print digest_path + ' exits!'
else:
	os.mkdir(digest_path)  

while True:
    onenote = []
    for i in range(0,5):
        line = f.readline()
        if not line:
            exit()
        onenote.append(line)
 
    name = onenote[0].strip('\n').replace(':','-') # 替换文件名不支持符号
    fname = os.path.join(digest_path,name + '.txt')
    # 修复中文名乱码
    book_note = open(fname.decode('utf-8'),'a+')
    # 删除空白笔记
    if len(onenote[3]) > 1:
        book_note.write(onenote[3]+'\n') 
    book_note.close()

print u"\nHi~Finished~~~"
```

### 2.0.8

```python
# -*- coding:utf-8 -*-

"""This is a test Python program.
Written by Linus Liu mail@puhemo.xyz

This program was designed for Python 2, not Python 3.
"""

import os
import os.path
from sys import argv

print """
        Kindle Clippings Export
"""
print '''
input_file = 'X:\documents\My Clippings.txt' in WINDOWNS\n
input_file = '/Volumes/Kindle/documents/My Clippings.txt' in MAC
'''
script, input_file = argv

try:  
   f = open(input_file,'r+') 
except:  
   print 'Please enter the right file path!'
   quit() 

if not os.path.exists("./digest/"):
    os.mkdir("./digest/")

while True:
    onenote = []
    for i in range(0,5):
        line = f.readline()
        if not line:
            exit()
        onenote.append(line)

    name = onenote[0].strip('\n').replace(':','-') # 替换文件名不支持符号
    fname = os.path.join("./digest/", name + '.txt')
    # 修复中文名乱码
    book_note = open(fname.decode('utf-8'),'a+')
    # 删除空白笔记
    if len(onenote[3]) > 1:
        book_note.write(onenote[3]+'\n') 
    book_note.close()

print u"\nHi~Finished~~~"
```

## 2.1

输出笔记和标记位置和时间

```python
# 2.1
# encoding: utf-8
import os

note_path='G:\documents\My Clippings.txt' 
f=open(note_path,'r+') 

# 检测目录是否存在
digest_path='/Users/Administrator/Desktop/digest/' 
if os.path.exists(digest_path):
	print digest_path + ' exits!'
else:
	os.mkdir(digest_path) 

while True:
    onenote=[]
    for i in range(0,5):
        line=f.readline()
        if not line:
            exit()
        onenote.append(line)
    # 去除换行符
    name = onenote[0].strip('\n').replace(':','-') # 替换文件名不支持符号
    fname = '%s%s.txt'%(digest_path,name)
    # 修复中文名乱码
    book_note=open(fname.decode('utf-8'),'a+')
    book_note.write(onenote[1]+'\n'+onenote[3]+'\n'+onenote[4]+'\n')
    book_note.close()
```

### 2.1.1

删除空白笔记

```python
# 2.1.1
# encoding: utf-8
import os

note_path='G:\documents\My Clippings.txt' 
f=open(note_path,'r+') 

# 检测目录是否存在
digest_path='/Users/Administrator/Desktop/digest/' 
if os.path.exists(digest_path):
	print digest_path + ' exits!'
else:
	os.mkdir(digest_path) 

while True:
    onenote=[]
    for i in range(0,5):
        line=f.readline()
        if not line:
            exit()
        onenote.append(line)
    # 去除换行符
    name = onenote[0].strip('\n').replace(':','-') # 替换文件名不支持符号
    fname = '%s%s.txt'%(digest_path,name)
    # 修复中文名乱码
    book_note=open(fname.decode('utf-8'),'a+')
    if len(onenote[3]) > 1:
        book_note.write(onenote[1]+'\n'+onenote[3]+'\n'+onenote[4]+'\n') 
    book_note.close()
```

### **2.1.2**

更新参考 2.0.2， 2.0.3，2.0.4

```python
# encoding: utf-8
# 2.1.2
# python 2.x
import os

# 输入kindle所在盘符
npath = raw_input('Enter kindle disk name: ').upper()
note_path='%s:\documents\My Clippings.txt' %(npath) 
try:  
   f=open(note_path,'r+') 
except:  
   print 'Please enter the right disk name!'
   quit() 

path = os.getcwd() # 当前目录
# 自定义保存目录
digest = raw_input('Enter the folder name: ')
if len(digest) < 1:
	digest = 'digest'
digest_path='%s/%s/' %(path, digest) # 在当前目录新建文件夹
# 检测目录是否存在
if os.path.exists(digest_path):
	print digest_path + ' exits!'
else:
	os.mkdir(digest_path) 

while True:
    onenote=[]
    for i in range(0,5):
        line=f.readline()
        if not line:
            exit()
        onenote.append(line)
    # 去除换行符
    name = onenote[0].strip('\n').replace(':','-') # 替换文件名不支持符号
    fname = '%s%s.txt'%(digest_path,name)
    # 修复中文名乱码
    book_note=open(fname.decode('utf-8'),'a+')
    # 删除空白笔记
    if len(onenote[3]) > 1:
        book_note.write(onenote[1]+'\n'+onenote[3]+'\n'+onenote[4]+'\n') 
    book_note.close()
```

## 3.0

```python
# -*- coding:utf-8 -*-

"""This is a test Python program.
Written by Linus Liu mail@puhemo.xyz
This program was designed for Python 3, not Python 2.
Usage: Clippings.py <text files> - Exports note to text files.
"""

import os
import os.path
import codecs
from sys import argv

print("""
        Kindle Clippings Export
""")
print('''
input_file = 'X:\documents\My Clippings.txt' in WINDOWNS\n
input_file = '/Volumes/Kindle/documents/My Clippings.txt' in MAC
''')

assert os.path.exists(argv[1]), 'This path does not exist!'
f = open(argv[1],'r+', encoding="utf8")

if not os.path.exists("./digest/"):
    os.mkdir("./digest/")

while True:
    onenote = []
    for i in range(0,5):
        line = f.readline()
        if not line:
            print("\nHi~Finished~~~")
            exit()
        onenote.append(line)
    name = onenote[0].strip('\n').replace(':','-') # 替换文件名不支持符号
    fname = os.path.join("./digest/", name + '.txt')
    # 修复中文名乱码
    book_note = open(fname,'a+', encoding="utf8")
    # 删除空白笔记
    if len(onenote[3]) > 1:
        book_note.write(onenote[3]+'\n') 
    book_note.close()
```


## 推荐阅读

[https://www.zhihu.com/question/23031778#](https://www.zhihu.com/question/23031778#): 代码来源

[调试](http://www.liaoxuefeng.com/wiki/001374738125095c955c1e6d8bb493182103fac9270762a000/00138683229901532c40b749184441dbd428d2e0f8aa50e000)

[python读写不同编码txt文件 ](http://blog.csdn.net/zm2714/article/details/8012474)

[python报错UnicodeDecodeError: 'ascii' codec can't decode byte 0xe5 in position 4: ordinal not in range ](http://blog.csdn.net/a657941877/article/details/9063883)

[10.1. os.path — 常用路径名操作](http://python.usyiyi.cn/python_278/library/os.path.html)

[Python文件夹与文件的操作](http://www.cnblogs.com/yuxc/archive/2011/08/01/2124012.html)

[^1]: [简单解决Python文件中文编码问题](http://m.jb51.net/article/75247.htm)
[^2]: [Python文件目录判断和创建 ](http://blog.csdn.net/andrewhunter/article/details/21938945)
[^3]: [python按行读取文件，如何去掉换行符"\n" ](http://blog.csdn.net/jfkidear/article/details/7532293)
[^4]: [Python2操作中文名文件乱码解决方案](http://www.cnblogs.com/suke99/p/5664265.html)
