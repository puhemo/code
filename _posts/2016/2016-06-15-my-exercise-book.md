---
title: "My Python exercise book"
date: 2016-06-15
modified: 2016-10-07
categories:
  - Python
tags:
  - Python
  - Python Exercise
  - Error
excerpt: |
  My Python exercise book
---

* TOC
{:toc}

# Automate the Boring Stuff with Python

## Chapter 9.1 -- Renaming Files with American-Style Dates to European-Style Dates[^1]

Say your boss emails you thousands of files with American-style dates (MM-DD-YYYY) in their names and needs them renamed to European-style dates (DD-MM-YYYY). This boring task could take all day to do by hand! Let’s write a program to do it instead.

Here’s what the program does:

It searches all the filenames in the current working directory for American-style dates.

When one is found, it renames the file with the month and day swapped to make it European-style.

This means the code will need to do the following:

Create a regex that can identify the text pattern of American-style dates.

Call os.listdir() to find all the files in the working directory.

Loop over each filename, using the regex to check whether it has a date.

If it has a date, rename the file with shutil.move().

For this project, open a new file editor window and save your code as renameDates.py.

```python
#! python3
# Written by Al Sweigart
# renameDates.py - Renames filenames with American MM-DD-YYYY date format
# to European DD-MM-YYYY.

import shutil, os, re

# Create a regex that matches files with the American date format.
datePattern = re.compile(r"""^(.*?) # all text before the date
    ((0|1)?\d)-                     # one or two digits for the month
    ((0|1|2|3)?\d)-                 # one or two digits for the day
    ((19|20)\d\d)                   # four digits for the year
    (.*?)$                          # all text after the date
    """, re.VERBOSE)
# Loop over the files in the working directory.
for amerFilename in os.listdir('.'):
    mo = datePattern.search(amerFilename)

    # Skip files without a date.
    if mo == None:
        continue

    # Get the different parts of the filename.
    beforePart = mo.group(1)
    monthPart  = mo.group(2)
    dayPart    = mo.group(4)
    yearPart   = mo.group(6)
    afterPart  = mo.group(8)
    # Form the European-style filename.
    euroFilename = beforePart + dayPart + '-' + monthPart + '-' + yearPart +
                   afterPart

    # Get the full, absolute file paths.
    absWorkingDir = os.path.abspath('.')
    amerFilename = os.path.join(absWorkingDir, amerFilename)
    euroFilename = os.path.join(absWorkingDir, euroFilename)

    # Rename the files.
    print('Renaming "%s" to "%s"...' % (amerFilename, euroFilename))
    #shutil.move(amerFilename, euroFilename)   # uncomment after testing
```


## Chapter 8.1 -- Mad Libs

Create a Mad Libs program that reads in text files and lets the user add their own text anywhere the word ADJECTIVE, NOUN, ADVERB, or VERB appears in the text file. For example, a text file may look like this:

The ADJECTIVE panda walked to the NOUN and then VERB. A nearby NOUN was
unaffected by these events.
The program would find these occurrences and prompt the user to replace them.

Enter an adjective:
silly
Enter a noun:
chandelier
Enter a verb:
screamed
Enter a noun:
pickup truck
The following text file would then be created:

The silly panda walked to the chandelier and then screamed. A nearby pickup
truck was unaffected by these events.
The results should be printed to the screen and saved to a new text file.

```python
#! python3
# mad_libs.py - Reads in text files and lets the user add 
#               their own text anywhere the word ADJECTIVE,
#               NOUN, ADVERB, or VERB appears in the text file.
# Usage: mad_libs.py <text files> - Saves clipboard to keyword.
from sys import argv
import re

file = open(argv[1]).read()

word_dict = {'ADJECTIVE':'Enter an adjective:', 
    'NOUN':'Enter a noun:',
    'ADVERB':'Enter an adverb:',
    'VERB':'Enter a verb:'}

Regex = re.compile (r'ADJECTIVE|NOUN|ADVERB|VERB')
keywords = Regex.findall(file)
words = tuple([input(word_dict[word]) for word in keywords])
new_file = Regex.sub(r'%s', file) % words
with open('new.txt', 'w') as f:
    f.write(new_file)
```

## Chapter 8.2 -- Regex Search

Write a program that opens all .txt files in a folder and searches for any line that matches a user-supplied regular expression. The results should be printed to the screen.

```python
#! python3
import os, re, codecs

folder = r'C:\Users\Administrator\test' # folder dir
os.chdir(folder)
listdir = os.listdir(folder)
listdir = [dir for dir in listdir if dir.endswith('.txt')]
Regex = re.compile(input('Enter the regular expression:'))
for dir in listdir:
    words = codecs.open(dir, 'r', 'utf-8').read()
    word = Regex.findall(words)
    print(word)
```

# Getting Started with Python

## Assignment 3.3--Error

```python
score = raw_input("Enter Score: ")
try:
    score = float(score) and score <= 1
except:
    print "Error"
    quit()
if score >= 0.9:
    print "A"
elif score >= 0.8:
    print "B"
elif score >= 0.7:
    print "C"
elif score >= 0.6:
    print "D"
elif score < 0.6:
    print "F"
```

I get F whatever number I input.

> Try printing score (shown above in my edit). You'll find that this form of assignment using the 'and' operator will return a True or False. The mathematical value of True is 1 and False is 0. So since your assignment of score evaluates to False, it is less than 0.6 and returns an 'F'.

### Notice: 
1. Assignment using  the 'and' operator(**Logical Operators**) will return a True or False
2. The mathematical value of True is 1 and False is 0
3. print is a way to find error!

# Python in codecademy

## purify

Define a function called purify that takes in a list of numbers, removes all odd numbers in the list, and returns the result.

For example, purify([1,2,3]) should return [2].

> Do not directly modify the list you are given as input; instead, return a new list with only the even numbers.

```python
def purify(x):
    for n in x:
        if n%2 != 0:
            x.remove(n)
            continue
    return x

print purify([4, 5, 5, 4])
#prints [4, 5, 4]
```

> remove() changes the list index in the loop

```python
def purify(x):
    y = list()
    for n in x:
        if n%2 == 0:
            y.append(n)
    return y
    
print purify([4, 5, 5, 4])
#prints [4, 4]
```

[^1]: [Chapter 9](https://automatetheboringstuff.com/chapter9/)
