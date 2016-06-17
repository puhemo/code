---
title: "Python导出Kindle笔记"
date: 2016-06-14
modified: 2016-06-14
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

## 修改1

参考推荐阅读[^1]修改

```python
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

lin14: book_note=open('%s%s.txt'%(digest_path,onenote[0]),'a+')  
TypeError: an integer is required

### 可能原因

暂未发现

## 源代码来源

[https://www.zhihu.com/question/23031778#](https://www.zhihu.com/question/23031778#)

## 推荐阅读

[^1]: [简单解决Python文件中文编码问题](http://m.jb51.net/article/75247.htm)
