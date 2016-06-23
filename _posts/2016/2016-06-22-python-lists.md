---
title: "Python Part 6: Lists"
date: 2016-06-22 09:00
modified: 2016-06-22
categories:
  - Python
tags:
  - Python
  - Syntax
published: true
excerpt: |
  Collection - allows us to put many values in a single variable.  
series: "Intro to Python"	
---
{% include series.html %}

* TOC
{:toc}

## Lists

Collection - allows us to put many values in a single variable.

* A List element can be any Python object, even another **list**


* A List can be **empty**


* Lists are **mutable** (they can be changed)

  >  This is a big difference between lists and strings.  Strings are NOT mutable.

* When len() is used on a list, it counts the number of **constants** that make up the list.

* List is an **ordered** sequence

## List Methods[^1]

Methods: append, count, extend, index, insert, pop, remove, reverse, sort 

> Most list methods are void; they modify the list and return None. If you accidentally write t = t.sort(), you will be disappointed with the result.

* `append()` - use to add constants to the end of a list 

  ```python
  >>> t = ['a', 'b', 'c']
  >>> t.append('d')
  >>> print t
  ['a', 'b', 'c', 'd']
  ```

* `extend()` -takes a list as an argument and appends all of the elements
   
  ```python
  >>> t1 = ['a', 'b', 'c']
  >>> t2 = ['d', 'e']
  >>> t1.extend(t2)
  >>> print t1
  ['a', 'b', 'c', 'd', 'e']
  ```

* `remove()` - use to remove constants from a list  
* `sort()` -  arrange the elements of the list from low to highy.
  
  ```python
  >>> t = ['d', 'c', 'e', 'b', 'a']
  >>> t.sort()
  >>> print t
  ['a', 'b', 'c', 'd', 'e']
  ```

* `split()` - break a string into parts and produces a list of strings.  

##  List Functions

* `len()` - find length, 


* `max()` - find highest value, 


* `min()` - find lowest value, 


* `sum()` - add all values


* `sum()/len()`: average 

## Deleting elements

`pop` modifies the list and returns the element that was removed. If you don’t provide an index, it deletes and returns the last element.

```python
>>> t = ['a', 'b', 'c']
>>> x = t.pop(1)
>>> print t
['a', 'c']
>>> print x
b
```

del: A command which removes what corresponds to the index of the list.

```python
>>> a = [1, 2, 3, 4, 5]
>>> del a[0], a[2] #  since a[0] first gets deleted yielding [2, 3, 4, 5], then since the 2-element of [2, 3, 4, 5] is 4, 4 gets deleted.
>>> print a
[2, 3, 5]
```

## More Info

[Pythonlearn:resources-week08](https://share.coursera.org/wiki/index.php/Pythonlearn:resources-week08)

[^1]: A method is a function that “belongs to” an object.

{% include series.html %}
