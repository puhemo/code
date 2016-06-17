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
    # Conditional Execution

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

# Loops and Iteration

## "is" and "is not" Operators

"is" can be used in logical expressions.

It implies 'is exactly the same instance, type and value'.

>  '==' should be used more frequently than 'is' and 'is not' as these operators are intended for specific situations. 'is' and 'is not' are best used when testing for specific values like "None" or "True/False". '==' is best used for testing numeric values. (i.e. 'if i == 4')

## The `while` statement

Python 编程中 while 语句用于循环执行程序，即在某条件下，循环执行某段程序，以处理需要重复处理的相同任务

We need while loops when you don't know the number of iterations before hand and want to execute a bunch of code until some **condition** is satisfied.

```python
while i < 6:
    print "At the top i is %d" % i
```

```python
# Assign a value to i which is greater than 2
while i > 2:
    print "Right now i is %d" % i
    i=i-1
```

## “Infinite loops” and `break`

Sometimes you don’t know it’s time to end a loop until you get half way through the body. In that case you can write an infinite loop on purpose and then use the `break` statement to **jump out of the loop**.

```python
while True:
    line = raw_input('> ')
    if line == 'done':
        break
    print line
print 'Done!'
```

## Finishing iterations with `continue`

Sometimes you are in an iteration of a loop and want to finish the current iteration and immediately **jump to the next iteration**.In that case you can use the `continue` statement to skip to the next iteration without finishing the body of the loop for the current iteration.

`Continue` is needed for a piece of code like this:

```python
loop= 0
count= 0
running_total= 0
while loop ==0:
    inp= raw_input ("Enter a number:")
    
    if inp== "done" or inp== "Done" :
        break   
    try:
        num= float(inp)
    except:
        print "Invalid input. Please insert a number or type done to finish"
        continue    

    count= count + 1
    running_total= running_total + num
 
print count," numbers input" 
print running_total," total"
print "and average:", running_total/count
```

to clarify, `continue` is needed here because **without it any bad input will not stop the iteration**. this will mess up the count and the running total.

## Definite loops using `for`

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
