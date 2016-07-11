---
title: "Python Part 4: String"
date: 2016-06-21 09:00
modified: 2016-07-02
categories:
  - Python
tags:
  - Python Syntax
  - Python 2.x
published: true
excerpt: |
  A string can contain letters, numbers, and symbols. 
series: "Intro to Python"	
---
{% include series.html %}

* TOC
{:toc}

Another useful data type is the **string**. A string can contain letters, numbers, and symbols.

```python
name = "Ryan"
age = "19"
food = "cheese"
```

There is no difference between using single quotes `'` and double quotes `"`. However, sometimes it is helpful to use one or the other.   

If we want to include an apostrophe in our string, it would be smart to use double quotes to create the string like `"I'm a string"`. If we want to use quotes in the string, we might want to create the string with single quote like `'The man screamed "I love Python!" so that everyone could hear.'`

## Escaping characters

There are some characters that cause problems. For example:

```python
'There's a snake in my boot!'
```

This code breaks because Python thinks the apostrophe in `'There's'` ends the string. We can use the backslash to fix the problem, like this:

```python
'There\'s a snake in my boot!'
```

## String Methods[^1]

### find()

The `.find()` method should be used only if you need to know the **position** of *sub*.

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

Use the` .replace()`to **search** and replace a character or letter in a given string.

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

[^1]: A function that is associated with an object and called using dot notation. 
