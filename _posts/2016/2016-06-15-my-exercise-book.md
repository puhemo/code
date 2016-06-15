---
title: "My Python exercise book"
date: 2016-06-15
modified: 2016-06-15
categories:
  - Python
tags:
  - Python
  - Exercise
  - Error
excerpt: |
  My Python exercise book
---

My Python exercise book

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
1. Assignment using  the 'and' operator will return a True or False
2. The mathematical value of True is 1 and False is 0
3. print is a way to find error!
