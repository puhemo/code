---
title: "Python Part 08: Dictionaries"
date: 2016-06-24 09:47
modified: 2016-06-25
categories:
  - Python
tags:
  - Python Syntax
  - Python 2.x
published: true
excerpt: |
  A dictionary is a mapping between a set of indices(which are called keys) and a set of values.  
series: "Intro to Python"	
---
{% include series.html %}

* TOC
{:toc}

A dictionary is similar to a list, but you access values by looking up a **key** instead of an index.  

A dictionary is a mapping between a set of indices(which are called keys) and a set of values. The association of a key and a value is called a **key-value pair** or sometimes an item.  

Dictionaries are enclosed in curly braces, like so:

```python
d = {'key1' : 1, 'key2' : 2, 'key3' : 3}
```

## New Entries

Like Lists, Dictionaries are "mutable". 

```python
dict_name[new_key] = new_value
```

An empty pair of curly braces `{}` is an empty dictionary, just like an empty pair of `[]` is an empty list.

## Functions  and Methods

### `dict()`

The function `dict` creates a new dictionary with no items: 

```python
>>> eng2sp = dict()
>>> print eng2sp
{}
>>> eng2sp['one'] = 'uno' # To add items to the dictionary
>>> print eng2sp
{'one': 'uno'}
>>> print eng2sp['noe'] # Use the keys to look up the corresponding values
'uno'
```

### `.values()`

To see whether something appears as a value in a dictionary, you can use the method `values`, which returns the values as a **list**, and then use the in operator:

```python
>>> vals = eng2sp.values()
>>> 'uno' in vals
True
```

### `.keys()`

```python
for name in counts.keys():
    print name
```

### `.items()`

return a list of tuples, where each tuple is a key-value pair.

```python
for name,occurrence in counts.items():
    print name, occurrence`
```

### `.get()`

Dictionaries have a method called `get` that takes a key and a default value. If the key appears in the dictionary, `get` returns the corresponding value; otherwise it returns the default value. For example:

```python
>>> counts = { 'chuck' : 1 , 'annie' : 42, 'jan': 100}
>>> print counts.get('jan', 0)
100
>>> print counts.get('tim', 0)
0
```

### `.pop(key)`[^1]

```python
>>> d.pop('Bob')
75
>>> d
{'Michael': 95, 'Tracy': 85}
```

## Dictionary as a set of counters

```python
word = 'brontosaurus'
d = dict()
for c in word:
    if c not in d:
        d[c] = 1
    else:
        d[c] = d[c] + 1
print d
```

The use of the `get` method to simplify this counting loop ends up being a very commonly used “idiom” in Python.

```python
word = 'brontosaurus'
d = dict()
for c in word:
    d[c] = d.get(c,0) + 1
print d
```

## Dictionaries and files

One of the common uses of a dictionary is to count the occurrenceof words in a file with some written text.

```python
fname = raw_input('Enter the file name: ')
try:

    fhand = open(fname)
except:
    print 'File cannot be opened:', fname
    exit()

counts = dict()
for line in fhand:
    words = line.split()
    for word in words:
        counts[word] = counts.get(word, 0) + 1
print counts
```

## More Info:

[Pythonlearn:resources-week09](https://share.coursera.org/wiki/index.php/Pythonlearn:resources-week09)  
[使用dict和set](http://www.liaoxuefeng.com/wiki/001374738125095c955c1e6d8bb493182103fac9270762a000/0013868193482529754158abf734c00bba97c87f89a263b000)  

{% include series.html %}

[^1]: 要删除一个key，用`pop(key)`方法，对应的value也会从dict中删除
