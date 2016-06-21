---
title: "Python Part 5: File"
date: 2016-06-21 10:00
modified: 2016-06-21
categories:
  - Python
tags:
  - Python
  - Syntax
published: true
excerpt: |
  Working with files
series: "Intro to Python"	
---
{% include series.html %}

* TOC
{:toc}

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
