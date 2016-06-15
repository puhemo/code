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
