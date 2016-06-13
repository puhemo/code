---
title:  "Python Synax--Conditional Steps, repeated steps, loop"
date: 2016-06-13
modified: 2016-06-13
published: true
categories: 
  - Python
tags:
  - Python
  - Syntax
excerpt: |
    ## Conditional Steps - if ... elif .. else

Python条件语句是通过一条或多条语句的执行结果（True或者False）来决定执行的代码块。

```python
  if (expression):
     (command)
  elif (expression):
     (command)
  else:
     (command)
```
---

* TOC
{:toc}

## Conditional Steps - if ... elif .. else

Python条件语句是通过一条或多条语句的执行结果（True或者False）来决定执行的代码块。

```python
  if (expression):
     (command)
  elif (expression):
     (command)
  else:
     (command)
```

<!-- more -->

## Conditional Steps (Multi elif) - if ... elif .. else

```python
  if x < 0:
      x = 0
      print 'negative changed to zero'
  elif x == 0:
      print 'zero'
  elif x == 1:
      print 'single'
  elif x == 2:
      print 'double'
  else:
      print 'more'
```

## Repeated steps - while
Python 编程中 while 语句用于循环执行程序，即在某条件下，循环执行某段程序，以处理需要重复处理的相同任务

```python
  while i < 6:
      print "At the top i is %d" % i
```

## Repeated steps- another example

Python 编程中 while 语句用于循环执行程序，即在某条件下，循环执行某段程序，以处理需要重复处理的相同任务

  Assign a value to i which is greater than 2

```python
  while i > 2:
      print "Right now i is %d" % i
      i=i-1
```

## Loop - for
Python for循环可以遍历任何序列的项目，如一个列表或者一个字符串

```python
  for (y) in (x):
      (command)
```

## 参考链接
[Pythonlearn:resources-week01](https://share.coursera.org/wiki/index.php/Pythonlearn:resources-week01)
[Python 基础教程](http://www.runoob.com/python/python-if-statement.html)