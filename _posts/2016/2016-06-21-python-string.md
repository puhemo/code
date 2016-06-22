---
title: "Python Part 4: String"
date: 2016-06-21 09:00
modified: 2016-06-22
categories:
  - Python
tags:
  - Python
  - Syntax
published: true
excerpt: |
  Below are listed the string methods.  
series: "Intro to Python"	
---
{% include series.html %}

* TOC
{:toc}

## String Methods

### find()

The `.find()` method[^1] should be used only if you need to know the **position** of *sub*.

```python
# To find the position of the "3" in the string "0123456":  
data="0123456"        
pos=data.find('3')        
print pos         
```

### upper()

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

## Format operator

The format operator, `%` allows us to construct strings, replacing parts of the strings with the data stored in variables. 

* '%d' to format an integer
* '%g' to format a floating-point number 
* '%s' to format a string

```python
>>> 'In %d years I have spotted %g %s.' % (3, 0.1, 'camels')
'In 3 years I have spotted 0.1 camels.'
```

## More Info:

* [5.6.1. String Methods](https://docs.python.org/release/2.7.10/library/stdtypes.html#string-methods)
* [Pythonlearn:resources-week06](https://share.coursera.org/wiki/index.php/Pythonlearn:resources-week06)

{% include series.html %}

[^1]: A method is a function that “belongs to” an object.
