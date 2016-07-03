---
title: "Python Part 6: Lists"
date: 2016-06-22 09:00
modified: 2016-07-03
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

## List Slicing

### List Slicing Syntax

List slicing allows us to access elements of a list in a concise manner. The syntax looks like this:

```python
[start:end:stride]
```

*  `start` describes where the slice starts (inclusive), 
*  `end` is where it ends (exclusive),
*  `stride` describes the space between items in the sliced list.   
    > A positive stride length traverses the list from left to right, and a negative one traverses the list from right to left.

For example, a stride of `2` would select every other item from the original list to place in the sliced list.

```python
l = [i ** 2 for i in range(1, 11)]
# Should be [1, 4, 9, 16, 25, 36, 49, 64, 81, 100]

print l[2:9:2]
# Should be [9, 25, 49, 81]
```

### Omitting Indices

If you don't pass a particular index to the list slice, Python will pick a default. 

```python
to_five = ['A', 'B', 'C', 'D', 'E']

print to_five[3:]
# prints ['D', 'E'] 

print to_five[:2]
# prints ['A', 'B']

print to_five[::2]
# print ['A', 'C', 'E']
```

1. The default starting index is `0`.
2. The default ending index is the end of the list.
3. The default stride is `1`.

### Reversing a List

A *negative* stride progresses through the list from right to left.

```python
letters = ['A', 'B', 'C', 'D', 'E']
print letters[::-1]
```

In the example above, we print out `['E', 'D', 'C', 'B', 'A']`.

## Iterating over a list in a function

we have two ways of iterating through a list.

**Method 1** - `for item in list`:

```python
for item in list:
    print item
```

**Method 2** - iterate through indexes:

```python
for i in range(len(list)):
    print list[i]
```

**Method 1** is useful to loop through the list, but it's not possible to modify the list this way.  
**Method 2** uses indexes to loop through the list, making it possible to also **modify** the list if needed.  


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
  
* `.join()` - delimiter.join(list) - It takes a list of strings and concatenates the elements. `join` is a string method.  
 
  ```python
  str = "-"
  seq = ["a", "b", "c"]
  print str.join( seq )
  ```

##  List Functions

* `len()` - find length, 

* `max()` - find highest value, 

* `min()` - find lowest value, 

* `sum()` - add all values

* `sum()/len()`: average 

###  `del(n[1]）`

`del()` like `.pop()` in that it will remove the item at the given index, but it won't return it:

```python
>>> a = [1, 2, 3, 4, 5]
>>> del a[0], a[2] #  since a[0] first gets deleted yielding [2, 3, 4, 5], then since the 2-element of [2, 3, 4, 5] is 4, 4 gets deleted.
>>> print a
[2, 3, 5]
```

### `range()`

The `range()`[^2] generates a list of numbers, which is generally used to iterate over with for loops.
  
> The `range()` function works a little bit differently between Python 2.x and 3.x under the hood, however the concept is the same. 

The `range()` function has two sets of parameters, as follows:

`range(stop)`

- `stop`: Number of integers (whole numbers) to generate, starting from zero. eg. `range(3) == [0, 1, 2]`.

`range(start, stop, step)`

- `start`: Starting number of the sequence.
- `stop`: Generate numbers up to, but not including this number.
- `step`: Difference between each number in the sequence.

Note that:

- All parameters must be integers.
- All parameters can be positive or negative.
- `range()` (and Python in general) is 0-index based, meaning list indexes start at 0, not 1. eg. The syntax to access the first element of a list is `mylist[0]`. Therefore the last integer generated by `range()` is up to, but not including, `stop`. For example `range(0, 5)` generates integers from 0 up to, but not including 5.

Simple Usage

```python
>>> # One parameter
>>> for i in range(5):
...     print(i)
... 
0
1
2
3
4
>>> # Two parameters
>>> for i in range(3, 6):
...     print(i)
... 
3
4
5
>>> # Three parameters
>>> for i in range(4, 10, 2):
...     print(i)
... 
4
6
8
>>> # Going backwards
>>> for i in range(0, -10, -2):
...     print(i)
... 
0
-2
-4
-6
-8
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

## List comprehensions

List comprehensions are a powerful way to generate lists using the `for`/`in` and `if` keywords.

For example, a list of all the even numbers from 0 to 50.

```python
evens_to_50 = [i for i in range(51) if i % 2 == 0]
print evens_to_50
```

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
[详细记录python的range()函数用法](http://www.cnblogs.com/buro79xxd/archive/2011/05/23/2054493.html)


[^1]: A method is a function that “belongs to” an object.
[^2]: [Python’s range() Function Explained](http://pythoncentral.io/pythons-range-function-explained/)

{% include series.html %}
