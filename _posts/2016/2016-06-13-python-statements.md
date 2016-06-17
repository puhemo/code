---
title:  "Python Syntax: Conditional Steps and Iteration"
date: 2016-06-13
modified: 2016-06-15
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
series: "Intro to Python"	
---

 {% include series.html %}

* TOC
{:toc}

# Conditional Execution

Python条件语句是通过一条或多条语句的执行结果（True或者False）来决定执行的代码块。

> We end the if statement with a **colon (:)** and lines after the if statement are **indented**.

## Conditional Statements

Conditional statements let Python know it is about to enter a decision-making structure.

### Conditional Steps (Multi elif) - if ... elif .. else

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

###  Nested Conditionals

You can also have one or more conditional statements indented as a subset of a parent conditional, forming a hierarchy of nested conditional logic:

```python
 if x == y :
     print 'x and y are equal'
 else :
     if x < y :
         print 'x is less than y'
     elif x > y :
         print 'x is greater than y'
```

##  Try/Except

Try/Except - Beginning with `try,` Python tests the first operation. If the operation fails, then it proceeds to follow the instructions in `except.` If the `try` is successful then `except` is skipped.

```python
test = raw_input("Enter an integer:")  
try:  
   test = int(test)  
except:  
   print "Invalid entry."
   quit()  
result = test * 2  
print result  
```

# Repeated steps - while
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

# Loop - for
Python for循环可以遍历任何序列的项目，如一个列表或者一个字符串

```python
  for (y) in (x):
      (command)
```

# More Info
* [Pythonlearn:resources-week01](https://share.coursera.org/wiki/index.php/Pythonlearn:resources-week01)
* [Pythonlearn:resources-week03](https://share.coursera.org/wiki/index.php/Pythonlearn:resources-week03)
* [Python 基础教程](http://www.runoob.com/python/python-if-statement.html)

 {% include series.html %}
