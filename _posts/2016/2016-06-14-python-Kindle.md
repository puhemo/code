---
title: "Python导出Kindle笔记"
date: 2016-06-14
modified: 2016-08-01
categories:
  - Python
tags:
  - Python 2.x
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

暂未发现

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
    book_note=open('%s%s.txt'%(digest_path,onenote[0]),'a+','utf-8') 
    book_note.write(onenote[3]+'\n')
    book_note.close()
```

### 1.2.1

去除文件名中换行符[^3]

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
    # 去除换行符
    name = onenote[0].strip('\n')
    fname = '%s%s.txt'%(digest_path,name)
    book_note=open(fname,'a+','utf-8') 
    book_note.write(onenote[3]+'\n')
    book_note.close()
```

## 推荐阅读

[https://www.zhihu.com/question/23031778#](https://www.zhihu.com/question/23031778#): 代码来源

[调试](http://www.liaoxuefeng.com/wiki/001374738125095c955c1e6d8bb493182103fac9270762a000/00138683229901532c40b749184441dbd428d2e0f8aa50e000)

[python读写不同编码txt文件 ](http://blog.csdn.net/zm2714/article/details/8012474)

[python报错UnicodeDecodeError: 'ascii' codec can't decode byte 0xe5 in position 4: ordinal not in range ](http://blog.csdn.net/a657941877/article/details/9063883)

[^1]: [简单解决Python文件中文编码问题](http://m.jb51.net/article/75247.htm)
[^2]: [Python文件目录判断和创建 ](http://blog.csdn.net/andrewhunter/article/details/21938945)
[^3]: [python按行读取文件，如何去掉换行符"\n" ](http://blog.csdn.net/jfkidear/article/details/7532293)
