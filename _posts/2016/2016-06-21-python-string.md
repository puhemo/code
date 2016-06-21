---
title: "Python Syntax: String Methods"
date: 2016-06-21
modified: 2016-06-21
categories:
  - Python
tags:
  - Python
  - Syntax
published: true
excerpt: |
  # Functions
  Taking segments of related code, wrapping it up in its own allocated code block, and attributing it with a name so that it can be called later at any point of the overarching program, thus treating it as its own separate, self contained, and individually existing entity. A "sub program" within your program, if you will.
series: "Intro to Python"	
---
{% include series.html %}

* TOC
{:toc}

### find()： 

The `.find()` method should be used only if you need to know the **position** of *sub*.

```python
# To find the position of the "3" in the string "0123456":  
data="0123456"        
pos=data.find('3')        
print pos         
```
### upper():

Use the` .upper() `function to return a **copy** of the given string  converted to uppercase. 

```python
data='Hello Python'
capdata=data.upper()
print capdata
>HELLO PYTHON
```

### lower()

Use the` .lower()` function to convert the sting to the lower case.

```python
data='Hello Python'
capdata=data.lower()
print capdata
>hello python
```

### replace()

Use the` .replace()`to search and replace a character or letter in a given string.

```python
data='Hello Python'
rpld=data.replace("Python","Leo")
print rpld
>Hello Leo
```

### strip()

Return a copy of the string with the leading and trailing characters removed

```python
>>> '   spacious   '.strip()
'spacious'
```

### rstrip()

Return a copy of the string with trailing characters removed.

```python
>>> '   spacious   '.rstrip()
'   spacious'
```

### lstrip()

Return a copy of the string with leading characters removed. 

```python
>>> '   spacious   '.lstrip()
'spacious   '
```

### More Info:

* [5.6.1. String Methods](https://docs.python.org/release/2.7.10/library/stdtypes.html#string-methods)
* [Pythonlearn:resources-week06](https://share.coursera.org/wiki/index.php/Pythonlearn:resources-week06)
