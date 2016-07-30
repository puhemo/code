---
title:  "Python Part 04: Conditionals & Control Flow"
date: 2016-06-15 21:00
modified: 2016-07-30 
published: true
categories: 
  - Python
tags:
  - Python Syntax
  - Python 2.x
excerpt: |
    **Control flow** gives us this ability to choose among outcomes based off what else is happening in the program.

series: "Intro to Python"	
---

 {% include series.html %}

* TOC
{:toc}

**Control flow** gives us this ability to choose among outcomes based off what else is happening in the program.

# Conditional Execution

Decision making is anticipation of conditions occurring while execution of the program and specifying actions taken according to the conditions.

Decision structures evaluate multiple expressions which produce TRUE or FALSE as outcome. You need to determine which action to take and which statements to execute `if` outcome is TRUE or FALSE otherwise.

> We end the if statement with a **colon (:)** and lines after the if statement are **indented**.

Following is the general form of a typical decision making structure found in most of the programming languages −

![Decision making statements in Python](http://www.tutorialspoint.com/python/images/decision_making.jpg)

Python programming language assumes any **non-zero** and **non-null** values as TRUE, and if it is either **zero** or **null**, then it is assumed as `FALSE` value.

Python programming language provides following types of decision making statements. 

| Statement                                | Description                              |
| ---------------------------------------- | ---------------------------------------- |
| if statements | An **if statement** consists of a boolean expression followed by one or more statements. |
| if...else statements | An **if statement** can be followed by an optional **else statement**, which executes when the boolean expression is FALSE. |
| nested if statements | You can use one **if** or **else if** statement inside another **if** or **else if** statement(s). |

## Conditional Statements

Conditional statements let Python know it is about to enter a decision-making structure.

### Single Statement

If the suite of an **if** clause consists only of a single line, it may go on the same line as the header statement.

Here is an example of a **one-line if** clause −

```python
var = 100

if ( var  == 100 ) : print "Value of expression is 100"

print "Good bye!"
```

### if...else statements

`if` is a conditional statement that executes some specified code after checking if its expression is `True`.  

The `else` statement complements the `if` statement. An `if/else` pair says: "If this expression is true, run this indented code block; otherwise, run this code after the `else` statement."

#### Syntax

The syntax of the *if...else* statement is −

```python
if expression:
   statement(s)
else:
   statement(s)
```

#### Flow Diagram

![Python if...else statement](http://www.tutorialspoint.com/python/images/if_else_statement.jpg)

#### Example

```python
if 8 > 9:
    print "I don't printed!"
else:
    print "I get printed!"
```

### Conditional Steps (Multi elif) - if ... elif .. else

"Elif" is short for "else if." It means exactly what it sounds like: "otherwise, if the following expression is true, do this!"

The **elif** statement allows you to check multiple expressions for `TRUE` and execute a block of code as soon as one of the conditions evaluates to `TRUE`.

Similar to the **else**, the **elif** statement is optional. However, unlike **else**, for which there can be at most one statement, there can be an arbitrary number of **elif** statements following an **if**.

#### syntax

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

#### Example

```python
  if x < 0:
      x = 0
      print 'negative changed to zero'
  elif x == 0:
      print 'zero'
  elif x == 1:
      print 'single'
  elif x == 2:
      print 'double'
  else:
      print 'more'
```

###  Nested Conditionals

You can also have one or more conditional statements indented as a subset of a parent conditional, forming a hierarchy of nested conditional logic.

#### Syntax

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

#### Example

```python
 if x == y :
     print 'x and y are equal'
 else :
     if x < y :
         print 'x is less than y'
     elif x > y :
         print 'x is greater than y'
```

##  Try/Except

Try/Except[^1] - Beginning with `try,` Python tests the first operation. If the operation fails, then it proceeds to follow the instructions in `except.` If the `try` is successful then `except` is skipped.

```python
test = raw_input("Enter an integer:")  
try:  
   test = int(test)  
except:  
   print "Invalid entry."
   quit()  
result = test * 2  
print result  
```

# Loops

A loop statement allows us to execute a statement or group of statements multiple times. The following diagram illustrates a loop statement −

![Loop Architecture](http://www.tutorialspoint.com/python/images/loop_architecture.jpg)

Python programming language provides following types of loops to handle looping requirements.

| Loop Type    | Description                              |
| ------------ | ---------------------------------------- |
| while loop   | Repeats a statement or group of statements while a given condition is TRUE. It tests the condition before executing the loop body. |
| for loop     | Executes a sequence of statements multiple times and abbreviates the code that manages the loop variable. |
| nested loops | You can use one or more loop inside any another while, for or do..while loop. |

## Loop Control Statements

Loop control statements change execution from its normal sequence. When execution leaves a scope, all automatic objects that were created in that scope are destroyed.

Python supports the following control statements. Click the following links to check their detail.

| Control Statement                        | Description                              |
| ---------------------------------------- | ---------------------------------------- |
| break statement | Terminates the loop statement and transfers execution to the statement immediately following the loop. |
| continue statement | Causes the loop to skip the remainder of its body and immediately retest its condition prior to reiterating. |
| pass statement | The pass statement in Python is used when a statement is required syntactically but you do not want any command or code to execute. |

## Indefinite Loops - `while`

The `while` loop is similar to an `if` statement: it executes the code inside of it if some condition is true. The difference is that the `while` loop will continue to execute as long as the condition is true.

We need `while` loops when you don't know the number of iterations before hand and want to execute a bunch of code until some **condition** is satisfied.

### Syntax

The syntax of a **while** loop in Python programming language is −

```python
while expression:
   statement(s)
```

Here, **statement(s)** may be a single statement or a block of statements. The **condition** may be any expression, and true is any non-zero value. The loop iterates while the condition is true.

### Flow Diagram

![while loop in Python](http://www.tutorialspoint.com/python/images/python_while_loop.jpg)

### Example

```python
while i < 6:
    print "At the top i is %d" % i
```

```python
# Assign a value to i which is greater than 2
while i > 2:
    print "Right now i is %d" % i
    i=i-1
```

* Tips: Check for empty line
  
  ```python
  if len(inp) < 1: break
  ```

A loop becomes **infinite loop** if a condition never becomes `FALSE`. You must use caution when using while loops because of the possibility that this condition never resolves to a `FALSE` value. This results in a loop that never ends. Such a loop is called an infinite loop.

An infinite loop might be useful in **client/server programming** where the server needs to run continuously so that client programs can communicate with it as and when required.

```python
var = 1
while var == 1 :  # This constructs an infinite loop
   num = raw_input("Enter a number  :")
   print "You entered: ", num

print "Good bye!"
```

## “Infinite loops” and `break`

The `break` is a one-line statement that means "exit the current loop." 

Sometimes you don’t know it’s time to end a loop until you get half way through the body. In that case you can write an infinite loop on purpose and then use the `break` statement to **jump out of the loop**.

### Flow Diagram

![Python break statement](http://www.tutorialspoint.com/python/images/cpp_break_statement.jpg)

### Example

```python
while True:
    line = raw_input('> ')
    if line == 'done':
        break
    print line
print 'Done!'
```

## While / else

Something completely different about Python is the `while/else` construction. `while/else` is similar to `if/else`, but there is a difference: the `else` block will execute anytime the loop condition is evaluated to `False`. This means that it will execute if the loop is never entered or if the loop exits normally. If the loop exits as the result of a break, the else will not be executed.

- If the **else** statement is used with a **for** loop, the **else** statement is executed when the loop has exhausted iterating the list.
- If the **else** statement is used with a **while** loop, the **else** statement is executed when the condition becomes false.

```python
import random

print "Lucky Numbers! 3 numbers will be generated."
print "If one of them is a '5', you lose!"

count = 0
while count < 3:
    num = random.randint(1, 6)
    print num
    if num == 5:
        print "Sorry, you lose!"
        break
    count += 1
else:
    print "You win!"
```

## Finishing iterations with `continue`

Sometimes you are in an iteration of a loop and want to finish the current iteration and immediately **jump to the next iteration**.In that case you can use the `continue` statement to skip to the next iteration without finishing the body of the loop for the current iteration.

The `continue` statement rejects all the remaining statements in the current iteration of the loop and moves the control **back to the top of the loop**.

### Flow Diagram

![Python continue statement](http://www.tutorialspoint.com/python/images/cpp_continue_statement.jpg)

### Example

`Continue` is needed for a piece of code like this:

```python
loop= 0
count= 0
running_total= 0
while loop ==0:
    inp= raw_input ("Enter a number:")
    
    if inp== "done" or inp== "Done" :
        break   
    try:
        num= float(inp)
    except:
        print "Invalid input. Please insert a number or type done to finish"
        continue    

    count= count + 1
    running_total= running_total + num
 
print count," numbers input" 
print running_total," total"
print "and average:", running_total/count
```

To clarify, `continue` is needed here because **without it any bad input will not stop the iteration**. this will mess up the count and the running total.

## Definite loops - `for`

It has the ability to iterate over the items of any sequence, such as a list or a string.

### Syntax

```python
for iterating_var in sequence:
   statements(s)
```

### Flow Diagram

![for loop in Python](http://www.tutorialspoint.com/python/images/python_for_loop.jpg)

### Example
This kind of loop is useful when you want to do something a certain number of times, such as append something to the end of a list.

```python
hobbies = []

for m in range(3) :
    hobbies.append(raw_input('Enter your hobbies:' ))
```

### String manipulation

String manipulation is useful in `for` loops if you want to modify some content in a string. 

```python
phrase = "A bird in the hand..."

for char in phrase:
    if char == 'A' or char == 'a':
        print 'X',
    else:
        print char,
```
> The `,` character after our print statement means that our next print statement keeps printing on the same line.

### Go through a list

Perhaps the most useful (and most common) use of `for` loops is to go through a list.

```python
numbers  = [7, 9, 12, 54, 99]

print "This list contains: "

for num in numbers:
    print num
```

### Looping over a dictionary

You may be wondering how looping over a dictionary would work. Would you get the key or the value?

The short answer is: you get the key which you can use to get the value.

```python
d = {'x': 9, 'y': 10, 'z': 20}
for key in d:
    if d[key] == 10:
        print "This dictionary has the value 10!"
```

### Counting as you go

A weakness of using this for-each style of iteration is that you don't know the index of the thing you're looking at. Thankfully the built-in `enumerate` function helps with this.

`enumerate` works by supplying a corresponding index to each element in the list that you pass it. 

```python
choices = ['pizza', 'pasta', 'salad', 'nachos']

print 'Your choices are:'
for index, item in enumerate(choices):
    print index+1, item
```

### Multiple lists

It's also common to need to iterate over two lists at once. This is where the built-in `zip` function comes in handy.

`zip` will create pairs of elements when passed two lists, and will **stop at the end of the shorter list**.

`zip` can handle three or more lists as well!

```python
list_a = [3, 9, 17, 15, 19]
list_b = [2, 4, 8, 10, 30, 40, 50, 60, 70, 80, 90]

for a, b in zip(list_a, list_b):
    # Add your code here!
    if a > b:
        print a
    else:
        print b
```

## For / else

Just like with `while`, `for` loops may have an else associated with them.

In this case, the else statement is executed after the `for`, but only if the for ends normally—that is, not with a `break`. 

- If the **else** statement is used with a **for** loop, the **else** statement is executed when the loop has exhausted iterating the list.
- If the **else** statement is used with a **while** loop, the **else** statement is executed when the condition becomes false.

```python
fruits = ['banana', 'apple', 'orange', 'tomato', 'pear', 'grape']

print 'You have...'
for f in fruits:
    if f == 'tomato':
        print 'A tomato is not a fruit!' # (It actually is.)
        break
    print 'A', f
else:
    print 'A fine selection of fruits!'
```

# More Info
* [Pythonlearn:resources-week01](https://share.coursera.org/wiki/index.php/Pythonlearn:resources-week01)
* [Pythonlearn:resources-week03](https://share.coursera.org/wiki/index.php/Pythonlearn:resources-week03)
* [Python 基础教程](http://www.runoob.com/python/python-if-statement.html)
* [Pythonlearn:resources-week05](https://share.coursera.org/wiki/index.php/Pythonlearn:resources-week05)
* [Python Loops](http://www.tutorialspoint.com/python/python_loops.htm)

[^1]: [错误处理](http://www.liaoxuefeng.com/wiki/001374738125095c955c1e6d8bb493182103fac9270762a000/001386832284796780f5db7b5744bf9989f8d845ef77712000)

 {% include series.html %}
