---
title: "The top 10 most common words"
date: 2016-06-25 11:04
modified: 2016-06-25
categories:
  - Python
tags:
  - Python
  - Utilities
published: true
excerpt: |
  A dictionary is a mapping between a set of indices(which are called keys) and a set of values.  
---

```python
import string # A Module
fname = raw_input('Enter the file name: ')
if len(fname) < 1: fname = 'romeo-full.txt'
fhand = open(fname)
#fhand = open('romeo-full.txt')
counts = dict()
for line in fhand:
    words = line.translate(None, string.punctuation).lower().split()
    # remove all punctuation
    #line = line.translate(None, string.punctuation)
    #line = line.lower()
    #words = line.split()
    for word in words:
        counts[word] = counts.get(word, 0) + 1
        #if word not in counts:
        #    counts[word] = 1
        #else:
        #    counts[word] += 1
#print counts
lst = sorted([(val, key) for key, val in counts.items()], reverse=True)
#print lst
# Sort the dictionary by value
#lst = list()
#for key, val in counts.items():
#    lst.append( (val, key) )

#lst.sort(reverse=True)

for key, val in lst[:10] :
    print key, val
```
