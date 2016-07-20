---
title:  "Python Part 01: Syntax"
date: 2016-06-13 20:00
modified: 2016-07-19
published: true
categories: 
  - Python
tags:
  - Python Syntax
  - Python 2.x
excerpt: |
    Python is an easy to learn programming language. You can use it to create web apps, games, even a search engine!
series: "Intro to Python"	
---

 {% include series.html %}

* TOC
{:toc}

Python is an easy to learn programming language. You can use it to create web apps, games, even a search engine!

Python[^1] is a high-level, interpreted, interactive and object-oriented **scripting language**[^2]. Python is designed to be highly readable. It uses English keywords frequently where as other languages use punctuation, and it has fewer syntactical constructions than other languages.

- **Python is Interpreted:** Python is processed at runtime by the interpreter. You do not need to compile your program before executing it. This is similar to PERL and PHP.
- **Python is Interactive:** You can actually sit at a Python prompt and interact with the interpreter directly to write your programs.
- **Python is Object-Oriented:** Python supports Object-Oriented style or technique of programming that encapsulates code within objects.
- **Python is a Beginner's Language:** Python is a great language for the beginner-level programmers and supports the development of a wide range of applications from simple text processing to WWW browsers to games.

## Basic Syntax

The Python language has many similarities to Perl, C, and Java. However, there are some definite differences between the languages.

### Interactive Mode Programming

Invoking the interpreter without passing a script file as a parameter brings up the following prompt −

```sql
$ python
Python 2.4.3 (#1, Nov 11 2010, 13:34:43)
[GCC 4.1.2 20080704 (Red Hat 4.1.2-48)] on linux2
Type "help", "copyright", "credits" or "license" for more information.
>>>
```

Type the following text at the Python prompt and press the Enter:

```sql
>>> print "Hello, Python!"
```

If you are running new version of Python, then you would need to use print statement with parenthesis as in **print ("Hello, Python!");**. However in Python version 2.4.3, this produces the following result:

```
Hello, Python!
```

### Reserved Words

The following list shows the Python keywords. These are reserved words and you cannot use them as constant or variable or any other identifier names. All the Python keywords contain lowercase letters only.

| And      | exec    | Not    |
| -------- | ------- | ------ |
| Assert   | finally | or     |
| Break    | for     | pass   |
| Class    | from    | print  |
| Continue | global  | raise  |
| def      | if      | return |
| del      | import  | try    |
| elif     | in      | while  |
| else     | is      | with   |
| except   | lambda  | yield  |

### User Input--`raw_input()`

The command to accept user input is `raw_input()`. This will make a pop-up box appear on your screen.

> raw_input()读取的内容以字符串的形式返回
{:.warning}

Example:
```python
 name = raw_input("What is your name, human? ")
 print "Hello", name + "! I am Python :D"
```

> Note:In Python 3.x,` input()` replaces `raw_input()`, for input from the console.Also remember to use the `print()` function with Python 3.4, including parentheses, for output to the console, instead of the old print command that did not require parentheses.
{:.notice--info} 

So the example above will be in Python 3x as follows:

```python
name = input("What is your name, human? ")
print ("Hello", name + "! I am Python :D")
```

### Waiting for the User

The following line of the program displays the prompt, the statement saying “Press the enter key to exit”, and waits for the user to take action −

```sql
#!/usr/bin/python

raw_input("\n\nPress the enter key to exit.")
```

Here, **"\n\n"** is used to create two **new lines** before displaying the actual line. Once the user presses the key, the program ends. This is a nice trick to keep a console window open until the user is done with an application.

### Multi-Line Statements

Statements in Python typically end with a new line. Python does, however, allow the use of the line continuation character (\) to denote that the line should continue. For example −

```python
total = item_one + \
        item_two + \
        item_three
```

Statements contained within the [], {}, or () brackets do not need to use the line continuation character. For example −

```python
days = ['Monday', 'Tuesday', 'Wednesday',
        'Thursday', 'Friday']
```

### Quotation in Python

Python accepts single ('), double (") and triple (''' or """) quotes to denote string literals, as long as the same type of quote starts and ends the string.

The triple quotes are used to span the string across multiple lines. For example, all the following are legal −

```python
word = 'word'
sentence = "This is a sentence."
paragraph = """This is a paragraph. It is
made up of multiple lines and sentences."""
```

### Multiple Statements on a Single Line

The semicolon ( ; ) allows multiple statements on the single line given that neither statement starts a new code block. Here is a sample snip using the semicolon −

```python
import sys; x = 'foo'; sys.stdout.write(x + '\n')
```

### Single Line Comments

The `#` sign is for comments. A comment is a line of text that Python won't try to run as code. It's just for humans to read.

### Multi-Line Comments

or multi-line comments, you can include the whole block in a set of triple quotation marks:

```python
"""Sipping from your cup 'til it runneth over,
Holy Grail.
"""
```

## Variable

Creating web apps, games, and search engines all involve storing and working with different types of data. They do so using **variables**. A **variable** stores a piece of data, and gives it a specific name.

Variables are nothing but reserved memory locations to store values. This means that when you create a variable you **reserve some space in memory**.

### Variable Naming

Python is a case sensitive programming language. Be aware of this when you first name and subsequently use your variables.  

For instance, leapyear, Leapyear, leapYear, and LeapYear will actually be viewed as 4 **different** variables by Python even if you intended the same thing, a "leap year," but simply mistyped.

### Variable Assignment

Variable are lines of code that do something. The most common type of statement you'll probably come across are assignment statements.

Although we can understand simple programs using this description, and many programming languages, including C, C++, and Java, do exactly this, Python doesn't.   

Instead, a variable points to a storage location containing its current value, and so does every variable with that same value. **If its value is changed by assignment then, instead of changing its storage location to that value, a new location is set to the value** if it's not already in memory, then the variable is changed to point to that new location--but other variables pointing to the old location still point there.   

Moreover, Python assumes small integers (-5 to +256) are very likely to be used, so they're automatically stored when the system is initialized, ready to be used (a process called memoization). So, to be quite accurate:

```python
# The equal sign (=) is used to assign values to variables.

x = 5  # sets variable x to point to the location storing 5 (memoized during system initialization)

y = x  # sets y to point to the location x presently does (so the location storing 5)

x = x + 1 # sets variable x to point to the location storing 6 (memoized during system initialization)--but y still points to 5

y = 3.14  # stores 3.14 in a new memory location unless it has already been used and so is already available (has been memoized), and sets y to point to it 

w = y  # sets w to point to the same value y presently points to (3.14)

z = 3.14  # sets z to point to 3.14, the same value as y and w presently point to
```

So instead of thinking of a variable being a named location whose value gets changed, it's more accurate to think of a variable as a name on a sticky note that gets moved and stuck to a location storing its new value (after storing that value if it hasn't been used previously).   

Note: We have just one location storing value 3.14, but three variables (w, y, and z) presently share that value. If any one of them changes, the value in that location doesn't change; instead, that variable now points to a different location containing that new value and the other two still "point to" 3.14.

### Multiple Assignment

Python allows you to assign a single value to several variables simultaneously. For example −

```sql
a = b = c = 1
```

Here, an integer object is created with the value 1, and all three variables are assigned to the same memory location. You can also assign multiple objects to multiple variables. For example −

```sql
a, b, c = 1, 2, "john"
```

Here, two integer objects with values 1 and 2 are assigned to variables a and b respectively, and one string object with the value "john" is assigned to the variable c.

## Standard Data Types

The data stored in memory can be of many types. For example, a person's age is stored as a numeric value and his or her address is stored as alphanumeric characters. Python has various standard data types that are used to define the operations possible on them and the storage method for each of them.

Python has five standard data types −

- Numbers
- String
- List
- Tuple
- Dictionary

> Note: If you are unsure of what data type a particular variable, constant, or literal is, you can ask Python by using the` type()` function.

### Python Numbers

Number data types store numeric values. Number objects are created when you assign a value to them. For example −

```sql
var1 = 1
var2 = 10
```

You can also delete the reference to a number object by using the del statement. The syntax of the del statement is −

```sql
del var1[,var2[,var3[....,varN]]]]
```

You can delete a single object or multiple objects by using the del statement. For example −

```sql
del var
del var_a, var_b
```

Python supports four different numerical types −

- int (signed integers)
- long (long integers, they can also be represented in octal and hexadecimal)
- float (floating point real values)
- complex (complex numbers)

#### Examples

Here are some examples of numbers −

| int    | long                  | float      | complex    |
| ------ | --------------------- | ---------- | ---------- |
| 10     | 51924361L             | 0.0        | 3.14j      |
| 100    | -0x19323L             | 15.20      | 45.j       |
| -786   | 0122L                 | -21.9      | 9.322e-36j |
| 080    | 0xDEFABCECBDAECBFBAEl | 32.3+e18   | .876j      |
| -0490  | 535633629843L         | -90.       | -.6545+0J  |
| -0x260 | -052318172735L        | -32.54e100 | 3e+26J     |
| 0x69   | -4721885298529L       | 70.2-E12   | 4.53e-7j   |

- Python allows you to use a lowercase l with long, but it is recommended that you use only an uppercase L to avoid confusion with the number 1. Python displays long integers with an uppercase L.
- A complex number consists of an ordered pair of real floating-point numbers denoted by x + yj, where x and y are the real numbers and j is the imaginary unit.

### Python Strings

Strings in Python are identified as a contiguous set of characters represented in the quotation marks. Python allows for either pairs of single or double quotes. Subsets of strings can be taken using the slice operator ([ ] and [:] ) with indexes starting at 0 in the beginning of the string and working their way from -1 at the end.

The plus (+) sign is the string concatenation operator and the asterisk (*) is the repetition operator. For example −

```sql
str = 'Hello World!'

print str          # Prints complete string
print str[0]       # Prints first character of the string
print str[2:5]     # Prints characters starting from 3rd to 5th
print str[2:]      # Prints string starting from 3rd character
print str * 2      # Prints string two times
print str + "TEST" # Prints concatenated string
```

This will produce the following result −

```
Hello World!
H
llo
llo World!
Hello World!Hello World!
Hello World!TEST
```

**Note**: When using concatenation with the `+` operator, **sentence spacing** isn't automatically allotted for. Whereas print "Hello", "Coursera!" would have output "Hello Coursera!". Also the multiplication * operator can be used for multiple string concatenation:

```python
 print "Free Education!", "Hip-hip-hooray! " * 3 + "Thank you Coursera!"

 #Outputs: Free Education! Hip-hip-hooray! Hip-hip-hooray! Hip-hip-hooray! Thank you Coursera!
```

### Python Lists

Lists are the most versatile of Python's compound data types. A list contains items separated by commas and enclosed within square brackets ([]). To some extent, lists are similar to arrays in C. One difference between them is that all the items belonging to a list can be of different data type.

The values stored in a list can be accessed using the slice operator ([ ] and [:]) with indexes starting at 0 in the beginning of the list and working their way to end -1. The plus (+) sign is the list concatenation operator, and the asterisk (*) is the repetition operator. For example −

```sql
list = [ 'abcd', 786 , 2.23, 'john', 70.2 ]
tinylist = [123, 'john']

print list          # Prints complete list
print list[0]       # Prints first element of the list
print list[1:3]     # Prints elements starting from 2nd till 3rd 
print list[2:]      # Prints elements starting from 3rd element
print tinylist * 2  # Prints list two times
print list + tinylist # Prints concatenated lists
```

This produce the following result −

```
['abcd', 786, 2.23, 'john', 70.200000000000003]
abcd
[786, 2.23]
[2.23, 'john', 70.200000000000003]
[123, 'john', 123, 'john']
['abcd', 786, 2.23, 'john', 70.200000000000003, 123, 'john']

```

### Python Tuples

A tuple is another sequence data type that is similar to the list. A tuple consists of a number of values separated by commas. Unlike lists, however, tuples are enclosed within parentheses.

The main differences between lists and tuples are: Lists are enclosed in brackets ( [ ] ) and their elements and size can be changed, while tuples are enclosed in parentheses ( ( ) ) and cannot be updated. Tuples can be thought of as **read-only** lists. For example −

```sql
tuple = ( 'abcd', 786 , 2.23, 'john', 70.2  )
tinytuple = (123, 'john')

print tuple           # Prints complete list
print tuple[0]        # Prints first element of the list
print tuple[1:3]      # Prints elements starting from 2nd till 3rd 
print tuple[2:]       # Prints elements starting from 3rd element
print tinytuple * 2   # Prints list two times
print tuple + tinytuple # Prints concatenated lists
```

This produce the following result −

```
('abcd', 786, 2.23, 'john', 70.200000000000003)
abcd
(786, 2.23)
(2.23, 'john', 70.200000000000003)
(123, 'john', 123, 'john')
('abcd', 786, 2.23, 'john', 70.200000000000003, 123, 'john')
```

The following code is invalid with tuple, because we attempted to update a tuple, which is not allowed. Similar case is possible with lists −

```sql
tuple = ( 'abcd', 786 , 2.23, 'john', 70.2  )
list = [ 'abcd', 786 , 2.23, 'john', 70.2  ]
tuple[2] = 1000    # Invalid syntax with tuple
list[2] = 1000     # Valid syntax with list
```

### Python Dictionary

Python's dictionaries are kind of hash table type. They work like associative arrays or hashes found in Perl and consist of key-value pairs. A dictionary key can be almost any Python type, but are usually numbers or strings. Values, on the other hand, can be any arbitrary Python object.

Dictionaries are enclosed by curly braces ({ }) and values can be assigned and accessed using square braces ([]). For example −

```sql
dict = {}
dict['one'] = "This is one"
dict[2]     = "This is two"

tinydict = {'name': 'john','code':6734, 'dept': 'sales'}


print dict['one']       # Prints value for 'one' key
print dict[2]           # Prints value for 2 key
print tinydict          # Prints complete dictionary
print tinydict.keys()   # Prints all the keys
print tinydict.values() # Prints all the values
```

This produce the following result −

```
This is one
This is two
{'dept': 'sales', 'code': 6734, 'name': 'john'}
['dept', 'code', 'name']
['sales', 6734, 'john']

```

Dictionaries have no concept of order among elements. It is incorrect to say that the elements are "out of order"; they are simply unordered.

## Math

More complex mathematical expressions can be evaluated for variable assignment than just numeric literals. This can be achieved by way of the following operators:

- Addition ( + )
  - `x = 5 + 10`
- Subtraction ( - )
  - `x = 5 - 10`
- Multiplication ( * )
  - `x = 5 * 10`
- Power ( ** )
  - Exponentiation ( 510 )`x = 5**10`
  - The ** operator can also be utilized for root calculations since roots are just fraction exponents ( 10 = 101/2 )`x = 10**.5`
- Division ( / )
  - `x = 5  / 10`
- Modulus ( % )
  - Used to return the remainder of a division instead of the quotient answer ( 10 % 3 = 1, since 3 * 3 = 9 and 10 - 9 leaves a remainder 1 )
  - `x = 10 % 3`

*Note:* There is a marked difference between *integer* division and *float* division. Because Python treats these two numeric types distinctly different, you might get erroneous answers when doing division operations without precaution.


## Type Conversion--`int()`

Type-casting is a universal programming notion of converting the value of a variable from one type into another. In Python, this is achieved by utilizing functions such as` int()`, `float()`, or `str()`. 

```python
 x = raw_input("Enter a number: ")
 y = raw_input("Enter another number: ")
 z = x + y
 print "The sum of", x, "and", y, "is",  z
 
 #Output:
 # Enter a number: 23
 # Enter another number: 45
 # The sum of 23 and 45 is 2345
 
 z = int(x) + int(y)
 print "The correct sum actually was", z

 #Output: The correct sum actually was 68
```

##  Boolean

A **boolean** is like a light switch. It can only have two values. Just like a light switch can only be on or off, a boolean can only be `True` or `False`.

The `x > 0` segment is called a **boolean expression**. Boolean expressions test its given parameters, in this case the variable **x** to the left against the numeric literal 0 to the right, and returns a value of either `true` or `false`.

###  Comparison Operators

There are many different ways to construct a conditional statement in Python using comparison operators. The comparison operators provided by Python are:

- Less than ( < )
  - `x < y`
- Less than or equal ( <= )
  - `x <= y`
- Greater than ( > )
  - `x > y`
- Greater than or equal ( >= )
  - `x >= y`
- Equality ( == )
  - `x == y`
- Inequality ( != )
  - `x != y`

> Notice: `=` is the assignment operator, `==` equality operator is a comparison operator

###  Logical Operators

Python also provides a set of logical operators to combine multiple boolean expressions together for more complex boolean logic testing.

- Logical AND ( and )
  - `and` checks whether both boolean expressions evaluate as true
  - `if x > 0 and y > 0 : print 'this line runs if both numbers are positive'`
- Logical OR ( or )
  - `or` checks whether either expression is evaluated as true
  - `if x > 0 or y > 0 : print 'this line runs if either x or y is evaluated as positive'`
- Logical NOT ( not )
  - `not` negates a boolean expression, i.e. if the `bool` value returned is `false` then `not` evaluates to `true`
  - `if not( x > y ) : print 'this line runs when x is less than or equal to y'`

## Debugging

Here are a few pointers on debugging.

1. Avoid spaces in between variable names. Python thinks there are two operands. Example:  

   ```python
   >>>Madam Medousa = "lets start the bout"
   SyntaxError: invalid syntax

   #correct syntax
   >>>madam_medousa = "lets start the bout"
   >>>print madam_medousa
   "lets start the bout"
   ```
  
   > Common Syntax Errors. 1) SyntaxError: invalid syntax 2) SyntaxError: invalid token

2. Runtime Error: using a variable before it is defined. Example:  
 
   ```python
    >>>cat= "Garfield"
    >>>food = "burgers"
    >>>Garfield + food
   NameError: name"Garfield" is not defined

   # "Garfield" is a string in the variable cat.
   # Hence, Garfield is not a defined as a mnemonic variable.
   ```
   
3. Case sEn5iTiVity (sensitivity!) matters:  
  
   ```python
   >>>Olive = 5
   >>>olive = "olive oil"
   >>>oLiVe = 7

    # variable names are case sensitive,
   # all of these variations of olive are separate variables.
   ```

## Referense
[Pythonlearn:resources-week01](https://share.coursera.org/wiki/index.php/Pythonlearn:resources-week01)

[Scripting language](https://en.wikipedia.org/wiki/Scripting_language)

[Python Basic Syntax](http://www.tutorialspoint.com/python/python_basic_syntax.htm)

[^1]: [Python Overview](http://www.tutorialspoint.com/python/python_overview.htm)

[^2]: A scripting or script language is a programming language that supports scripts, programs written for a special run-time environment that automate the execution of tasks that could alternatively be executed one-by-one by a human operator. 
