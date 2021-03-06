---
title: "Python Part 06: File Input/Output"
date: 2016-06-21 10:00
modified: 2016-08-15
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

## Opening and Closing Files

Python provides basic functions and methods necessary to manipulate files by default. You can do most of the file manipulation using a **file** object.

### Open a file

`open()` is the built-in function which tells Python to open the file.

#### Syntax

```python
file object = open(file_name [, access_mode][, buffering])
```

Here are parameter details:

- **file_name:** The file_name argument is a string value that contains the name of the file that you want to access.
- **access_mode:** The access_mode determines the mode in which the file has to be opened, i.e., read, write, append, etc. A complete list of possible values is given below in the table. This is optional parameter and the default file access mode is read (r).
- **buffering:** If the buffering value is set to 0, no buffering  takes place. If the buffering value is 1, line buffering is performed while accessing a file. If you specify the buffering value as an integer greater than 1, then buffering action is performed with the indicated buffer size. If negative, the buffer size is the system default(default behavior).

Here is a list of the different modes of opening a file −

| Modes | Description                              |
| ----- | ---------------------------------------- |
| r     | Opens a file for **reading only**. The file pointer is placed at the beginning of the file. This is the default mode. |
| rb    | Opens a file for **reading only** in **binary** format. The file pointer is placed at the beginning of the file. This is the default mode. |
| r+    | Opens a file for both **reading and writing**. The file pointer placed at the beginning of the file. |
| rb+   | Opens a file for both reading and writing in binary format. The file pointer placed at the beginning of the file. |
| w     | Opens a file for **writing only**. Overwrites the file if the file exists. If the file does not exist, creates a new file for writing. |
| wb    | Opens a file for writing only in binary format. Overwrites the file if the file exists. If the file does not exist, creates a new file for writing. |
| w+    | Opens a file for both **writing and reading**. Overwrites the existing file if the file exists. If the file does not exist, creates a new file forreading and writing. |
| wb+   | Opens a file for both writing and reading in binary format. Overwrites the existing file if the file exists. If the file does not exist, creates a new file for reading and writing. |
| a     | Opens a file for **appending**. The file pointer is at the end of the file if the file exists. That is, the file is in the append mode. If the file does not exist, it creates a new file for writing. |
| ab    | Opens a file for appending in binary format. The file pointer is at the end of the file if the file exists. That is, the file is in the append mode. If the file does not exist, it creates a new file for writing. |
| a+    | Opens a file for both **appending and reading**. The file pointer is at the end of the file if the file exists. The file opens in the append mode. If the file does not exist, it creates a new file for reading and writing. |
| ab+   | Opens a file for both appending and reading in binary format. The file pointer is at the end of the file if the file exists. The file opens in the append mode. If the file does not exist, it creates a new file for reading and writing. |

#### Example

```python
open( 'filename' ,  'mode') # mode: 'r' and 'w'
```

```python
inp = raw_input("Enter file name")# asks for a file name
fhand= open(inp) # handling the file
```

Opening a file does not cause Python to read all the data in the file, but it makes the information in the file available to Python to use - it creates a **connection** between Python and the file on the hard drive, referred to as a **"Handle"**.

### The *file* Object Attributes

Once a file is opened and you have one *file* object, you can get various information related to that file.

Here is a list of all attributes related to file object:

| Attribute      | Description                              |
| -------------- | ---------------------------------------- |
| file.closed    | Returns true if file is closed, false otherwise. |
| file.mode      | Returns access mode with which file was opened. |
| file.name      | Returns name of the file.                |
| file.softspace | Returns false if space explicitly required with print, true otherwise. |

#### Example

```python
# Open a file
fo = open("foo.txt", "wb")
print "Name of the file: ", fo.name
print "Closed or not : ", fo.closed
print "Opening mode : ", fo.mode
print "Softspace flag : ", fo.softspace
```

This produces the following result −

```
Name of the file:  foo.txt
Closed or not :  False
Opening mode :  wb
Softspace flag :  0
```

### The *close()* Method

The `close()` method of a *file* object flushes any unwritten information and closes the file object, after which no more writing can be done.

Python automatically closes a file when the reference object of a file is reassigned to another file. It is a good practice to use the `close()` method to close a file.

#### Syntax

```python
fileObject.close();
```

#### Example

```python
# Open a file
fo = open("foo.txt", "wb")
print "Name of the file: ", fo.name

# Close opend file
fo.close()
```

This produces the following result −

```
Name of the file:  foo.txt
```

### The 'with' and 'as' Keywords

 With `with` and `as` to automatically close the files.

```python
with open("file", "mode") as variable:
    # Read or write to the file
```

#### Example[^7]

```python
import codecs
with codecs.open('/Users/michael/gbk.txt', 'r', 'gbk') as f:
    f.read() # u'\u6d4b\u8bd5'
```

###  Counting lines in a file

```python
fhand = open("words.txt")
count = 0
for line in fhand: # line ?
    count = count + 1
print "line count", count # Don't use '+'
```

###  Using try, except, and open

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


## Reading and Writing Files

The *file* object provides a set of access methods to make our lives easier. We would see how to use *read()* and *write()* methods to read and write files.

###  Reading the whole file -- read()[^1]

The *read()* method reads a string from an open file. It is important to note that Python strings can have binary data. apart from text data.

#### Syntax

```python
fileObject.read([count]);
```

Here, passed parameter is the number of bytes to be read from the opened file. This method starts reading from the beginning of the file and if *count* is missing, then it tries to read as much as possible, maybe until the end of file.[^6]

#### Example 

```python
fhand =  open("words.txt")
inp = fhand.read() # reads the whole file into memory
print len(inp)# returns the number of characters in a file
print inp # prints the whole file
inp.close() # close the file
```

### Reading Between the Lines

If you open a file and call `.readline()`[^11] on the file object, you'll get the first line of the file; subsequent calls to .readline() will return successive lines.

```python
my_file = open('text.txt', 'r')
print my_file.readline()
my_file.close()
```

### File Positions

The`tell()` method tells you the **current position** within the file; in other words, the next read or write will occur at that many bytes from the beginning of the file.

The `seek(offset[, from])` method **changes** the current file **position**. The *offset* argument indicates the number of bytes to be moved. The *from* argument specifies the reference position from where the bytes are to be moved.

If *from* is set to 0, it means use the beginning of the file as the reference position and 1 means use the current position as the reference position and if it is set to 2 then the end of the file would be taken as the reference position.

#### Example

Let us take a file *foo.txt*, which we created above.

```python
# Open a file
fo = open("foo.txt", "r+")
str = fo.read(10);
print "Read String is : ", str

# Check current position
position = fo.tell();
print "Current file position : ", position

# Reposition pointer at the beginning once again
position = fo.seek(0, 0);
str = fo.read(10);
print "Again read String is : ", str
# Close opend file
fo.close()
```

This produces the following result −

```
Read String is :  Python is
Current file position :  10
Again read String is :  Python is
```

###  Searching through a file -- startswith()[^2]

```python
fhand= open("mbox-short.txt")
for line in fhand:
    # line = line.rstrip()
    if line.startswith("From "):
        print line
```

> note that methods something.strip() [^3]or something.rstrip()[^4] should be used to get rid of the extra \n (new line character)[^5]. 

### Empty the file

`truncate` -- Empties the file. Watch out if you care about the file.

```python
from sys import argv

script, filename = argv

print "We're going to erase %r." % filename
print "If you don't want that, hit CTRL-C (^C)."
print "If you do want that, hit RETURN."

raw_input("?")

print "Opening the file..."
target = open(filename, 'w')

print "Truncating the file.  Goodbye!"
target.truncate()

print "Now I'm going to ask you for three lines."

line1 = raw_input("line 1: ")
line2 = raw_input("line 2: ")
line3 = raw_input("line 3: ")

print "I'm going to write these to the file."

target.write(line1)
target.write("\n")
target.write(line2)
target.write("\n")
target.write(line3)
target.write("\n")

print "And finally, we close it."
target.close()
```

###  Writing files

The *write()* method writes any string to an open file. It is important to note that Python strings can have binary data and not just text.

The write() method does not add a newline character ('\n') to the end of the string −

#### Syntax

```python
fileObject.write(string);
```

Here, passed parameter is the content to be written into the opened file.

#### Example

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

###  Copy one file to another[^10]

```python
from sys import argv
from os.path import exists

script, from_file, to_file = argv

print "Copying from %s to %s" % (from_file, to_file)

# we could do these two on one line, how?
in_file = open(from_file)
indata = in_file.read()

print "The input file is %d bytes long" % len(indata)

print "Does the output file exist? %r" % exists(to_file)
print "Ready, hit RETURN to continue, CTRL-C to abort."
raw_input()

out_file = open(to_file, 'w')
out_file.write(indata)

print "Alright, all done."

out_file.close()
in_file.close()
```

## Renaming and Deleting Files

Python **os** module provides methods that help you perform file-processing operations, such as renaming and deleting files.

To use this module you need to import it first and then you can call any related functions.

### The `rename()` Method

The *rename()* method takes two arguments, the current filename and the new filename.

#### Syntax

```python
os.rename(current_file_name, new_file_name)
```

#### Example

Following is the example to rename an existing file *test1.txt*:

```python
import os

# Rename a file from test1.txt to test2.txt
os.rename( "test1.txt", "test2.txt" )
```

### The `remove()` Method

You can use the *remove()* method to delete files by supplying the name of the file to be deleted as the argument.

#### Syntax

```python
os.remove(file_name)
```

#### Example

Following is the example to delete an existing file *test2.txt* −

```python
import os

# Delete file test2.txt
os.remove("text2.txt")
```

## Directories in Python

All files are contained within various directories, and Python has no problem handling these too. The **os** and **os.path** module has several methods that help you create, remove, and change directories.

```python
# 查看当前目录的绝对路径:
>>> os.path.abspath('.')
'/Users/michael'
# 在某个目录下创建一个新目录，
# 首先把新目录的完整路径表示出来:
>>> os.path.join('/Users/michael', 'testdir')
'/Users/michael/testdir'
# 然后创建一个目录:
>>> os.mkdir('/Users/michael/testdir')
# 删掉一个目录:
>>> os.rmdir('/Users/michael/testdir')
```

### The **os.path** module

The **[os.path](https://docs.python.org/2/library/os.path.html)** module implements some useful functions on pathnames.[^8]

#### `os.path.join()`

Join one or more path components intelligently.[^9]

```python
>>> os.path.join('/Users/michael', 'testdir')
'/Users/michael/testdir'
```

#### `os.path.split()`

Split the pathname path into a pair, `(head, tail)` where tail is the last pathname component and head is everything leading up to that. [^9]

```python
>>> os.path.split('/Users/michael/testdir/file.txt')
('/Users/michael/testdir', 'file.txt')
```

#### `os.path.splitext()`

Split the pathname path into a pair `(root, ext)` such that `root + ext == path`.[^9]

```python
>>> os.path.splitext('/path/to/file.txt')
('/path/to/file', '.txt')
```

### The `mkdir()` Method

You can use the `mkdir()` method of the **os** module to create directories in the current directory. You need to supply an argument to this method which contains the name of the directory to be created.

#### Syntax

```python
os.mkdir("newdir")
```

#### Example

Following is the example to create a directory *test* in the current directory −

```python
import os

# Create a directory "test"
os.mkdir("test")
```

### The `chdir()` Method

You can use the `chdir()` method to **change the current directory**. The `chdir()` method takes an argument, which is the name of the directory that you want to make the current directory.

#### Syntax

```python
os.chdir("newdir")
```

#### Example

Following is the example to go into "/home/newdir" directory −

```python
import os

# Changing a directory to "/home/newdir"
os.chdir("/home/newdir")
```

### The `getcwd()` Method

The `getcwd()` method displays the current working directory.

#### Syntax

```python
os.getcwd()
```

#### Example

Following is the example to give current directory −

```python
import os

# This would give location of the current directory
os.getcwd()
```

### The `rmdir()` Method

The `rmdir()` method **deletes the directory**, which is passed as an argument in the method.

Before removing a directory, all the contents in it should be removed.

#### Syntax:

```python
os.rmdir('dirname')
```

#### Example

Following is the example to remove "/tmp/test" directory. It is required to give fully qualified name of the directory, otherwise it would search for that directory in the current directory.

```python
import os

# This would  remove "/tmp/test"  directory.
os.rmdir( "/tmp/test"  )
```

### file filter

```python
>>> [x for x in os.listdir('.') if os.path.isdir(x)]
['.lein', '.local', '.m2', '.npm', '.ssh', '.Trash', '.vim', 'Adlm', 'Applications', 'Desktop', ...]
```

```python
>>> [x for x in os.listdir('.') if os.path.isfile(x) and os.path.splitext(x)[1]=='.py']
['apis.py', 'config.py', 'models.py', 'pymonitor.py', 'test_db.py', 'urls.py', 'wsgiapp.py']
```

[^1]: read()方法會一次讀取所有的檔案內容，在不使用檔案時，可以使用fileObject.close()將檔案關閉以節省資源.
[^2]: startswith() 方法用于检查字符串是否是以指定子字符串开头，如果是则返回 True，否则返回 False.
[^3]: 去除字符串的**首尾**字符(默认去除首尾空格)
[^4]: 去除**右边**的字符(默认去除右边空格), 也可以去除\n; something,lstrip()用于去除**左边**的字符
[^5]: '\n' represents a newline. Newline is `one character`, even though it is represented by two.
[^6]: 调用`read()`会一次性读取文件的全部内容，如果文件有10G，内存就爆了，所以，要保险起见，可以反复调用read(size)方法，每次最多读取size个字节的内容。另外，调用readline()可以每次读取一行内容，调用readlines()一次读取所有内容并按行返回list。
[^7]: [字符编码](http://www.liaoxuefeng.com/wiki/001374738125095c955c1e6d8bb493182103fac9270762a000/001386820066616a77f826d876b46b9ac34cb5f34374f7a000)
[^8]: [操作文件和目录](http://www.liaoxuefeng.com/wiki/001374738125095c955c1e6d8bb493182103fac9270762a000/0013868321590543ff305fb9f9949f08d760883cc243812000)
[^9]: 这些合并、拆分路径的函数并不要求目录和文件要真实存在，它们只对字符串进行操作。
[^10]: [Exercise 17: More Files](http://learnpythonthehardway.org/book/ex17.html)
[^11]: Inside `readline()` is code that scans each byte of the file until it finds a `\n` character, then stops reading the file to return what it found so far. 

## Reference:

* [Python startswith()方法](http://www.runoob.com/python/att-string-startswith.html)
* [Python 文件I/O](http://www.runoob.com/python/python-files-io.html)
* [Pythonlearn:resources-week07](https://share.coursera.org/wiki/index.php/Pythonlearn:resources-week07)
* [Python Files I/O](http://www.tutorialspoint.com/python/python_files_io.htm)
* [文件读写](http://www.liaoxuefeng.com/wiki/001374738125095c955c1e6d8bb493182103fac9270762a000/001386820066616a77f826d876b46b9ac34cb5f34374f7a000)
* [操作文件和目录](http://www.liaoxuefeng.com/wiki/001374738125095c955c1e6d8bb493182103fac9270762a000/0013868321590543ff305fb9f9949f08d760883cc243812000)
 

{% include series.html %}
