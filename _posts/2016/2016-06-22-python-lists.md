---
title: "Python Part 6: Lists"
date: 2016-06-22 09:00
modified: 2016-06-22
categories:
  - Python
tags:
  - Python Syntax
  - Python 2.x
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

* `.append()` - use to add constants to the end of a list 

  ```python
  >>> t = ['a', 'b', 'c']
  >>> t.append('d')
  >>> print t
  ['a', 'b', 'c', 'd']
  ```

* `.extend()` - take a list as an argument and appends all of the elements
   
  ```python
  >>> t1 = ['a', 'b', 'c']
  >>> t2 = ['d', 'e']
  >>> t1.extend(t2)
  >>> print t1
  ['a', 'b', 'c', 'd', 'e']
  ```

* `.pop()` - remove the item at index from the list and return it to you:
  
  ```python
  n = [1, 3, 5]
  n.pop(1)
  # Returns 3 (the item at index 1)
  print n
  # prints [1, 5]
  ```

* `.remove()` - remove the actual item if it finds it:  
  
  ```python
  n = [1, 3, 5]
  n.remove(1)
  # Removes 1 from the list,
  # NOT the item at index 1
  print n
  # prints [3, 5]
  ```

* `.sort()` -  arrange the elements of the list from low to highy.
  
  ```python
  >>> t = ['d', 'c', 'e', 'b', 'a']
  >>> t.sort()
  >>> print t
  ['a', 'b', 'c', 'd', 'e']
  ```

* `.split()` - break a string into parts and produces a list of strings.  

  ```python
  fhand = open('mbox-short.txt')
  for line in fhand:
      line = line.rstrip()
      if not line.startswith('From ') : continue
      words = line.split()
      print words[2]
  ```

##  List Functions

* `len()` - find length, 

* `max()` - find highest value, 

* `min()` - find lowest value, 

* `sum()` - add all values

* `sum()/len()`: average 

* `del(n[1]）`: like `.pop()` in that it will remove the item at the given index, but it won't return it:

  ```python
  >>> a = [1, 2, 3, 4, 5]
  >>> del a[0], a[2] #  since a[0] first gets deleted yielding [2, 3, 4, 5], then since the 2-element of [2, 3, 4, 5] is 4, 4 gets deleted.
  >>> print a
  [2, 3, 5]
  ```

## Lists and strings

To convert from a string to a list of characters,you can use `list`:

```python
>>> s = 'spam'
>>> t = list(s)
>>> print t
['s', 'p', 'a', 'm']
```

To break a string into words, you can use the `split` method:

```python
>>> s = 'pining for the fjords'
>>> t = s.split()
>>> print t
['pining', 'for', 'the', 'fjords']
>>> print t[2]
the
```

You can call split with an optional argument called a delimiter that specifies which characters to use as word boundaries.The following example uses a hyphen as a delimiter:

```python
>>> s = 'spam-spam-spam'
>>> delimiter = '-'
>>> s.split(delimiter)
['spam', 'spam', 'spam']

```

`join` is the inverse of split. **It takes a list of strings and concatenates the elements**. `join` is a string method,so you have to invoke it on the delimiter and pass the list as a parameter:

```python
>>> t = ['pining', 'for', 'the', 'fjords']
>>> delimiter = ' '
>>> delimiter.join(t)
'pining for the fjords'

```

In this case the delimiter is a space character, so join puts a space between words. To concatenate strings without spaces, you can use the empty string`"`, as a delimiter. 

## Debugging

1. Don’t forget that most list methods modify the argument and return **None**
   
   ```python
   t = t.sort()           # WRONG!
   ```

   Because `sort` returns **None**, the next operation you perform with t is likely to fail.
   
2. Pick an idiom and stick with it.
   
   ```python
   t.append(x)
   t = t + [x]
   
   t.append([x])          # WRONG!
   t = t.append(x)        # WRONG!
   t + [x]                # WRONG!
   t = t + x              # WRONG!
   ```



## More Info

[Pythonlearn:resources-week08](https://share.coursera.org/wiki/index.php/Pythonlearn:resources-week08)

[^1]: A method is a function that “belongs to” an object.

{% include series.html %}
