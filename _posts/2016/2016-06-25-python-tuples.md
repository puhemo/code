---
title: "Python Part 09: Tuples"
date: 2016-06-25 10:36
modified: 2016-07-21
categories:
  - Python
tags:
  - Python Syntax
  - Python 2.x
published: true
excerpt: |
  A tuple is a sequence of values much like a list. The important difference is that tuples are immutable.  
series: "Intro to Python"	
---
{% include series.html %}

* TOC
{:toc}

A tuple is a sequence of values much like a list. The important difference is that tuples are **immutable**[^1].tuples are surrounded by ()s and can contain any data type.

Syntactically, a tuple is a comma-separated list of values:

```python
>>> t = 'a', 'b', 'c', 'd', 'e'

# it is not necessary, but common to enclose tuples in parentheses.
>>> t = ('a', 'b', 'c', 'd', 'e')

# Include the final comma
>>> t1 = ('a',)
>>> type(t1)
<type 'tuple'>

# Without the final comma
>>> t2 = ('a')
>>> type(t2)
<type 'str'>
```

> To write a tuple containing a single value you have to include a comma, even though there is only one value.

## Accessing Values in Tuples:

To access values in tuple, use the square brackets for slicing along with the index or indices to obtain value available at that index. For example −

```python
tup1 = ('physics', 'chemistry', 1997, 2000);
tup2 = (1, 2, 3, 4, 5, 6, 7 );

print "tup1[0]: ", tup1[0]
print "tup2[1:5]: ", tup2[1:5]
```

When the above code is  executed, it produces the following result −

```
tup1[0]:  physics
tup2[1:5]:  [2, 3, 4, 5]
```

## Updating Tuples

Tuples are **immutable** which means you cannot update or change the values of tuple elements. You are able to take portions of existing tuples to create new tuples as the following example demonstrates −

```python
tup1 = (12, 34.56);
tup2 = ('abc', 'xyz');

# Following action is not valid for tuples
# tup1[0] = 100;

# So let's create a new tuple as follows
tup3 = tup1 + tup2;
print tup3
```

When the above code is executed, it produces the following result −

```
(12, 34.56, 'abc', 'xyz')
```

## Basic Tuples Operations

Tuples respond to the `+` and `*` operators much like strings; they mean concatenation and repetition here too, except that the result is a new tuple, not a string.

In fact, tuples respond to all of the general sequence operations we used on strings in the prior chapter −

| Python Expression            | Results                      | Description   |
| ---------------------------- | ---------------------------- | ------------- |
| len((1, 2, 3))               | 3                            | Length        |
| (1, 2, 3) + (4, 5, 6)        | (1, 2, 3, 4, 5, 6)           | Concatenation |
| ('Hi!',) * 4                 | ('Hi!', 'Hi!', 'Hi!', 'Hi!') | Repetition    |
| 3 in (1, 2, 3)               | True                         | Membership    |
| for x in (1, 2, 3): print x, | 1 2 3                        | Iteration     |

## Functions  and Methods

### tuple()

```python
>>> t = tuple()
>>> print t
()

# If the argument is a sequence (string, list, or tuple), the result of the call to tuple is a tuple with the elements of the sequence
>>> t = tuple('lupins')
>>> print t
('l', 'u', 'p', 'i', 'n', 's')
```

The method tuple() converts a list of items into tuples:

```python
aList = (123, 'xyz', 'zara', 'abc');
aTuple = tuple(aList)

print "Tuple elements : ", aTuple
```

## Comparing tuples

The comparison operators work with tuples and other sequences.Python starts by comparing the first element from each sequence. If they are equal, it goes on to the next element,and so on, until it finds elements that differ. **Subsequent elements are not considered** (even if they are really big).

```python
>>> (0, 1, 2) < (0, 3, 4)
True
>>> (0, 1, 2000000) < (0, 3, 4)
True
```

```python
# build a list of tuples.
txt = 'but soft what light in yonder window breaks'
words = txt.split()
t = list()
for word in words:
   t.append((len(word), word))
# [(3, 'but'), (4, 'soft'), (4, 'what'), (5, 'light'), (2, 'in'), (6, 'yonder'), (6, 'window'), (6, 'breaks')]

# The keyword argument reverse=True tells sort to go in decreasing order.
t.sort(reverse=True)

# traverses the list of tuples and builds a list of words in descending order of length.
res = list()
for length, word in t:
    res.append(word)

print res
```

## Tuple assignment

```python
(x,y) = (4, 'fred')
print y
fred
```

Both sides of this statement are tuples, but the left side is a tuple of **variables**; the right side is a tuple of **expressions**. 

## Dictionaries and tuples

The  [items()](http://puhemo.xyz/code/python-dictionary/#items)  method in dictionaries returns a list of  (key, value) -- tuples.

```python
>>> d = {'a':10, 'b':1, 'c':22}
>>> t = d.items() 
>>> t
[('a', 10), ('c', 22), ('b', 1)]
>>> t.sort()
>>> t
[('a', 10), ('b', 1), ('c', 22)]
```

### sorted()

A built-in function `sorted` that takes a sequence as a parameter and returns a sorted sequence.

```python
>>> d = {'a':10, 'b':1, 'c':22}
>>> d.items()
[('a', 10), ('c', 22), ('b', 1)]
>>> t = sorted(d.items())
>>> t
[('a', 10), ('b', 1), ('c', 22)]
>>> for k, v in sorted(d.items()):
...    print k, v
...
a 10
b 1
c 22
```

## Multiple assignment with dictionaries

Sort by values instead of key:

```python
>>> d = {'a':10, 'b':1, 'c':22}
>>> l = list()
>>> for key, val in d.items() :
...     l.append( (val, key) )
... 
>>> l
[(10, 'a'), (22, 'c'), (1, 'b')]
>>> l.sort(reverse=True)
>>> l
[(22, 'c'), (10, 'a'), (1, 'b')] #sort by value
>>> 
```

## The most common words

Remove all punctuation by using the string methods  `punctuation`[^3] and `translate`[^2].

### .translate()

```python
string.translate(s, table[, deletechars])
```

### .punctuation()

```python
>>> import string
>>> string.punctuation
'!"#$%&\'()*+,-./:;<=>?@[\\]^_`{|}~'
```

### The top 10 most common words:

```python
import string # A Module
fhand = open('romeo-full.txt')
counts = dict()
for line in fhand:
    # remove all punctuation
    line = line.translate(None, string.punctuation) # Method:`.translate()`, `punctuation()`
    line = line.lower()
    words = line.split()
    for word in words:
        if word not in counts:
            counts[word] = 1
        else:
            counts[word] += 1

# Sort the dictionary by value
lst = list()
for key, val in counts.items():
    lst.append( (val, key) )

lst.sort(reverse=True)

for key, val in lst[:10] :
    print key, val
```

## List comprehension

[List comprehension](http://puhemo.xyz/code/python-lists/#list-comprehensions) creates a dynamic list.  In this case, we make a list of reversed tuples and then sort it.

```python
>>> c = {'a':10, 'b':1, 'c':22}

>>> print sorted( [ (v,k) for k,v in c.items() ] )

[(1, 'b'), (10, 'a'), (22, 'c')]
```

## The top 10 most common words

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

## More Info

[Pythonlearn:resources-week10](https://share.coursera.org/wiki/index.php/Pythonlearn:resources-week10)  
[Python Tuples](http://www.tutorialspoint.com/python/python_tuples.htm)

[^1]: Tuples can only count and index!
[^2]: Delete all characters from s that are in deletechars (if present), and then translate the characters using table, which must be a 256-character string giving the translation for each character value, indexed by its ordinal. If table is None, then only the character deletion step is performed.
[^3]: The list of charactersthat it considers “punctuation”

{% include series.html %}
