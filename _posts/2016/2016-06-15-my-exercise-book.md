---
title: "My Python exercise book"
date: 2016-06-15
modified: 2016-06-15
categories:
  - Python
tags:
  - Python 2.x
  - Python Exercise
  - Error
excerpt: |
  My Python exercise book
---

# Getting Started with Python

## Assignment 3.3--Error

```python
score = raw_input("Enter Score: ")
try:
    score = float(score) and score <= 1
except:
    print "Error"
    quit()
if score >= 0.9:
    print "A"
elif score >= 0.8:
    print "B"
elif score >= 0.7:
    print "C"
elif score >= 0.6:
    print "D"
elif score < 0.6:
    print "F"
```

I get F whatever number I input.

> Try printing score (shown above in my edit). You'll find that this form of assignment using the 'and' operator will return a True or False. The mathematical value of True is 1 and False is 0. So since your assignment of score evaluates to False, it is less than 0.6 and returns an 'F'.

### Notice: 
1. Assignment using  the 'and' operator(**Logical Operators**) will return a True or False
2. The mathematical value of True is 1 and False is 0
3. print is a way to find error!

# Python in codecademy

## purify

Define a function called purify that takes in a list of numbers, removes all odd numbers in the list, and returns the result.

For example, purify([1,2,3]) should return [2].

> Do not directly modify the list you are given as input; instead, return a new list with only the even numbers.

```python
def purify(x):
    for n in x:
        if n%2 != 0:
            x.remove(n)
            continue
    return x

print purify([4, 5, 5, 4])
#prints [4, 5, 4]
```

> remove() changes the list index in the loop

```python
def purify(x):
    y = list()
    for n in x:
        if n%2 == 0:
            y.append(n)
    return y
    
print purify([4, 5, 5, 4])
#prints [4, 4]
```



