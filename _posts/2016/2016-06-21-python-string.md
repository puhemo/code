---
title: "Python Part 02: String"
date: 2016-06-14 09:00
modified: 2016-07-21
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

## Strings

Strings are amongst the most popular types in Python. We can create them simply by enclosing characters in quotes. Python treats single quotes the same as double quotes. A string can contain letters, numbers, and symbols.

```python
name = "Ryan"
age = "19"
food = "cheese"
```

If we want to include an apostrophe in our string, it would be smart to use double quotes to create the string like `"I'm a string"`. If we want to use quotes in the string, we might want to create the string with single quote like `'The man screamed "I love Python!" so that everyone could hear.'`

### Escaping characters

There are some characters that cause problems. For example:

```python
'There's a snake in my boot!'
```

This code breaks because Python thinks the apostrophe in `'There's'` ends the string. We can use the backslash to fix the problem, like this:

```python
'There\'s a snake in my boot!'
```

Following table is a list of escape or non-printable characters that can be represented with backslash notation.

| Backslashnotation | Hexadecimalcharacter | Description                              |
| ----------------- | -------------------- | ---------------------------------------- |
| \a                | 0x07                 | Bell or alert                            |
| \b                | 0x08                 | Backspace                                |
| \cx               |                      | Control-x                                |
| \C-x              |                      | Control-x                                |
| \e                | 0x1b                 | Escape                                   |
| \f                | 0x0c                 | Formfeed                                 |
| \M-\C-x           |                      | Meta-Control-x                           |
| \n                | 0x0a                 | Newline                                  |
| \nnn              |                      | Octal notation, where n is in the range 0.7 |
| \r                | 0x0d                 | Carriage return                          |
| \s                | 0x20                 | Space                                    |
| \t                | 0x09                 | Tab                                      |
| \v                | 0x0b                 | Vertical tab                             |
| \x                |                      | Character x                              |
| \xnn              |                      | Hexadecimal notation, where n is in the range 0.9, a.f, or A.F |

### Access by Index

Each character in a string is assigned a number. This number is called the **index**. 

```python
"""
The string "PYTHON" has six characters,
numbered 0 to 5, as shown below:

+---+---+---+---+---+---+
| P | Y | T | H | O | N |
+---+---+---+---+---+---+
  0   1   2   3   4   5

So if you wanted "Y", you could just type
"PYTHON"[1] (always start counting from 0!)
"""
fifth_letter = "MONTY"[4]

print fifth_letter
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

### join()

The method **join()** returns a string in which the string elements of sequence have been joined by *str* separator.

```python
s = "-";
seq = ("a", "b", "c"); # This is sequence of strings.
print s.join( seq )
```

## Format operator

One of Python's coolest features is the string format operator `%`. This operator is unique to strings and makes up for the pack of having functions from C's printf() family. Following is a simple example −

```python
>>> 'In %d years I have spotted %g %s.' % (3, 0.1, 'camels')
'In 3 years I have spotted 0.1 camels.'
```

The format operator, `%` allows us to construct strings, replacing parts of the strings with the data stored in variables. 

* '%d' to format an integer
* '%g' to format a floating-point number 
* '%s' to format a string

## Triple Quotes

Python's triple quotes comes to the rescue by allowing strings to span multiple lines, including verbatim NEWLINEs, TABs, and any other special characters.

The syntax for triple quotes consists of three consecutive **single or double** quotes. 

```python
para_str = """this is a long string that is made up of
several lines and non-printable characters such as
TAB ( \t ) and they will show up that way when displayed.
NEWLINEs within the string, whether explicitly given like
this within the brackets [ \n ], or just a NEWLINE within
the variable assignment will also show up.
"""
print para_str
```

When the above code is executed, it produces the following result. Note how every single special character has been converted to its printed form, right down to the last NEWLINE at the end of the string between the "up." and closing triple quotes. Also note that NEWLINEs occur either with an explicit carriage return at the end of a line or its escape code (\n) −

```
this is a long string that is made up of
several lines and non-printable characters such as
TAB (    ) and they will show up that way when displayed.
NEWLINEs within the string, whether explicitly given like
this within the brackets [
 ], or just a NEWLINE within
the variable assignment will also show up.
```

## More Info:

* [5.6.1. String Methods](https://docs.python.org/release/2.7.10/library/stdtypes.html#string-methods)
* [Pythonlearn:resources-week06](https://share.coursera.org/wiki/index.php/Pythonlearn:resources-week06)
* [Python Strings](http://www.tutorialspoint.com/python/python_strings.htm)

[^1]: A function that is associated with an object and called using dot notation. 

{% include series.html %}
