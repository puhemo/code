---
title: "Python Quick Guide"
date: 2016-07-25
modified: 2016-07-25
published: true
categories:
  - Python
tags:
  - Python 2.x
  - Quick Guide
excerpt: |
    Python is a high-level, interpreted, interactive and object oriented-scripting language.
---

## Python Overview

Python is a high-level, interpreted, interactive and object oriented-scripting language.

- **Python is Interpreted**
- **Python is Interactive**
- **Python is Object-Oriented**
- **Python is Beginner's Language**

Python's feature highlights include:

- **Easy-to-learn**
- **Easy-to-read**
- **Easy-to-maintain**
- **A broad standard library**
- **Interactive Mode**
- **Portable**
- **Extendable**
- **Databases**
- **GUI Programming**
- **Scalable**

## Getting Python

The most up-to-date and current source code, binaries, documentation, news, etc. is available at the official website of Python:

**Python Official Website :** [http://www.python.org/](http://www.python.org/)

You can download the Python documentation from the following site. The documentation is available in HTML, PDF, and PostScript formats.

**Python Documentation Website :** [www.python.org/doc/](http://www.python.org/doc/)

## First Python Program

### Interactive Mode Programming

Invoking the interpreter without passing a script file as a parameter brings up the following prompt:

```python
root# python
Python 2.5 (r25:51908, Nov  6 2007, 16:54:01)
[GCC 4.1.2 20070925 (Red Hat 4.1.2-27)] on linux2
Type "help", "copyright", "credits" or "license" for more info.
>>>
```

Type the following text to the right of the Python prompt and press the Enter key:

```
>>> print "Hello, Python!";
```

This will produce following result:

```
Hello, Python!
```

## Python Identifiers

A Python identifier is a name used to identify a variable, function, class, module, or other object. An identifier starts with a letter A to Z or a to z or an underscore (_) followed by zero or more letters, underscores, and digits (0 to 9).

Python does not allow punctuation characters such as @, $, and % within identifiers. Python is a case sensitive programming language.  Thus **Manpower** and **manpower** are two different identifiers in Python.

Here are following identifier naming convention for Python:

- Class names start with an uppercase letter and all other identifiers with a lowercase letter.
- Starting an identifier with a single leading underscore indicates by convention that the identifier is meant to be private. 
- Starting an identifier with two leading underscores indicates a strongly private identifier.
- If the identifier also ends with two trailing underscores, the identifier is a language-defined special name.

## Reserved Words

The following list shows the reserved words in Python. These reserved words may not be used as constant or variable or any other identifier names.

| and      | exec    | not    |
| -------- | ------- | ------ |
| assert   | finally | or     |
| break    | for     | pass   |
| class    | from    | print  |
| continue | global  | raise  |
| def      | if      | return |
| del      | import  | try    |
| elif     | in      | while  |
| else     | is      | with   |
| except   | lambda  | yield  |

## Lines and Indentation

One of the first caveats programmers encounter when learning Python is the fact that there are no braces to indicate blocks of code for class and function definitions or flow control. Blocks of code are denoted by line indentation, which is rigidly enforced.

The number of spaces in the indentation is variable, but all statements within the block must be indented the same amount. Both blocks in this example are fine:

```python
if True:
    print "True"
else:
  print "False"
```

However, the second block in this example will generate an error:

```python
if True:
    print "Answer"
    print "True"
else:
    print "Answer"
  print "False"
```

## Multi-Line Statements

Statements in Python typically end with a new line. Python does, however, allow the use of the line continuation character (\) to denote that the line should continue. For example:

```python
total = item_one + \
        item_two + \
        item_three
```

Statements contained within the [], {}, or () brackets do not need to use the line continuation character. For example:

```python
days = ['Monday', 'Tuesday', 'Wednesday',
             'Thursday', 'Friday']
```

## Quotation in Python

Python accepts single ('), double (") and triple (''' or """) quotes to denote string literals, as long as the same type of quote starts and ends the string.

The triple quotes can be used to span the string across multiple lines. For example, all the following are legal:

```python
word = 'word'
sentence = "This is a sentence."
paragraph = """This is a paragraph. It is
made up of multiple lines and sentences."""
```

## Comments in Python

A hash sign (#) that is not inside a string literal begins a comment. All characters after the # and up to the physical line end are part of the comment, and the Python interpreter ignores them.

```python
#!/usr/bin/python

# First comment
print "Hello, Python!";  # second comment
```

This will produce following result:

```
Hello, Python!
```

A comment may be on the same line after a statement or expression:

```python
name = "Madisetti" # This is again comment
```

You can comment multiple lines as follows:

```python
# This is a comment.
# This is a comment, too.
# This is a comment, too.
# I said that already.
```

## Using Blank Lines

A line containing only whitespace, possibly with a comment, is known as a blank line, and Python totally ignores it.

In an interactive interpreter session, you must enter an empty physical line to terminate a multiline statement.

## Multiple Statements on a Single Line

The semicolon ( ; ) allows multiple statements on the single line given that neither statement starts a new code block. Here is a sample snip using the semicolon:

```python
import sys; x = 'foo'; sys.stdout.write(x + '\n')
```

## Multiple Statement Groups as Suites

Groups of individual statements making up a single code block are called **suites** in Python.

Compound or complex statements, such as if, while, def, and class, are those which require a header line and a suite.

Header lines begin the statement (with the keyword) and terminate with a colon ( : ) and are followed by one or more lines which make up the suite.

### Example

```python
if expression : 
   suite
elif expression : 
   suite 
else : 
   suite
```

## Python - Variable Types

Variables are nothing but reserved memory locations to store values. This means that when you create a variable you reserve some space in memory.

Based on the data type of a variable, the interpreter allocates memory and decides what can be stored in the reserved memory. Therefore, by assigning different data types to variables, you can store integers, decimals, or characters in these variables.

## Assigning Values to Variables

The operand to the left of the = operator is the name of the variable, and the operand to the right of the = operator is the value stored in the variable. For example:

```python
counter = 100          # An integer assignment
miles   = 1000.0       # A floating point
name    = "John"       # A string

print counter
print miles
print name
```

## Standard Data Types

Python has five standard data types:

- Numbers
- String
- List
- Tuple
- Dictionary

## Python Numbers

Number objects are created when you assign a value to them. For example:

```python
var1 = 1
var2 = 10
```

Python supports four different numerical types:

- int (signed integers)
- long (long integers [can also be represented in octal and hexadecimal])
- float (floating point real values)
- complex (complex numbers)

Here are some examples of numbers:

| int    | long                  | float      | complex    |
| ------ | --------------------- | ---------- | ---------- |
| 10     | 51924361L             | 0.0        | 3.14j      |
| 100    | -0x19323L             | 15.20      | 45.j       |
| -786   | 0122L                 | -21.9      | 9.322e-36j |
| 080    | 0xDEFABCECBDAECBFBAEL | 32.3+e18   | .876j      |
| -0490  | 535633629843L         | -90.       | -.6545+0J  |
| -0x260 | -052318172735L        | -32.54e100 | 3e+26J     |
| 0x69   | -4721885298529L       | 70.2-E12   | 4.53e-7j   |

## Python Strings

Strings in Python are identified as a contiguous set of characters in between quotation marks.

### Example

```python
str = 'Hello World!'

print str          # Prints complete string
print str[0]       # Prints first character of the string
print str[2:5]     # Prints characters starting from 3rd to 6th
print str[2:]      # Prints string starting from 3rd character
print str * 2      # Prints string two times
print str + "TEST" # Prints concatenated string
```

## Python Lists

Lists are the most versatile of Python's compound data types. A list contains items separated by commas and enclosed within square brackets ([]).

```python
list = [ 'abcd', 786 , 2.23, 'john', 70.2 ]
tinylist = [123, 'john']

print list          # Prints complete list
print list[0]       # Prints first element of the list
print list[1:3]     # Prints elements starting from 2nd to 4th
print list[2:]      # Prints elements starting from 3rd element
print tinylist * 2  # Prints list two times
print list + tinylist # Prints concatenated lists
```

## Python Tuples

A tuple is another sequence data type that is similar to the list. A tuple consists of a number of values separated by commas. Unlike lists, however, tuples are enclosed within parentheses.

Tuples can be thought of as **read-only** lists.

```python
tuple = ( 'abcd', 786 , 2.23, 'john', 70.2  )
tinytuple = (123, 'john')

print tuple           # Prints complete list
print tuple[0]        # Prints first element of the list
print tuple[1:3]      # Prints elements starting from 2nd to 4th
print tuple[2:]       # Prints elements starting from 3rd element
print tinytuple * 2   # Prints list two times
print tuple + tinytuple # Prints concatenated lists
```

## Python Dictionary

Python 's dictionaries are hash table type. They work like associative arrays or hashes found in Perl and consist of key-value pairs. 

```python
tinydict = {'name': 'john','code':6734, 'dept': 'sales'}
print dict['one']       # Prints value for 'one' key
print dict[2]           # Prints value for 2 key
print tinydict          # Prints complete dictionary
print tinydict.keys()   # Prints all the keys
print tinydict.values() # Prints all the values
```

## Python - Basic Operators

| Operator | Description                              | Example                                  |
| -------- | ---------------------------------------- | ---------------------------------------- |
| +        | Addition - Adds values on either side of the operator | a + b will give 30                       |
| -        | Subtraction - Subtracts right hand operand from left hand operand | a - b will give -10                      |
| *        | Multiplication - Multiplies values on either side of the operator | a * b will give 200                      |
| /        | Division - Divides left hand operand by right hand operand | b / a will give 2                        |
| %        | Modulus - Divides left hand operand by right hand operand and returns remainder | b % a will give 0                        |
| **       | Exponent - Performs exponential (power) calculation on operators | a**b will give 10 to the power 20        |
| //       | Floor Division - The division of operands where the result is the quotient in which the digitsafter the decimal point are removed. | 9//2 is equal to 4 and 9.0//2.0 is equal to 4.0 |
| ==       | Checks if the value of two operands are equal or not, if yes then condition becomes true. | (a == b) is not true.                    |
| !=       | Checks if the value of two operands are equal or not, if values are not equal then condition becomes true. | (a != b) is true.                        |
| <>       | Checks if the value of two operands are equal or not, if values are not equal then condition becomes true. | (a <> b) is true. This is similar to != operator. |
| >        | Checks if the value of left  operand is greater than the value of right operand, if yes then condition becomes true. | (a > b) is not true.                     |
| <        | Checks if the value of left  operand is less than the value of right operand, if yes then condition becomes true. | (a < b) is true.                         |
| >=       | Checks if the value of left  operand is greater than or equal to the value of right operand, if yes then condition becomes true. | (a >= b) is not true.                    |
| <=       | Checks if the value of left  operand is less than or equal to the value of right operand, if yes then condition becomes true. | (a <= b) is true.                        |
| =        | Simple assignment operator, Assigns values from right side operands to left side operand | c = a + b will assigne value of a + b into c |
| +=       | Add AND assignment operator, It adds right operand to the left operand and assign the result to left operand | c += a is equivalent to c = c + a        |
| -=       | Subtract AND assignment operator, It subtracts right operand from the left operand and assign the result to left operand | c -= a is equivalent to c = c - a        |
| *=       | Multiply AND assignment operator, It multiplies right operand with the left operand and assign the result to left operand | c *= a is equivalent to c = c * a        |
| /=       | Divide AND assignment operator, It divides left operand with the right operand and assign the result to left operand | c /= a is equivalent to c = c / a        |
| %=       | Modulus AND assignment operator, It takes modulus using two operands and assign the result to  left operand | c %= a is equivalent to c = c % a        |
| **=      | Exponent AND assignment operator, Performs exponential (power) calculation on operators and assign value to the left operand | c **= a is equivalent to c = c ** a      |
| //=      | Floor Dividion and assigns a value, Performs floor division on operators and assign value to the left operand | c //= a is equivalent to c = c // a      |
| &        | Binary AND Operator copies a bit to the result if it exists in both operands. | (a & b) will give 12 which is 0000 1100  |
| \|       | Binary OR Operator copies a bit if it exists in eather operand. | (a \| b) will give 61 which is 0011 1101 |
| ^        | Binary XOR Operator copies the bit if it is set in one operand but not both. | (a ^ b) will give 49 which is 0011 0001  |
| ~        | Binary Ones Complement Operator is unary and has the efect of 'flipping' bits. | (~a ) will give -61 which is 1100 0011 in 2's complement form due to a signed binary number. |
| <<       | Binary Left Shift Operator. The left operands value is moved left by the number of bits specified by the right operand. | a << 2 will give 240 which is 1111 0000  |
| >>       | Binary Right Shift Operator. The left operands value is moved right by the number of bits specified by the right operand. | a >> 2 will give 15 which is 0000 1111   |
| and      | Called Logical AND  operator. If both the operands are true then then condition becomes true. | (a and b) is true.                       |
| or       | Called Logical OR Operator.  If any of the two operands are non zero then then condition becomes true. | (a or b) is true.                        |
| not      | Called Logical NOT Operator.  Use to reverses the logical state of its operand. If a condition is true then Logical NOT operator will make false. | not(a && b) is false.                    |
| in       | Evaluates to true if it finds a variable in the specified sequence and false otherwise. | x in y, here **in** results in a 1 if x is a member of sequence y. |
| not in   | Evaluates to true if it does not finds a variable in the specified sequence and false otherwise. | x not in y, here **not in** results in a 1 if x is not a member of sequence y. |
| is       | Evaluates to true if the variables on either side of the operator point to the same object and false otherwise. | x is y, here **is** results in 1 if id(x) equals id(y). |
| is not   | Evaluates to false if the variables on either side of the operator point to the same object and true otherwise. | x is not y, here **is not** results in 1 if id(x) is not equal to id(y). |

## Python Operators Precedence

The following table lists all operators from highest precedence to lowest.

| Operator                                | Description                              |
| --------------------------------------- | ---------------------------------------- |
| **                                      | Exponentiation (raise to the power)      |
| ~ + -                                   | Ccomplement, unary plus and minus (method names for the last two are +@ and -@) |
| * / % //                                | Multiply, divide, modulo and floor division |
| + -                                     | Addition and subtraction                 |
| >> <<                                   | Right and left bitwise shift             |
| &                                       | Bitwise 'AND'                            |
| ^ \|                                    | Bitwise exclusive `OR' and regular `OR'  |
| <= < > >=                               | Comparison operators                     |
| <> == !=                                | Equality operators                       |
| = %= /= //= -= += \|= &= >>= <<= *= **= | Assignment operators                     |
| is is not                               | Identity operators                       |
| in not in                               | Membership operators                     |
| note or and                             | Logical operators                        |

## The *if* statement

The syntax of the if statement is:

```
if expression:
   statement(s)
```

## The *else* Statement

The syntax of the *if...else* statement is:

```python
if expression:
   statement(s)
else:
   statement(s)
```

## The *elif* Statement

The syntax of the *if...elif* statement is:

```python
if expression1:
   statement(s)
elif expression2:
   statement(s)
elif expression3:
   statement(s)
else:
   statement(s)
```

## The Nested *if...elif...else* Construct

The syntax of the nested *if...elif...else* construct may be:

```python
if expression1:
   statement(s)
   if expression2:
      statement(s)
   elif expression3:
      statement(s)
   else
      statement(s)
elif expression4:
   statement(s)
else:
   statement(s)
```

## The *while* Loop

The syntax of the while look is:

```python
while expression:
   statement(s)
```

## The Infinite Loops

You must use caution when using while loops because of the possibility that this condition never resolves to a false value. This results in a loop that never ends. Such a loop is called an infinite loop.

An infinite loop might be useful in client/server programming where the server needs to run continuously so that client programs can communicate with it as and when required.

## Single Statement Suites

Similar to the **if** statement syntax, if your **while** clause consists only of a single statement, it may be placed on the same line as the while header.

Here is an example of a one-line while clause:

```python
while expression : statement
```

## The *for* Loop

The syntax of the loop look is:

```python
for iterating_var in sequence:
   statements(s)
```

## Iterating by Sequence Index

An alternative way of iterating through each item is by index offset into the sequence itself:

```python
fruits = ['banana', 'apple',  'mango']
for index in range(len(fruits)):
   print 'Current fruit :', fruits[index]

print "Good bye!"
```

## The *break* Statement

The **break** statement in Python terminates the current loop and resumes execution at the next statement, just like the traditional break found in C.

The most common use for break is when some external condition is triggered requiring a hasty exit from a loop. The **break** statement can be used in both *while* and *for* loops.

```python
for letter in 'Python':     # First Example
   if letter == 'h':
      break
   print 'Current Letter :', letter
  
var = 10                           # Second Example
while var > 0:              
   print 'Current variable value :', var
   var = var -1
   if var == 5:
      break

print "Good bye!"
```

## The *continue* Statement

The **continue** statement in Python returns the control to the beginning of the while loop. The **continue** statement rejects all the remaining statements in the current iteration of the loop and moves the control back to the top of the loop.

The **continue** statement can be used in both *while* and *for* loops.

```python
for letter in 'Python':     # First Example
   if letter == 'h':
      continue
   print 'Current Letter :', letter

var = 10                    # Second Example
while var > 0:              
   print 'Current variable value :', var
   var = var -1
   if var == 5:
      continue

print "Good bye!"
```

## The *else* Statement Used with Loops

Python supports to have an **else** statement associated with a loop statements.

- If the **else** statement is used with a **for** loop, the **else** statement is executed when the loop has exhausted iterating the list.
- If the **else** statement is used with a **while** loop, the **else** statement is executed when the condition becomes false.

## The *pass* Statement

The **pass** statement in Python is used when a statement is required syntactically but you do not want any command or code to execute.

The **pass** statement is a *null* operation; nothing happens when it executes. The **pass** is also useful in places where your code will eventually go, but has not been written yet (e.g., in stubs for example):

```python
for letter in 'Python': 
   if letter == 'h':
      pass
      print 'This is pass block'
   print 'Current Letter :', letter

print "Good bye!"
```

## Defining a Function

You can define functions to provide the required functionality. Here are simple rules to define a function in Python:

- Function blocks begin with the keyword **def** followed by the function name and parentheses ( ( ) ).
- Any input parameters or arguments should be placed within these parentheses. You can also define parameters inside these parentheses.
- The first statement of a function can be an optional statement - the documentation string of the function or *docstring*.
- The code block within every function starts with a colon (:) and is indented.
- The statement return [expression] exits a function, optionally passing back an expression to the caller. A return statement with no arguments is the same asreturn None.

### Syntax

```python
def functionname( parameters ):
   "function_docstring"
   function_suite
   return [expression]
```

By default, parameters have a positional behavior, and you need to inform them in the same order that they were defined.

### Example

Here is the simplest form of a Python function. This function takes a string as input parameter and prints it on standard screen.

```python
def printme( str ):
   "This prints a passed string into this function"
   print str
   return
```

## Calling a Function

Defining a function only gives it a name, specifies the parameters that are to be included in the function, and structures the blocks of code.

Once the basic structure of a function is finalized, you can execute it by calling it from another function or directly from the Python prompt.

Following is the example to call printme() function:

```python
# Function definition is here
def printme( str ):
   "This prints a passed string into this function"
   print str;
   return;

# Now you can call printme function
printme("I'm first call to user defined function!");
printme("Again second call to the same function");
```

This would produce following result:

```
I'm first call to user defined function!
Again second call to the same function
```

## Python - Modules

A module allows you to logically organize your Python code. Grouping related code into a module makes the code easier to understand and use.

A module is a Python object with arbitrarily named attributes that you can bind and reference.

Simply, a module is a file consisting of Python code. A module can define functions, classes, and variables. A module can also include runnable code.

### Example

The Python code for a module named *aname* normally resides in a file named *aname.py*. Here's an example of a simple module, hello.py

```python
def print_func( par ):
   print "Hello : ", par
   return
```

## The *import* Statement

You can use any Python source file as a module by executing an import statement in some other Python source file. *import* has the following syntax:

```python
import module1[, module2[,... moduleN]
```

When the interpreter encounters an import statement, it imports the module if the module is present in the search path. A search path is a list of directories that the interpreter searches before importing a module.

### Example

To import the module hello.py, you need to put the following command at the top of the script:

```python
# Import module hello
import hello

# Now you can call defined function that module as follows
hello.print_func("Zara")
```

This would produce following result:

```
Hello : Zara
```

A module is loaded only once, regardless of the number of times it is imported. This prevents the module execution from happening over and over again if multiple importsoccur.

## Opening and Closing Files

### The *open* Function

Before you can read or write a file, you have to open it using Python's built-in open() function. This function creates a file object which would be utilized to call other support methods associated with it.

### Syntax

```python
file object = open(file_name [, access_mode][, buffering])
```

Here is paramters detail:

- **file_name:** The file_name argument is a string value that contains the name of the file that you want to access.
- **access_mode:** The access_mode determines the mode in which the file has to be opened ie. read, write append etc. A complete list of possible values is given below in the table. This is optional parameter and the default file access mode is read (r) 
- **buffering:** If the buffering value is set to 0, no buffering will take place. If the buffering value is 1, line buffering will be performed while accessing a file. If you specify the buffering value as an integer greater than 1, then buffering action will be performed with the indicated buffer size. This is optional paramter.

Here is a list of the different modes of opening a file:

| Modes | Description                              |
| ----- | ---------------------------------------- |
| r     | Opens a file for reading only. The file pointer is placed at the beginning of the file. This is the default mode. |
| rb    | Opens a file for reading only in binary format. The file pointer is placed at the beginning of the file. This is the default mode. |
| r+    | Opens a file for both reading and writing. The file pointer will be at the beginning of the file. |
| rb+   | Opens a file for both reading and writing in binary format. The file pointer will be at the beginning of the file. |
| w     | Opens a file for writing only. Overwrites the file if the file exists. If the file does not exist, creates a new file for writing. |
| wb    | Opens a file for writing only in binary format. Overwrites the file if the file exists. If the file does not exist, creates a new file for writing. |
| w+    | Opens a file for both writing and reading. Overwrites the existing file if the file exists. If the file does not exist, creates a new file forreading and writing. |
| wb+   | Opens a file for both writing and reading in binary format. Overwrites the existing file if the file exists. If the file does not exist, creates a new file for reading and writing. |
| a     | Opens a file for appending. The file pointer is at the end of the file if the file exists. That is, the file is in the append mode. If the file does not exist, it creates a new file for writing. |
| ab    | Opens a file for appending in binary format. The file pointer is at the end of the file if the file exists. That is, the file is in the append mode. If the file does not exist, it creates a new file for writing. |
| a+    | Opens a file for both appending and reading. The file pointer is at the end of the file if the file exists. The file opens in the append mode. If the file does not exist, it creates a new file for reading and writing. |
| ab+   | Opens a file for both appending and reading in binary format. The file pointer is at the end of the file if the file exists. The file opens in the append mode. If the file does not exist, it creates a new file for reading and writing. |

### The *file* object atrributes

Once a file is opened and you have one *file* object, you can get various information related to that file.

Here is a list of all attributes related to file object:

| Attribute      | Description                              |
| -------------- | ---------------------------------------- |
| file.closed    | Returns true if file is closed, false otherwise. |
| file.mode      | Returns access mode with which file was opened. |
| file.name      | Returns name of the file.                |
| file.softspace | Returns false if space explicitly required with print, true otherwise. |

### The *close()* Method

The close() method of a file object flushes any unwritten information and closes the file object, after which no more writing can be done.

```
fileObject.close();
```

## Reading and Writing Files

### The *write()* Method

#### Syntax

```
fileObject.write(string);
```

### The *read()* Method

#### Syntax

```
fileObject.read([count]);
```

## File Positions:

The *tell()* method tells you the current position within the file in other words, the next read or write will occur at that many bytes from the beginning of the file:

The *seek(offset[, from])* method changes the current file position. The *offset* argument indicates the number of bytes to be moved. The *from*argument specifies the reference position from where the bytes are to be moved.

If *from* is set to 0, it means use the beginning of the file as the reference position and 1 means use the current position as the reference position and if it is set to 2 then the end of the file would be taken as the reference position.

## Renaming and Deleting Files

### Syntax

```python
os.rename(current_file_name, new_file_name)
```

### The *remove()* Method

### Syntax

```python
os.remove(file_name)
```

## Directories in Python

### The *mkdir()* Method

You can use the *mkdir()* method of the os module to create directories in the current directory. You need to supply an argument to this method, which contains the name of the directory to be created.

#### Syntax

```python
os.mkdir("newdir")
```

### The *chdir()* Method

You can use the *chdir()* method to change the current directory. The chdir() method takes an argument, which is the name of thedirectory that you want to make the current directory.

#### Syntax

```python
os.chdir("newdir")
```

### The *getcwd()* Method

The *getcwd()* method displays the current working directory.

#### Syntax

```python
os.getcwd()
```

### The *rmdir()* Method

The *rmdir()* method deletes the directory, which is passed as an argument in the method.

Before removing a directory, all the contents in it should be removed.

#### Syntax

```python
os.rmdir('dirname')
```

## Handling an exception

If you have some *suspicious* code that may raise an exception, you can defend your program by placing the suspicious code in a **try:** block. After the try: block, include an **except:** statement, followed by a block of code which handles the problem as elegantly as possible.

### Syntax:

Here is simple syntax of *try....except...else* blocks:

```python
try:
   Do you operations here;
   ......................
except ExceptionI:
   If there is ExceptionI, then execute this block.
except ExceptionII:
   If there is ExceptionII, then execute this block.
   ......................
else:
   If there is no exception then execute this block. 
```

Here are few important points about the above mentioned syntax:

- A single try statement can have multiple except statements. This is useful when the try block contains statements that may throw different types of exceptions.
- You can also provide a generic except clause, which handles any exception.
- After the except clause(s), you can include an else-clause. The code in the else-block executes if the code in the try: block does not raise an exception.
- The else-block is a good place for code that does not need the try: block's protection.

## The *except* clause with no exceptions

You can also use the except statement with no exceptions defined as follows:

```python
try:
   Do you operations here;
   ......................
except:
   If there is any exception, then execute this block.
   ......................
else:
   If there is no exception then execute this block. 
```

## The *except* clause with multiple exceptions

You can also use the same *except* statement to handle multiple exceptions as follows:

```python
try:
   Do you operations here;
   ......................
except(Exception1[, Exception2[,...ExceptionN]]]):
   If there is any exception from the given exception list, 
   then execute this block.
   ......................
else:
   If there is no exception then execute this block. 
```

## Standard Exceptions

Here is a list standard Exceptions available in Python: [Standard Exceptions](http://www.tutorialspoint.com/python/standard_exceptions.htm)

## The try-finally clause

You can use a **finally:** block along with a **try:** block. The finally block is a place to put any code that must execute, whether the try-blockraised an exception or not. The syntax of the try-finally statement is this:

```python
try:
   Do you operations here;
   ......................
   Due to any exception, this may be skipped.
finally:
   This would always be executed.
   ......................
```

## Argument of an Exception

An exception can have an *argument*, which is a value that gives additional information about the problem. The contents  of the argument vary byexception. You capture an exception's argument by supplying a variable in the except clause as follows:

```python
try:
   Do you operations here;
   ......................
except ExceptionType, Argument:
   You can print value of Argument here...
```

## Raising an exceptions

You can raise exceptions in several ways by using the raise statement. The general syntax for the **raise** statement.

### Syntax

```python
raise [Exception [, args [, traceback]]]
```

## User-Defined Exceptions

Python also allows you to create your own exceptions by deriving classes from the standard built-in exceptions.

Here is an example related to *RuntimeError*. Here a  class is created that is subclassed from *RuntimeError*. This is useful when you needto display more specific information when an exception is caught.

In the try block, the user-defined exception is raised and caught in the except block. The variable e is used to create an instance of the class Networkerror.

```python
class Networkerror(RuntimeError):
   def __init__(self, arg):
      self.args = arg
```

So once you defined above class, you can raise your exception as follows:

```python
try:
   raise Networkerror("Bad hostname")
except Networkerror,e:
   print e.args
```

## Creating Classes

The *class* statement creates a new class definition. The name of the class immediately follows the keyword *class* followed by a colon as follows:

```python
class ClassName:
   'Optional class documentation string'
   class_suite
```

- The class has a documentation string which can be access via *ClassName.__doc__*.
- The *class_suite* consists of all the component statements, defining class members, data attributes, and functions.

## Creating instance objects

To create instances of a class, you call the class using class name and pass in whatever arguments its *__init__* method accepts.

```python
"This would create first object of Employee class"
emp1 = Employee("Zara", 2000)
"This would create second object of Employee class"
emp2 = Employee("Manni", 5000)
```

## Accessing attributes

You access the object's attributes using the dot operator with object. Class variable would be accessed using class name as follows:

```python
emp1.displayEmployee()
emp2.displayEmployee()
print "Total Employee %d" % Employee.empCount
```

## Built-In Class Attributes

Every Python class keeps following built-in attributes and they can be accessed using dot operator like any other attribute:

- **__dict__ :** Dictionary containing the class's namespace.
- **__doc__ :** Class documentation string, or None if undefined. 
- **__name__:** Class name. 
- **__module__:** Module name in which the class is defined. This attribute is "__main__" in interactive mode. 
- **__bases__ :** A possibly empty tuple containing the base classes, in the order of their occurrence in the base class list.

## Destroying Objects (Garbage Collection)

Python deletes unneeded objects (built-in types or class instances) automatically to free memory space. The process by which Python periodically reclaims blocks of memory that no longer are in use is termed garbage collection.

Python's garbage collector runs during program execution and is triggered when an object's reference count reaches zero. An object's reference count changes as the number of aliases that point to it changes:

An object's reference count increases when it's assigned a new name or placed in a container (list, tuple, or dictionary). The object's reference count decreases when it's deleted with *del*, its reference is reassigned, or its reference goes out of scope. When an object's reference count reaches zero, Python collects it automatically.

## Class Inheritance

Instead of starting from scratch, you can create a class by deriving it from a preexisting class by listing the parent class in parentheses after the new class name:

The child class inherits the attributes of its parent class, and you can use those attributes as if they were defined in the child class. A child class can also override data members and methods from the parent.

### Syntax

Derived classes are declared much like their parent class; however, a list of base classes to inherit from are given after the class name:

```python
class SubClassName (ParentClass1[, ParentClass2, ...]):
   'Optional class documentation string'
   class_suite
```

## Overriding Methods

You can always override your parent class methods. One reason for overriding parent's methods is because you may want special or different functionality in your subclass.

```python
class Parent:        # define parent class
   def myMethod(self):
      print 'Calling parent method'

class Child(Parent): # define child class
   def myMethod(self):
      print 'Calling child method'

c = Child()          # instance of child
c.myMethod()         # child calls overridden method
```

## Base Overloading Methods

Following table lists some generic functionality that you can override in your own classes:

| SN   | Method, Description & Sample Call        |
| ---- | ---------------------------------------- |
| 1    | **__init__ ( self [,args...] )**Constructor (with any optional arguments)Sample Call : *obj = className(args)* |
| 2    | **__del__( self )**Destructor, deletes an objectSample Call : *dell obj* |
| 3    | **__repr__( self )**Evaluatable string representationSample Call : *repr(obj)* |
| 4    | **__str__( self )**Printable string representationSample Call : *str(obj)* |
| 5    | **__cmp__ ( self, x )**Object comparisonSample Call : *cmp(obj, x)* |

## Overloading Operators

Suppose you've created a Vector class to represent two-dimensional vectors. What happens when you use the plus operator to add them? Most likely Python will yell at you.

You could, however, define the *__add__* method in your class to perform vector addition, and then the plus operator would behave as per expectation:

```python
#!/usr/bin/python

class Vector:
   def __init__(self, a, b):
      self.a = a
      self.b = b

   def __str__(self):
      return 'Vector (%d, %d)' % (self.a, self.b)
   
   def __add__(self,other):
      return Vector(self.a + other.a, self.b + other.b)

v1 = Vector(2,10)
v2 = Vector(5,-2)
print v1 + v2
```

## Data Hiding

An object's attributes may or may not be visible outside the class definition. For these cases, you can name attributes with a double underscore prefix, and those attributes will not be directly visible to outsiders:

```python
#!/usr/bin/python

class JustCounter:
   __secretCount = 0
  
   def count(self):
      self.__secretCount += 1
      print self.__secretCount

counter = JustCounter()
counter.count()
counter.count()
print counter.__secretCount
```

A *regular expression* is a special sequence of characters that helps you match or find other strings or sets of strings, using a specialized syntax held in a pattern. Regular expressions are widely used in UNIX world.

The module **re** provides full support for Perl-like regular expressions in Python. The re module raises the exception re.error if an error occurs while compiling orusing a regular expression.

We would cover two important functions which would be used to handle regular expressions.  But a small thing first: There are various characters which would have special meaning when they are used in regular expression. To avoid any confusion while dealing with regular expressions we would use Raw Strings as **r'expression'**.

## The *match* Function

This function attempts to match RE *pattern* to *string* with optional *flags*.

Here is the syntax for this function:

```python
re.match(pattern, string, flags=0)
```

Here is the description of the parameters:

| Parameter | Description                              |
| --------- | ---------------------------------------- |
| pattern   | This is the regular expression to be matched. |
| string    | This is the string which would be searched to match the pattern |
| flags     | You can specifiy different flags using exclusive OR (\|). These are modifiers which are listed in the table below. |

The *re.match* function returns a **match** object on success, **None** on failure. We would use *group(num)* or *groups()* function of **match** object to get matched expression.

| Match Object Methods | Description                              |
| -------------------- | ---------------------------------------- |
| group(num=0)         | This methods returns entire match (or specific subgroup num) |
| groups()             | This method return all matching subgroups in a tuple (empty if there weren't any) |

## The *search* Function

This function search for first occurrence of RE *pattern* within *string* with optional *flags*.

Here is the syntax for this function:

```python
re.string(pattern, string, flags=0)
```

Here is the description of the parameters:

| Parameter | Description                              |
| --------- | ---------------------------------------- |
| pattern   | This is the regular expression to be matched. |
| string    | This is the string which would be searched to match the pattern |
| flags     | You can specifiy different flags using exclusive OR (\|). These are modifiers which are listed in the table below. |

The *re.search* function returns a **match** object on success, **None** on failure. We would use *group(num)* or *groups()* function of **match** object to get matched expression.

| Match Object Methods | Description                              |
| -------------------- | ---------------------------------------- |
| group(num=0)         | This methods returns entire match (or specific subgroup num) |
| groups()             | This method return all matching subgroups in a tuple (empty if there weren't any) |

## Matching vs Searching

Python offers two different primitive operations based on regular expressions: **match** checks for a match only at the beginning of the string, while **search** checks for a match anywhere in the string (this is what Perl does by default).

## Search and Replace

Some of the most important **re** methods that use regular expressions is **sub**.

### Syntax:

```python
sub(pattern, repl, string, max=0)
```

This method replace all occurrences of the RE *pattern* in *string* with *repl*, substituting all occurrences unless *max* provided. This method would return modified string.

## Regular-expression Modifiers - Option Flags

Regular expression literals may include an optional modifier to control various aspects of matching. The modifier are specified as an optional flag. You can provide multiple modified using exclusive OR (|), as shown previously and may be represented by one of these:

| Modifier | Description                              |
| -------- | ---------------------------------------- |
| re.I     | Performs case-insensitive matching.      |
| re.L     | Interprets words according to the current locale.This interpretation affects the alphabetic group (\w and \W), as well as word boundary behavior(\b and \B). |
| re.M     | Makes $ match the end of a line (not just the end of the string) and makes ^ match the start of any line (not just the start of the string). |
| re.S     | Makes a period (dot) match any character, including a newline. |
| re.U     | Interprets letters according to the Unicode character set. This flag affects the behavior of \w, \W, \b, \B. |
| re.X     | Permits "cuter" regular expression syntax. It ignores whitespace (except inside a set [] or when escaped by a backslash), and treats unescaped #as a comment marker. |

## Regular-expression patterns

Except for control characters, **(+ ? . \* ^ $ ( ) [ ] { } | \)**, all characters match themselves. You can escape a control character by preceding it with a backslash.

Following table lists the regular expression syntax that is available in Python.

| Pattern      | Description                              |
| ------------ | ---------------------------------------- |
| ^            | Matches beginning of line.               |
| $            | Matches end of line.                     |
| .            | Matches any single character except newline. Using m option allows it to matchnewline as well. |
| [...]        | Matches any single character in brackets. |
| [^...]       | Matches any single character not in brackets |
| re*          | Matches 0 or more occurrences of preceding expression. |
| re+          | Matches 0 or 1 occurrence of preceding expression. |
| re{ n}       | Matches exactly n number of occurrences of preceding expression. |
| re{ n,}      | Matches n or more occurrences of preceding expression. |
| re{ n, m}    | Matches at least n and at most m occurrences of preceding expression. |
| a\| b        | Matches either a or b.                   |
| (re)         | Groups regular expressions and remembers matched text. |
| (?imx)       | Temporarily toggles on i, m, or x options within a regular expression. If in parentheses,only that area is affected. |
| (?-imx)      | Temporarily toggles off i, m, or x options within a regular expression. If inparentheses, only that area is affected. |
| (?: re)      | Groups regular expressions without remembering matched text. |
| (?imx: re)   | Temporarily toggles on i, m, or x options within parentheses. |
| (?-imx: re)  | Temporarily toggles off i, m, or x options within parentheses. |
| (?#...)      | Comment.                                 |
| (?= re)      | Specifies position using a pattern. Doesn't have a range. |
| (?! re)      | Specifies position using pattern negation. Doesn't have a range. |
| (?> re)      | Matches independent pattern without backtracking. |
| \w           | Matches word characters.                 |
| \W           | Matches nonword characters.              |
| \s           | Matches whitespace. Equivalent to [\t\n\r\f]. |
| \S           | Matches nonwhitespace.                   |
| \d           | Matches digits. Equivalent to [0-9].     |
| \D           | Matches nondigits.                       |
| \A           | Matches beginning of string.             |
| \Z           | Matches end of string. If a newline exists, it matches just before newline. |
| \z           | Matches end of string.                   |
| \G           | Matches point where last match finished. |
| \b           | Matches word boundaries when outside brackets. Matches backspace (0x08) when inside brackets. |
| \B           | Matches nonword boundaries.              |
| \n, \t, etc. | Matches newlines, carriage returns, tabs, etc. |
| \1...\9      | Matches nth grouped subexpression.       |
| \10          | Matches nth grouped subexpression if it matched already. Otherwise refers to the octalrepresentation of a character code. |

## Regular-expression Examples

### Literal characters

| Example | Description     |
| ------- | --------------- |
| python  | Match "python". |

### Character classes

| Example     | Description                              |
| ----------- | ---------------------------------------- |
| [Pp]ython   | Match "Python" or "python"               |
| rub[ye]     | Match "ruby" or "rube"                   |
| [aeiou]     | Match any one lowercase vowel            |
| [0-9]       | Match any digit; same as [0123456789]    |
| [a-z]       | Match any lowercase ASCII letter         |
| [A-Z]       | Match any uppercase ASCII letter         |
| [a-zA-Z0-9] | Match any of the above                   |
| [^aeiou]    | Match anything other than a lowercase vowel |
| [^0-9]      | Match anything other than a digit        |

### Special Character Classes

| Example | Description                              |
| ------- | ---------------------------------------- |
| .       | Match any character except newline       |
| \d      | Match a digit: [0-9]                     |
| \D      | Match a nondigit: [^0-9]                 |
| \s      | Match a whitespace character: [ \t\r\n\f] |
| \S      | Match nonwhitespace: [^ \t\r\n\f]        |
| \w      | Match a single word character: [A-Za-z0-9_] |
| \W      | Match a nonword character: [^A-Za-z0-9_] |

### Repetition Cases

| Example | Description                              |
| ------- | ---------------------------------------- |
| ruby?   | Match "rub" or "ruby": the y is optional |
| ruby*   | Match "rub" plus 0 or more ys            |
| ruby+   | Match "rub" plus 1 or more ys            |
| \d{3}   | Match exactly 3 digits                   |
| \d{3,}  | Match 3 or more digits                   |
| \d{3,5} | Match 3, 4, or 5 digits                  |

### Nongreedy repetition

This matches the smallest number of repetitions:

| Example | Description                              |
| ------- | ---------------------------------------- |
| <.*>    | Greedy repetition: matches "<python>perl>" |
| <.*?>   | Nongreedy: matches "<python>" in "<python>perl>" |

### Grouping with parentheses

| Example           | Description                              |
| ----------------- | ---------------------------------------- |
| \D\d+             | No group: + repeats \d                   |
| (\D\d)+           | Grouped: + repeats \D\d pair             |
| ([Pp]ython(, )?)+ | Match "Python", "Python, python, python", etc. |

### Backreferences

This matches a previously matched group again:

| Example            | Description                              |
| ------------------ | ---------------------------------------- |
| ([Pp])ython&\1ails | Match python&pails or Python&Pails       |
| (['"])[^\1]*\1     | Single or double-quoted string. \1 matches whatever the 1st group matched. \2 matches whatever the 2nd group matched, etc. |

### Alternatives

| Example        | Description                              |
| -------------- | ---------------------------------------- |
| python\|perl   | Match "python" or "perl"                 |
| rub(y\|le))    | Match "ruby" or "ruble"                  |
| Python(!+\|\?) | "Python" followed by one or more ! or one ? |

### Anchors

This need to specify match position

| Example     | Description                              |
| ----------- | ---------------------------------------- |
| ^Python     | Match "Python" at the start of a string or internal line |
| Python$     | Match "Python" at the end of a string or line |
| \APython    | Match "Python" at the start of a string  |
| Python\Z    | Match "Python" at the end of a string    |
| \bPython\b  | Match "Python" at a word boundary        |
| \brub\B     | \B is nonword boundary: match "rub" in "rube" and "ruby" but not alone |
| Python(?=!) | Match "Python", if followed by an exclamation point |
| Python(?!!) | Match "Python", if not followed by an exclamation point |

### Special syntax with parentheses

| Example       | Description                              |
| ------------- | ---------------------------------------- |
| R(?#comment)  | Matches "R". All the rest is a comment   |
| R(?i)uby      | Case-insensitive while matching "uby"    |
| R(?i:uby)     | Same as above                            |
| rub(?:y\|le)) | Group only without creating \1 backreference |

## Reference

[Python Quick Guide](http://www.tutorialspoint.com/python/python_quick_guide.htm)
