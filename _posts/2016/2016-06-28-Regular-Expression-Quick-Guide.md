---
title: "Regular Expression Quick Guide"
date: 2016-06-28 08:36
modified: 2016-09-18
categories:
  - Python
tags:
  - Python
  - Regular Expression
  - Quick Guide
published: true
excerpt: |
  Here are some of regular expressions: 
---

## Regular Expression Syntax

* `^` - Matches the beginning of the line.

* `$` - Matches the end of the line.

* `.` - Matches any character (a wildcard)except a newline.
 
* `?` - Causes the resulting RE to match 0 or 1 repetitions of the preceding RE. 

* `\s` - Matches a whitespace character.

* `\S` - Matches a non-whitespace character (opposite of` \s`).

* `*` - Applies to the immediately preceding character and indicates to match zero or more of the preceding character(s).

* `*?` - Applies to the immediately preceding character and indicates to match zero or more of the preceding character(s) in “non-greedy mode”.

* `+` - Applies to the immediately preceding character and indicates to match one or more of the preceding character(s).

* `+?` - Applies to the immediately preceding character and indicates to match one or more of the preceding character(s) in “non-greedy mode”.

* `[aeiou]` - Matches a single character as long as that character is in the specified set. In this example, it would match “a”, “e”, “i”, “o”, or “u”, but no other characters.

* `[a-z0-9]` - You can specify ranges of characters using the minus sign. This example is a single character that must be a lowercase letter or a digit.

* `[^A-Za-z]` - When the first character in the set notation is a caret, it inverts the logic. This example matches a single character that is anything other than an uppercase or lowercase letter.

* `( )` - When parentheses are added to a regular expression, they are ignored for the purpose of matching, but allow you to extract a particular subset of the matched string rather than the whole string when using findall().

* `\b` - Matches the empty string, but only at the start or end of a word.

* `\B` - Matches the empty string, but not at the start or end of a word.

* `\d` - Matches any decimal digit; equivalent to the set `[0-9]`.

* `\D` - Matches any non-digit character; equivalent to the set `[^0-9]`.

* `{m}` - Specifies that exactly m copies of the previous RE should be matched.

* `{m,n}` - Causes the resulting RE to match from m to n repetitions of the preceding RE, attempting to match as many repetitions as              possible. 

* `{m,n}?` - Causes the resulting RE to match from m to n repetitions of the preceding RE, attempting to match as few repetitions as               possible. For example, on the 6-character string 'aaaaaa', a{3,5} will match 5 'a' characters, while a{3,5}? will only                match 3 characters.

## More Info

[Chapter 11  Regular expressions](http://www.pythonlearn.com/html-270/book012.html)  
[7.2.1. Regular Expression Syntax](https://docs.python.org/2/library/re.html)  
[Python正则表达式指南](http://www.cnblogs.com/huxi/archive/2010/07/04/1771073.html)  
[Python正则表达式操作指南](http://wiki.ubuntu.org.cn/Python%E6%AD%A3%E5%88%99%E8%A1%A8%E8%BE%BE%E5%BC%8F%E6%93%8D%E4%BD%9C%E6%8C%87%E5%8D%97)  
[Chapter 7 – Pattern Matching with Regular Expressions](https://automatetheboringstuff.com/chapter7/)
