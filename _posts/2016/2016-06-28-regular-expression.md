---
title: "Python Part 11: Regular Expressions"
date: 2016-06-28 11:00
modified: 2016-07-24
categories:
  - Python
tags:
  - Python Application
  - Regular Expression
published: true
excerpt: |
  A regular expression(sometimes called a rational expression) is a sequence of characters that define **a search pattern**, mainly for use in pattern matching with strings, or string matching.
series: "Intro to Python"	
---
{% include series.html %}

* TOC
{:toc}

A regular expression[^1] (sometimes called a rational expression) is a sequence of characters that define **a search pattern**, mainly for use in pattern matching with strings, or string matching.

Regular expressions are almost their own little programming language for searching and parsing strings. 

![re_simple](http://images.cnblogs.com/cnblogs_com/huxi/WindowsLiveWriter/Python_10A67/re_simple_38246a58-83be-4adf-9f30-6d735e9b9b47.png)

> There are various characters, which would have special meaning when they are used in regular expression. To avoid any confusion while dealing with regular expressions, we would use Raw Strings as `r'expression'`.

## `re`— Regular expression operations

This **module** provides regular expression matching operations similar tothose found in Perl.

> The regular expression library `re` must be imported into your program before you can use it.

###  search()

The simplest use of the regular expression library is the `search()` function.

```python
import re
hand = open('mbox-short.txt')
for line in hand:
    line = line.rstrip()
    if re.search('^From:', line) : # ^ - Matches the beginning of the line.
        print line
```

### The *match* Function

This function attempts to match RE *pattern* to *string* with optional *flags*.

Here is the syntax for this function −

```python
re.match(pattern, string, flags=0)
```

Here is the description of the parameters:

| Parameter | Description                              |
| --------- | ---------------------------------------- |
| pattern   | This is the regular expression to be matched. |
| string    | This is the string, which would be searched to match the pattern at the beginning of string. |
| flags     | You can specify different flags using bitwise OR (\|). These are modifiers, which are listed in the table below. |

The *re.match* function returns a **match** object on success, **None** on failure. We use *group(num)* or *groups()  function of match* object to get matched expression.

| Match Object Methods | Description                              |
| -------------------- | ---------------------------------------- |
| group(num=0)         | This method returns entire match (or specific subgroup num) |
| groups()             | This method returns all matching subgroups in a tuple (empty if there weren't any) |

#### Example

```python
import re

line = "Cats are smarter than dogs"

matchObj = re.match( r'(.*) are (.*?) .*', line, re.M|re.I)

if matchObj:
   print "matchObj.group() : ", matchObj.group()
   print "matchObj.group(1) : ", matchObj.group(1)
   print "matchObj.group(2) : ", matchObj.group(2)
else:
   print "No match!!"
```

When the above code is  executed, it produces following result −

```
matchObj.group() :  Cats are smarter than dogs
matchObj.group(1) :  Cats
matchObj.group(2) :  smarter
```

### Matching Versus Searching

Python offers two different primitive operations based on regular expressions: **match** checks for a match only at the **beginning of the string**, while **search** checks for a match **anywhere** in the string (this is what Perl does by default).

#### Example

```python
import re

line = "Cats are smarter than dogs";

matchObj = re.match( r'dogs', line, re.M|re.I)
if matchObj:
   print "match --> matchObj.group() : ", matchObj.group()
else:
   print "No match!!"

searchObj = re.search( r'dogs', line, re.M|re.I)
if searchObj:
   print "search --> searchObj.group() : ", searchObj.group()
else:
   print "Nothing found!!"
```

When the above code is  executed, it produces the following result −

```
No match!!
search --> matchObj.group() :  dogs
```

### Search and Replace

One of the most important **re** methods that use regular expressions is **sub**.

#### Syntax

```python
re.sub(pattern, repl, string, max=0)
```

This method **replaces** all occurrences of the RE *pattern* in *string* with *repl*, substituting all occurrences unless *max* provided. This method returns modified string.

#### Example

```python
import re

phone = "2004-959-559 # This is Phone Number"

# Delete Python-style comments
num = re.sub(r'#.*$', "", phone)
print "Phone Num : ", num

# Remove anything other than digits
num = re.sub(r'\D', "", phone)    
print "Phone Num : ", num
```

When the above code is  executed, it produces the following result −

```
Phone Num :  2004-959-559
Phone Num :  2004959559
```

### findall(pattern, string, flags=0)

Return all non-overlapping matches of *pattern* in string, as a **list** of strings.

```python
import re
s = 'Hello from csev@umich.edu to cwen@iupui.edu about the meeting @2PM'
lst = re.findall('\S+@\S+', s)
print lst
```

The output of the program would be:

```
['csev@umich.edu', 'cwen@iupui.edu']
```


### Regular Expression Modifiers: Option Flags

Regular expression literals may include an optional modifier to control various aspects of matching. The modifiers are specified as an optional flag. You can provide multiple modifiers using exclusive OR (\|), as shown previously and may be represented by one of these

| Modifier | Description                              |
| -------- | ---------------------------------------- |
| re.I     | Performs case-insensitive matching.      |
| re.L     | Interprets words according to the current locale. This interpretation affects the alphabetic group (\w and \W), as well as word boundary behavior(\b and \B). |
| re.M     | Makes $ match the end of a line (not just the end of the string) and makes ^ match the start of any line (not just the start of the string). |
| re.S     | Makes a period (dot) match any character, including a newline. |
| re.U     | Interprets letters according to the Unicode character set. This flag affects the behavior of \w, \W, \b, \B. |
| re.X     | Permits "cuter" regular expression syntax. It ignores whitespace (except inside a set [] or when escaped by a backslash) and treats unescaped # as a comment marker. |

## Character matching in regular expressions

In the following example, the regular expression “F..m:” would match any of the strings “From:”, “Fxxm:”, “F12m:”, or “F!@m:” since the period characters in the regular expression match any character.

**Sample file**: [mbox-short.txt](http://www.pythonlearn.com/code/mbox-short.txt)

```python
import re
hand = open('mbox-short.txt')
for line in hand:
    line = line.rstrip()
    if re.search('^F..m:', line) :
        print line
```

We can further narrow down the lines that we match using a repeated wild card character in the following example:

```python
import re
hand = open('mbox-short.txt')
for line in hand:
    line = line.rstrip()
    if re.search('^From:.+@', line) :
        print line
```

The search string “^From:.+@” will successfully match lines that start with “From:”,followed by one or more characters (“.[^2]+[^3]”), followed by an at-sign. 

## Extracting data using regular expressions

Here is our regular expression:

```
[a-zA-Z0-9]\S*@\S*[a-zA-Z]
```

Translating this regular expression, we are looking for substrings that start with a *single* lowercase letter, uppercase letter, or number “[a-zA-Z0-9]”, followed by zero or more non-blank characters (“\S*”), followed by an at-sign, followed by zeroor more non-blank characters (“\S*”), followed by an uppercase or lowercase letter.

> Note: we switched from “+” to  *[^4]  to indicate zero or more non-blank characters since “[a-zA-Z0-9]”is already one non-blank character. Remember that the  *  or “+” applies to the single character immediately to the left of the plus or asterisk.

```python
import re
hand = open('mbox-short.txt')
for line in hand:
    line = line.rstrip()
    x = re.findall('[a-zA-Z0-9]\S*@\S*[a-zA-Z]', line)
    if len(x) > 0 :
        print x

...
['wagnermr@iupui.edu']
['cwen@iupui.edu']
['postmaster@collab.sakaiproject.org']
['200801032122.m03LMFo4005148@nakamura.uits.iupui.edu']
['source@collab.sakaiproject.org']
['source@collab.sakaiproject.org']
['source@collab.sakaiproject.org']
['apache@localhost']
```

> Note: the output of the program is a Python list that has a string as the singleelement in the list.

## Combining searching and extracting

Extract numbers from lines that have the above syntax:

```python
^X-.*: [0-9.]+
```

Translating this, we are saying, we want lines that start with “X-”, followed by zero or more characters (“.*”), followed by a colon (“:”) and then a space. After the space we are looking for one or more characters that are either a digit (0-9) or a period “[0-9.]+”.

> Note:  inside the square brackets, the period matches an actual period (i.e., it is not a wildcard between the square brackets).

```python
import re
hand = open('mbox-short.txt')
for line in hand:
    line = line.rstrip()
    if re.search('^X\S*: [0-9.]+', line) :
        print line

...
X-DSPAM-Confidence: 0.8475
X-DSPAM-Probability: 0.0000
X-DSPAM-Confidence: 0.6178
X-DSPAM-Probability: 0.0000
```

```python
import re
hand = open('mbox-short.txt')
for line in hand:
    line = line.rstrip()
    x = re.findall('^X\S*: ([0-9.]+)', line) 
    # When parentheses are added to a regular expression, they are ignored for the purpose of matching, but allow you to extract a particular subset of the matched string rather than the whole string when using findall().
    if len(x) > 0 :
        print x

...
['0.8475']
['0.0000']
['0.6178']
['0.0000']
['0.6961']
['0.0000']
...
```

```python
import re
hand = open('mbox-short.txt')
for line in hand:
    line = line.rstrip()
    x = re.findall('^From .* ([0-9][0-9]):', line) # two digits “[0-9][0-9]”
    if len(x) > 0 : print x

...
['09']
['18']
['16']
['15']
...
```

## More Info

* [Regular expression](https://en.wikipedia.org/wiki/Regular_expression)  

* [7.2. `re` — Regular expression operations](https://docs.python.org/2/library/re.html)

* [Python正则表达式指南](http://www.cnblogs.com/huxi/archive/2010/07/04/1771073.html)

* [Python正则表达式操作指南](http://wiki.ubuntu.org.cn/Python%E6%AD%A3%E5%88%99%E8%A1%A8%E8%BE%BE%E5%BC%8F%E6%93%8D%E4%BD%9C%E6%8C%87%E5%8D%97)

* [Python Regular Expressions](http://www.tutorialspoint.com/python/python_reg_expressions.htm) 


[^1]: 正则表达式并不是Python的一部分。正则表达式是用于处理字符串的强大工具，拥有自己独特的语法以及一个独立的处理引擎，效率上可能不如str自带的方法，但功能十分强大。得益于这一点，在提供了正则表达式的语言里，正则表达式的语法都是一样的，区别只在于不同的编程语言实现支持的语法数量不同；但不用担心，不被支持的语法通常是不常用的部分。
[^2]: '.' - 匹配任意除换行符外的字符
[^3]: '+' - 匹配前一个字符1次或无限次
[^4]: '*' - 匹配前一个字符0次或无限次
