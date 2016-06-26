---
title: "The top 10 most common words"
date: 2016-06-25 11:04
modified: 2016-06-25
categories:
  - Python
tags:
  - Python 2.x
  - Utilities
published: true
excerpt: |
  Use python to find the top 10 most common words in a txt file.
---

```python
import string # A Module
fname = raw_input('Enter the file name: ')
try:
    fhand = open(fname)
except: 
    print 'File cannot be opened:', fname
    exit()

counts = dict()
for line in fhand:
    words = line.translate(None, string.punctuation).lower().split()
    for word in words:
        counts[word] = counts.get(word, 0) + 1

lst = sorted([(val, key) for key, val in counts.items()], reverse=True)
for key, val in lst[:10] :
    print key, val
```



test:

```python
import string # A Module
fname = raw_input('Enter the file name: ')
try:
    fhand = open(fname)
except: 
    print 'File cannot be opened:', fname
    exit()

counts = dict()
for line in fhand:
    words = line.translate(None, string.punctuation).lower().split()
    for word in words:
        counts[word] = counts.get(word, 0) + 1

lst = sorted([(val, key) for key, val in counts.items()], reverse=True)

n = raw_input('Enter the number: ')
try:
	n = int(n)
except:
	print 'Please enter an integer:', n
	exit()

for key, val in lst[:n] :
    print key, val
```
