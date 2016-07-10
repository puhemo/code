---
title: "Python Part 5: File Input/Output"
date: 2016-06-21 10:00
modified: 2016-07-10
categories:
  - Python
tags:
  - Python Syntax
  - Python 2.x
published: true
excerpt: |
  Working with files
series: "Intro to Python"	
---
{% include series.html %}

* TOC
{:toc}

Until now, the Python code you've been writing comes from one source and only goes to one place: you type it in at the keyboard and its results are displayed in the console. But what if you want to read information from a file on your computer, and/or write that information to another file?

This process is called file I/O (the "I/O" stands for "input/output"), and Python has a number of built-in functions that handle this for you.

## Open a file

`open()` is the built-in function which tells Python to open the file.

```python
open( 'filename' ,  'mode') # mode: 'r' and 'w'
```

```python
inp = raw_input("Enter file name")# asks for a file name
fhand= open(inp) # handling the file
```

Opening a file does not cause Python to read all the data in the file, but it makes the information in the file available to Python to use - it creates a **connection** between Python and the file on the hard drive, referred to as a **"Handle"**.

##  Counting lines in a file

```python
fhand = open("words.txt")
count = 0
for line in fhand: # line ?
    count = count + 1
print "line count", count #Don't use '+'
```

##  Reading the whole file -- read()[^1]

```python
fhand =  open("words.txt")
inp = fhand.read() # reads the whole file into memory
print len(inp)# returns the number of characters in a file
print inp # prints the whole file
inp.close() # close the file
```

## Reading Between the Lines

If you open a file and call `.readline()` on the file object, you'll get the first line of the file; subsequent calls to .readline() will return successive lines.

```python
my_file = open('text.txt', 'r')
print my_file.readline()
my_file.close()
```

##  Searching through a file -- startswith()[^2]

```python
fhand= open("mbox-short.txt")
for line in fhand:
    # line = line.rstrip()
    if line.startswith("From "):
        print line
```

> note that methods something.strip() [^3]or something.rstrip()[^4] should be used to get rid of the extra \n (new line character)[^5]. 

##  Using try, except, and open

```python
fname = raw_input('Enter the file name: ')
# QA 
try:
    fhand = open(fname)
except:
    print 'File cannot be opened:', fname
    exit()

count = 0
for line in fhand:
    if line.startswith('Subject:') : 
        count = count + 1
print 'There were', count, 'subject lines in', fname
```

```python
fhand = raw_input('Enter the file name: ')
while True:
    try:
        var_text = open('C:\\...path...\\%s.txt' % (fhand), 'r')
        for line in var_text:
            line = line.rstrip()
            if not '@uct.ac.za' in line:
                continue
            print line
            
    except:
        print 'Not Found'
        fhand = raw_input('Enter the file name: ')
        continue
        
    quit()
```

##  Writing files

```python
# If the file already exists, opening it in write mode clears out the old data and starts fresh, so be careful! 
# If the file doesn’t exist, a new one is created.
>>> fout = open('output.txt', 'w')
>>> print fout
<open file 'output.txt', mode 'w' at 0xb7eb2410>
```

You **must** close the file. You do this simply by calling `my_file.close()` . If you don't close your file, Python won't write to it properly. From here on out, you gotta close your files!

```python
my_list = [i**2 for i in range(1,11)]

my_file = open("output.txt", "r+")

for list in my_list:
    my_file.write('str(list)', "\n")

my_file.close()
```

During the I/O process, data is **buffered**: this means that it is held in a temporary location before being written to the file.  

Python doesn't **flush the buffer**—that is, write data to the file—until it's sure you're done writing. One way to do this is to close the file. If you write to a file without closing, the data won't make it to the target file.

## The 'with' and 'as' Keywords

 With `with` and `as` to automatically close the files.

```python
with open("file", "mode") as variable:
    # Read or write to the file
```


[^1]: read()方法會一次讀取所有的檔案內容，在不使用檔案時，可以使用fileObject.close()將檔案關閉以節省資源.
[^2]: startswith() 方法用于检查字符串是否是以指定子字符串开头，如果是则返回 True，否则返回 False.
[^3]: 去除字符串的**首尾**字符(默认去除首尾空格)
[^4]: 去除**右边**的字符(默认去除右边空格), 也可以去除\n; something,lstrip()用于去除**左边**的字符
[^5]: '\n' represents a newline. Newline is `one character`, even though it is represented by two.

## More Info:

* [Python startswith()方法](http://www.runoob.com/python/att-string-startswith.html)
* [Python 文件I/O](http://www.runoob.com/python/python-files-io.html)
* [Pythonlearn:resources-week07](https://share.coursera.org/wiki/index.php/Pythonlearn:resources-week07)

{% include series.html %}
