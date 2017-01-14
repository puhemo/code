---
title: "Learn JavaScript"
date: 2017-01-14
modified: 2017-01-14
published: true
categories:
  - JavaScript
tags:
  - HTML
  - CSS
  - JavaScript
  - jQuery
excerpt: |
    JavaScript is the most widely used programming language on the web and is used on most websites, including this one.
---

* TOC
{:toc}


## Introduction to JavaScript

JavaScript is the most widely used programming language on the web and is used on most websites, including this one.

### 1. Types

The *building blocks* of JavaScript make up every program and line of JavaScript.

Just like a language has nouns, verbs, and prepositions, JavaScript has its own building blocks. Instead of calling them building blocks, however, developers call them *data types*.

There are three essential data types to know for now, and here is your first test of memorization:

1. *String*: Any grouping of words or numbers surrounded by single quotes: `' ... '` or double quotes `" ... "`.
2. *Number*: Any number, including numbers with decimals, without quotes: `4`, `8`,`1516`, `23.42`.
3. *Boolean*: This is always one of two words. Either `true` or `false`, with no quotations.

Let's review: a string is any grouping of words, a number's a number, and a boolean is a ghostly halloween costume. Or no, that's false! It's either `true` or `false`.

### 2. console

We can't do much programming with our knowledge of types right now, so let's build something cool. Let's learn how to ask JavaScript to talk to us.

To do this, we need two things:

1. A way to ask JavaScript to talk.
2. Something for JavaScript to say.

We can ask JavaScript to print words to the console with this line of code:

```javascript
console.log('Your message here.');
```

In human-speak, this is saying: "Hey console, please print/log this thing inside the parentheses. Bye, thanks!"

By writing this line, we've also solved the second thing we need: Something for JavaScript to say. We can put a String, Number, or Boolean (or any data type) inside the parentheses of a `console.log` statement.

### 3. Math Operators

JavaScript includes the general math *operators*that you can find on a calculator:

1. Add: `+`
2. Subtract: `-`
3. Multiply: `*`
4. Divide: `/`

These all work how you might guess: `3 + 4` will equal `7`, `50 / 10` will equal `5`.

Now let's generate a space fact while we learn a brand new operator called – drum roll please – the *modulus*.

The idea behind the modulus is to show you the remainder after you divide a number.

So, if you divide `13 / 5`, `5` goes into `13` two times, and there will be `3` remaining. A modulus, denoted by a `%`, would take `13 % 5`and return the remainder `3`.

### 4. Random

Sometimes it's necessary to generate a random number within a program. We can do that with this code:

```javascript
Math.random();
```

This code will return a random number between 0 and 1. JavaScript will generate a random number for us with this code.

To generate a random number between 0 and 50, we could multiply this result by 50, like so:

```javascript
Math.random() * 50;
```

The problem with this is that the answer will most likely be a decimal. Luckily, JavaScript has our back with another built in function called`Math.floor`. `Math.floor` will take a decimal number, and round down to the nearest whole number. It is used like this:

```javascript
Math.floor(Math.random() * 50);
```

In this case:

1. `Math.random` will generate a random number between 0 and 1.
2. We then multiplied that number by `50`, so now we have a number between 0 and 50.
3. Then, `Math.floor` will round the number down to the nearest whole number.

### 5. Comments

Comments are lines that are not evaluated when the code runs. They exist just for human readers, in other words. Comments can be extremely useful when we're looking back at code we've written later on and for other people who will be looking at your code.

There are two types of code comments in JavaScript:

1. A *single line comment* will comment out a single line, and is denoted with two forward slashes `//` preceding a line of JavaScript code.

   ```javascript
   // The first 5 decimals of pi
   console.log('Pi is equal to ' + 3.14159);
   ```

2. A *multi-line comment* will comment out multiple lines, and is denoted with `/*` to begin the comment, and `*/` to end the comment.

   ```javascript
   /*
   console.log('All of this code');
   console.log('Is commented out');
   console.log('And will not be executed);
   */
   ```

### Generalizations

- There are three essential *data types* in JavaScript: strings, numbers, and booleans.
- We can write out anything to the console with `console.log`.
- We can do math with operators like `+`, `-`,`*`, and `/`.
- We can find the remainder after dividing two numbers with a modulus: `%`.
- We can generate a random number with`Math.random`, then make it a whole number with `Math.floor`.
- We write a single line comment with `//`and a multi-line comment with `/*` and`*/`.

## Variables

### 1. Create a Variable

Variables allow us to assign data to a word, then we can use that word within our program instead of the data. Then, if the variable's value changes we only have to change the variable's value instead of re-writing the entire program.

Let's dive in and see a variable in the wild. Here is how you declare a variable:

```javascript
var myName = 'Arya';
console.log(myName);
// Output: Arya
```

You can almost read it aloud: "Variable myName is equal to Arya."

Let's dissect that statement and look at its parts:

1.  `var`, short for variable, is the JavaScript *keyword* that will create a new variable for us.
2.  `myName` is chosen by a developer (that's you!).
    > Notice that the word has no spaces, and each new word is capitalized. This is a common convention in JavaScript, and is called *camelCase*.
3.  `=` means to *assign* whatever's next to the variable.
4.  `'Arya'` is the *value* that the equals `=`assigns into the variable `myName`.

After the variable is declared, we can print the variable with: `console.log(myName)`. This will print `'Arya'` to the console.

If variables can hold strings, can they hold other data types? Let's give it a shot:

```javascript
var myAge = 15;
var likesChocolate = true;

console.log(myAge);
// Output: 15

console.log(likesChocolate);
// Output: true
```

Variables can hold any data type, like strings, numbers, and Booleans. They can also hold data types that we have not learned yet, like arrays, functions and objects (more on that later).

### 2. Changing a Variable's Value

Why do we care about variables?

Variables are useful in two ways:

1. They allow us to use the same value over and over, without having to write a string or other data type over and over.
2. More importantly, we can assign variables different values that can be read and changed by the program without altering our code.

For example, a weather app can show you a different high temperature every day. Instead of writing a new website everyday, they store the information in a variable and just change the*value* of that variable.

We can change a variable's value if we want, like this:

```javascript
var weatherCondition = 'Monday: Raining cats and dogs';
weatherCondition = 'Tuesday: Sunny';

console.log(weatherCondition); 
// Output: 'Tuesday: Sunny'
```

1. We created a variable by using the keyword `var` and the name `weatherCondition`.
2. Then, we took the existing`weatherCondition` variable, and set its*value* equal to `'Tuesday: Sunny'`.

True to their name, variables are indeed variable.

### 3. String Interpolation

We can use the `+` operator from earlier to interpolate (insert) a variable into a string, like this:

```javascript
var myPet = 'armadillo';
console.log('I own a pet ' + myPet + '.'); 
// Output: 'I own a pet armadillo.'
```

## Control flow

In programming, making decisions with code is called *control flow*.

For instance, if we were making a choose-your-own-adventure game, we'd need to program a way for a user to choose which plot line they'd like to pursue. Control flow statements enable JavaScript to make those decisions by executing different code based on a condition.

### 1. if/else Statements

If you think about what we've been doing so far, we've been writing instructions for computers.

That's all programming really is: a list of instructions for computers.

The main difficulty of being a developer is translating our ideas in *human-speak* into ideas in *computer-speak*.

Let's learn how we can ask JavaScript to think like us and make decisions like us.

Let's start with human-speak. Many decisions we make everyday boil down to this sentence in some form:

"If something is true, let's do option 1, or else, if it is false, let's do option 2."

This sentence looks fairly similar when we write it with JavaScript. See for yourself:

```javascript
var needCoffee = true;
if (needCoffee) {
    console.log('Finding coffee');
} else {
    console.log('Keep on keeping on!');
}
```

1. If the variable `needCoffee` is `true`, JavaScript will run one code block, and if a variable is `false`, it will run another.

2. `needCoffee` is the *condition* we are checking inside the `if`'s parentheses. Since it is equal to `true`, our program will run the code between the first opening curly brace `{` (line 2) and the first closing curly brace `}` (line 4). It will completely ignore the `else { ... }` part. In this case, we'd see `'Finding coffee'` log to the console.

   > Note: Code between curly braces are called *blocks*. `if`/`else` statements have two code blocks.

3. If we adjusted `needCoffee` to be `false`,*only* the `else`'s `console.log` will run.

4. `if`/`else` statements are how we can process yes/no questions programmatically.

### 2. Comparison Operators

`if`/`else` statements are made even more powerful with *comparison operators*.

There are two comparisons you might be familiar with:

- Less than: `<`
- Greater than: `>`

You may also recognize these:

- Less than or equal to: `<=`
- Greater than or equal to: `>=`

Comparisons need two things to compare and they will always return a boolean (`true` or`false`).

There are two more extremely useful comparisons we can make. Often times, we might want to check if two things are equal, or if they are not.

1. To check if two things equal each other, we can use `===` (three equals in a row).
2. To check if two things *do not* equal each other, we can write `!==` (exclamation with two equals in a row).

Slow down here, this can be easily confused with creating variables. Variables use one equals sign `=` to assign a value to a variable. When you're comparing two variables, make sure to use three `===`.

### 3. else if Statements 

`if`/`else` statements are either this or that for us right now. They answer questions that are either yes or no.

What can we do if we have a question that has multiple yes conditions, or multiple no conditions?

We can add more conditions to our `if`/`else`statement with: `else if`. Check out how this fits into our current knowledge of `if`/`else`statements:

```javascript
var stopLight = 'green';

if (stopLight === 'red') {
  console.log('Stop');
} else if (stopLight === 'yellow') {
  console.log('Slow down');
} else if (stopLight === 'green') {
  console.log('Go!');
} else {
  console.log('Caution, unknown!');
}
```

1. We created a variable named `stopLight`that is assigned to the String `'green'`.
2. Then, there's an `if`/`else` statement with multiple conditions, using `else if`. `else if`allows us to find multiple states of the`stopLight` variable, and output different things based on its color.
3. The whole thing ends with the singular `else`we know and love. The `else` is a catch-all for any other situation. For instance, if the`stopLight` was blinking blue, the last `else`would catch it and return a default message.


### 4. Logical Operators

In English, sometimes we say "both of these things" or "either one of these things." Let's translate those phrases into JavaScript with some special operators called *logical operators*.

1. To say "both must be true," we can use`&&`.
2. To say "either can be true," we can use `||`.
3. To say "I want to make sure this is the opposite of what it really is," we can use`!`.
4. To say "these should not be equal to each other," we can use `!==`.

For example:

```javascript
if (stopLight === 'green' && pedestrians === false) {
  console.log('Go!');
} else {
  console.log('Stop');
}
```

1. In the example above, we make sure that the `stopLight` is `'green'` *and* `&&` there are no `pedestrians` before we log`'Go!'`.
2. If either of those conditions are false, we log `'Stop'`.

Just like the operators we learned previously, these logical operators will return either `true`or `false`.

These logical operators are helpful when writing `if`/`else` statements, since they let us make sure multiple variables are true or false.

### 5. switch Statements

Before we move on, let's circle back to`else if` statements.

Using `else if` is a great tool for when we have a few different conditions we'd like to consider.

`else if` is limited however. If we want to write a program with 25 different conditions, like a JavaScript cash register, we'd have to write *a lot* of code, and it can be difficult to read and understand.

To deal with times when you need many `else if` conditions, we can turn to a `switch`statement to write more concise and readable code.

Note: To a computer, a `switch` statement and an `if`/`else` statement are the same, but a `switch` statement can be easier for other humans to read. Part of being a good developer is writing code that both computers and other humans can read.

`switch` statements look like this:

```javascript
var groceryItem = 'papaya';

switch (groceryItem) {
  case 'tomato':
    console.log('Tomatoes are $0.49');
    break;
  case 'lime':
    console.log('Limes are $1.49');
    break;
  case 'papaya':
    console.log('Papayas are $1.29');
    break;
  default:
    console.log('Invalid item');
    break;
}
```

1. The `switch` keyword initiates the statement, and is followed by `( ... )`, which contains the condition that each`case` will compare to. In the example, the condition is `groceryItem`.
2. Inside the block, `{ ... }`, there are`case`s. `case` is like the `else if` part of an `if`/`else if`/`else` statement. The word following the first `case` is`'tomato'`. If `groceryItem` equalled`'tomato'`, that case's `console.log`would run.
3. `groceryItem` equals `'papaya'`, so the first and second `case` statements are skipped. The third `case` runs since the`case` is `'papaya'` matches`groceryItem`'s value. This particular program will log out:`'Papayas are $1.29'`.
4. Then the program stops with the `break`keyword. This keyword will prevent the`switch` statement from executing any more of its code.
5. At the end of each `switch` statement, there is a `default` condition. If none of the `case`s are true, then this code will run.

### Generalizations

- `if`/`else` statements make binary decisions and execute separate code based on a condition.
- We can add extra conditions with to`if`/`else` statements with `else if`conditions.
- `switch` statements make complicated`if`/`else` statements easier to read, however they achieve the same result as`if`/`else` statements.
- *Comparison operators*, like `<`, `>`, `<=`, and `>=` can compare two variables. After they compare, they always return either`true` or `false`.
- *Logical Operators*, like `&&`, `||`, `!==`, and`!`, can compare two variables to see if a certain condition exists:
    - `&&` checks if both sides are `true`.
    - `||` checks if either side is `true`.
    - `!==` checks if both sides are not equal.
    - `!` changes a variable that is `true` to`false`, and vice versa.


## Functions

### 1. Functions

How does this code work?

```javascript
var calculatorOn = false;

function pressPowerButton() {
  if (calculatorOn) {
    console.log('Calculator turning off.');
    calculatorOn = false;
  } else {
    console.log('Calculator turning on.');
    calculatorOn = true;
  }
}

pressPowerButton();
// Output: Calculator turning on.

pressPowerButton();
// Output: Calculator turning off.
```

1. On line 1, we have a variable named`calculatorOn` set to `false`. Our program starts with the calculator in the off position.

2. On line 3, there's a function named `pressPowerButton`. Functions follow this syntax:

   • They begin with the JavaScript keyword `function`.

   • After `function` comes the name of the function. `pressPowerButton` is the name of the function. 

   > Notice there are no spaces in the name and each new word is capitalized. This is a convention in the JavaScript community called *camelCase*.

   • After the function's name, comes parentheses `()`. 

   • Finally, the function has a block of code it executes between the curly braces `{}`.

3. Inside the function is an `if`/`else`statement.

4. On the last few lines, we make the function run by writing `pressPowerButton()`. This term for this is *calling* the function. We call it with `pressPowerButton()`, and it runs all the code in the block of the function.

5. We executed the code in the block of the function twice without having to write it twice. Functions can make code reusable!

### 2. Parameters

The calculator program should be able to perform a math operation on a number. We should be able to give a calculator a number, have it perform a task on it like multiplication, then print a result.

Currently, we have no way to give a function a number. To do this, we can use *parameters*. Parameters are variables that we can set when we call the function. For example:

```javascript
function multiplyByThirteen(inputNumber) {
  console.log(inputNumber * 13);
}

multiplyByThirteen(9);
// Output: 117
```

1. We added `inputNumber` within the parentheses of the `multiplyByThirteen`function. `inputNumber` is a parameter.
2. Inside the `multiplyByThirteen` function, we use `console.log` to print the`inputNumber` by `13`.
3. When we call the `multiplyByThirteen`function on the last lines, we set the`inputNumber` parameter. For instance,`multiplyByThirteen(9)` calls the`multiplyByThirteen` function, and sets`inputNumber` as `9`. Then, inside the block of the `multiplyByThirteen`function, `9` is multiplied by `13`, resulting in `117` printing to the console.
4. Note on terminology: `inputNumber` is a parameter, but when we call`multiplyByThirteen(9)`, the `9` is called an *argument*. Therefore, arguments are provided when you call a function, and parameters receive arguments as their value. So, `inputNumber` is a parameter and its value is the argument `9`, since we wrote `multiplyByThirteen(9)`.

Parameters let us write logic inside functions that can be modified based on when we call the function, which will help make our functions more flexible.

If we can set one parameter, can we set two?

We can set as many parameters as we'd like by adding them when we declare the function, separated by commas, like this:

```javascript
function getRemainder(numberOne, numberTwo) {
  console.log(numberOne % numberTwo);
}

getRemainder(365, 27);
// Output: 14
```

By adding multiple parameters, we can build functions that are more flexible. Now the function has two variables that we can define when we call the function.

### 3.  return

Using `console.log` as the result of a function isn't the best use of a function. The purpose of a function is to take some input, perform some task on that input, then return a result.

To return a result, we can use the `return` keyword. Take a look at our function from the last exercise, now re-written slightly:

```java
function getRemainder(numberOne, numberTwo) {
  return numberOne % numberTwo;
}

console.log(getRemainder(365, 27));
// Output: 14
```

1. Instead of using `console.log` inside the`getRemainder` function, we used the`return` keyword. `return` will take the result of the math operation and give it back to whatever calls it.
2. On the last line, we called the`getRemainder` function inside of a`console.log` statement, which outputted the result of `14`.
3. This code achieved the same output as before, however now our code is better. Why? If we wanted to use the`getRemainder` function in another place in our program, we could without printing the result to the console. Using `return` is generally a best practice when writing functions, as it makes your code more maintainable and flexible.

When functions `return` their value, we can use them together and inside one another. If our calculator needed to have a Celsius to Fahrenheit operation, we could write it with two functions like so:

```java
function multiplyByNineFifths(celsius) {
  return celsius * (9/5);
}

function getFahrenheit(celsius) {
  return multiplyByNineFifths(celsius) + 32;
}

console.log('The temperature is ' + getFahrenheit(15) + '°F');
// Output: The temperature is 59°F
```

Take a look at the `getFahrenheit` function. Inside of its block, we called `multiplyByNineFifths` and passed it the degrees in `celsius`. The`multiplyByNineFifths` function multiplied the `celsius` by `(9/5)`. Then it returned its value so the `getFahrenheit` function could continue on to add `32` to it.

Finally, on the last line, we interpolated the function call within a `console.log` statement. This works because `getFahrenheit` returns it's value.

We can use functions to section off small bits of logic or tasks, then use them when we need to. Writing functions can help take large and difficult problems and break them into small and manageable problems.

### Generalizations

- *Functions* are written to perform a task.
- Functions take data or variables, perform a set of tasks on them, and then return the result.
- We can define parameters when calling the function.
- When calling a function, we can pass in *arguments*, which will set the function's parameters.
- We can use `return` to return the result of a function which allows us to call functions anywhere, even inside other functions.


## Scope

### 1. Global Scope

Scope is a big idea in programming, so let's start at a high level.

Scope refers to where in a program a variable can be accessed. The idea is that some variables are unable to be accessed everywhere within a program.

Think of it like a an apartment building. Everyone who lives in the apartment building is under the *global scope* of the building and its manager. So, if there are rats in the shared laundry room, everyone has access to the laundry machines, and the rats.

If you write a variable outside of a function in JavaScript, it's in the *global scope* and can be used by any other part of the program, just like the laundry room can be used by everyone in an apartment.

### 2. Functional Scope

In our theoretical apartment building, you have your own apartment. It has stuff in it that is yours. Other people in the building can't access it. This is like *functional scope*. You have access to your stuff inside your apartment, and in the building – but not anyone else's apartment.

When we write variables inside a function, only that function has access to its own variables. Therefore, they are in the *functional scope*.

In addition to a function having access to its own variables, it also has access to variables in the global scope.

###  Generalizations

- *Scope* is the idea in programming that some variables are acessible/inaccessible from other parts of the program.
- *Global Scope* refers to variables that are accessible to every part of the program.
- *Functional Scope* refers to variables created inside functions, which are not accessible outside of its block.

## Arrays

One way we organize data in real life is to make lists. Let's make one here:

```
Bucket List:
0. Rappel into a cave
1. Take a falconry class
2. Learn to juggle
```

Let's now write this list in JavaScript, as an*array*:

```javascript
var bucketList = ['Rappel into a cave', 'Take a falconry class', 'Learn to juggle'];
```

Arrays are JavaScript's way of making lists. These lists can store different data types and they are ordered, meaning the position of each list item is numbered by JavaScript.

### 1. Property Access

Each item in an array has a numbered position. We can access an item using its number, just like we would in an ordinary list. There’s one catch though!

JavaScript counts starting from `0`, not `1`, so the first item in an array will be at position `0`. This is because JavaScript is *zero-indexed*.

We can select the first item in an array like this:

```javascript
var bucketList = ['Rappel into a cave', 'Take a falconry class', 'Learn to juggle'];
var listItem = bucketList[0];
console.log(listItem);
// Output: 'Rappel into a cave'
```

If we wanted the second item, we'd write:

```javascript
var bucketList = ['Rappel into a cave', 'Take a falconry class', 'Learn to juggle'];
var listItem = bucketList[1];
console.log(listItem);
// Output: 'Take a falconry class'
```

### 2. length property

It is often convenient to know how many items are inside of an array.

We can find this out by using one of an array's built in *properties*, called `.length`. We can attach this to any variable holding an array and it will return the number of items inside.

As an example:

```javascript
var bucketList = ['Rappel into a cave', 'Take a falconry class'];

console.log(bucketList.length);
// Output: 2
```

### 3. push Method

JavaScript has a surprise for us: it has built in functions for arrays that help us do common tasks! Let's learn two of them.

First, `push()` allows us to add items to the end of an array. Here is an example of how this is used:

```javascript
var bucketList = ['item 0', 'item 1', 'item 2'];

bucketList.push('item 3', 'item 4');
```

The method `push()` would make the`bucketList` array look like:

```javascript
['item 0', 'item 1', 'item 2', 'item 3', 'item 4'];
```

Check out how `push()` works here:

1. It connects to `bucketList` with a period.
2. Then we call it like a function. That's because `push()` *is* a function and one that JavaScript allows us to use right on an array.

### 4. pop Method

Now that we can `push()` items into an array, let's pop one off, using `pop()`.

`pop()` is similar to `push()`, except that it deletes the last item of an array. Here's an example:

```javascript
var bucketList = ['item 0', 'item 1', 'item 2'];

bucketList.pop();

console.log(bucketList); 
// Output: [ 'item 0', 'item 1' ]
```

Notice that `'item 2'` was deleted from the end.

### Generalizations

- *Arrays* are lists and are a way to store data in JavaScript. Each item inside of an array is at a numbered position. Arrays are created with brackets `[]`.
- We can access one item in an array using it's numbered position, with syntax like:`myArray[0]`.
- Arrays have a `length` property, which allows you to see how many items are in an array.
- Arrays also have their own methods, including `push` and `pop`, which add and subtract items from an array, respectively.

## Loops

### 1. Loops

One of a computer's greatest abilities is to repeat a task over and over so we don't have to. Loops let us tell the computer to loop over a block of code so that we don't have to write out the same process over and over.

Loops are especially helpful when we have an array where we'd like to do something to each item in the array, like logging each item to the console.

There are two kinds of loops we will learn in this lesson:

1. `for` loops, which let us loop a block of code a known amount of times.
2. `while` loops, which let us loop a block of code an unkown amount of times.

### 2. for loops

![img](https://s3.amazonaws.com/codecademy-content/courses/javascript-101/js101-diagram_forloops.svg)

Instead of writing out the same code over and over, let’s make the computer loop through our array for us. We can do this with `for` loops.

The syntax looks like this:

```javascript
var animals = ["Grizzly Bear", "Sloth", "Sea Lion"];

for (var i = 0; i < animals.length; i++) {
  console.log(animals[i]);
}

// Output:
// Grizzly Bear
// Sloth
// Sea Lion
```

Since this syntax is a little complicated, let's break it into 4 parts:

1. Within the `for` loop's parentheses, the*start condition* is `var i = 0`, which means the loop will start counting at `0`.
2. The *stop condition* is`i < animals.length`, which means the loop will run as long as `i` is less than the length of the animals array. When `i` is greater than the length of the animals array, the loop will stop looping.
3. The *iterator* is `i++`. This means that each loop, `i` will have 1 added to it.
4. And finally, the code block is inside the`{ ... }`. The block will run each loop, until the loop stops.

The secret to loops is that `i`, the variable we created inside the `for` loop's parentheses, is always equal to a number. To be more clear, the first loop, `i` will equal `0`, the second loop,`i` will equal `1`, and the third loop, `i` will equal `2`.

### 3. for loop backwards

If we can make a `for` loop run forwards through an array, can we make it run backwards through it? Of course!

We can make out loop run backwards by modifying the start, stop, and iterator conditions.

To do this, we'll need to edit the code between the `for` loop's parentheses:

1. The start condition should set `i` to the length of the array.
2. The stop condition should end when `i` is`0`.
3. The iterator should subtract `1` each time, which is done with `i--`.

### 4. for loops inside of for loops

Let's say that you and a friend would like to go on vacation together. You've both made arrays of your favorite places and you want to compare to see if any places match. This is a job for loops!

The big idea is that we can run a `for` loop inside another `for` loop to compare the items in two arrays.

Every time the outter `for` loop runs once, the inner `for` loop will run completely.

With two `for` loops, we can check to see if any of the your vacation spots match your friend's spots.

```javascript
var myPlaces = ['a', 'b', 'c'];
var friendPlaces = ['d', 'b', 'm'];

for (var i = 0; i < myPlaces.length; i++) {
  for(var j = 0; j < friendPlaces.length; j++) {
    if (myPlaces[i] === friendPlaces[j]) {
      console.log(friendPlaces[j]);
    }
  }
}
```

### 5. while Loops

Awesome job! `for` loops are great, but they have a limitation: you have to know how many times you want the loop to run. What if you want a loop to run an unknown or variable number of times instead?

For example, if we have a deck of cards and we want to flip cards (loop a card flipping function) until we get a 'Spade', how could we write that in JavaScript?

That's the purpose of the `while` loop. It looks like similar to a `for` loop. Check it out:

```javascript
while (condition) {
  // code block that loops until condition is false
}
```

1. The loop begins with the keyword `while`
2. Inside the parentheses, we can insert a condition. As long as the variable evaluates to `true` the block of code will loop.
3. Inside the code block we can write any code we'd like to loop.

### Generalizations

- `for` loops allow us to repeat a block of code a known amount of times.
- We can use a `for` loop inside another`for` loop to compare two lists.
- `while` loops are for looping over a code block an unknown amount of times.


## JavaScript and the DOM

### 1. JavaScript with HTML and CSS

Javascript typically gets included with HTML and CSS (which structure and style web pages). All modern browsers know how to run JavaScript if we include it in an HTML and CSS project.

JavaScript also has some special functions to help us access the code inside HTML and CSS so that we can write JavaScript to make that output interactive and dynamic.

### 2. Linking JavaScript

We can link a JavaScript file to HTML by including it as the `src` of a `<script>` tag inside of an HTML file, like this:

```html
<script src='js/main.js'></script>
```

This line of code will link the file located at **js/main.js**. 

### 3. Document Object Model

The *Document Object Model*, commonly referred to as the *DOM*', is the term for*elements* in an HTML file. Elements are any HTML code denoted by HTML tags, like `<div>`,  `<a>` or `<p>`. Let's use JavaScript to interact with the DOM.

We can select an HTML element with JavaScript by selecting its `class` attribute, like this:

```javascript
var header = document.getElementsByClassName('example-class-name');
```

This would find an element like this in the HTML:

```html
<div class='example-class-name'> ... </div>
```
### 4. jQuery

We've just covered how to select HTML elements using the syntax:`document.getElementsByClassName`. This is verbose and clunky, however. If we were to select a lot of elements this way, our code would get dense and difficult to read.

Wouldn't it be nice if there was a simpler way to select DOM elements? As you might have guessed, there is!

To better interact with DOM elements, we can use a *library*. A library is a set of code that contains useful pre-written functions that help with certain tasks.

A great library for interacting with the DOM is *jQuery*.

jQuery is a library written in JavaScript. The syntax and functions it contains will help us interact with DOM efficiently. We'll walk through a few examples in the following exercises.

In order to use jQuery, we need to:

1. Include jQuery in our project. jQuery is a library, which means it is a set of code in a file, therefore we will need to link that file in our HTML in order to access it.

   Once we link it in our HTML file, we can use its functions and syntax in our **js/main.js** file.

2. Once linked, we'll need to make sure our HTML is loaded before we run our jQuery and JavaScript code.

   This will prevent our jQuery and JavaScript code from running before the elements they select are rendered.

jQuery has a built in function to check if the page is ready before it will run our code. After the `main` function, write this code:

```javascript
function main() {
  
});

$(document).ready(main);
```

Notice that we put `main` inside the parentheses of `ready`. `main` here is a *callback*, which means that our code will wait until the `document` (in other words, the DOM) is loaded, or `ready`. When it is, *then* it will execute the`main` function. jQuery calls back to the`main` function, therefore it's a callback.

In the event that our HTML and CSS took 5 minutes to load, this code would wait until it loaded completely before running

### 5. jQuery Selectors

With plain JavaScript we selected an HTML element with this code:

```javascript
document.getElementsByClassName('skillset');
```

With jQuery we can select the same element with:

```javascript
$('.skillset');
```

1. We can wrap any CSS selector, like class, id, or tag, with `$('.example-class')` to select it with jQuery.
2. The selectors jQuery uses are the exact same as CSS selectors. For instance, if there's an element with a class of`supporting-text`, you could select it with `$('.supporting-text')`. Another example, if an element had an id of 'header', you could select it with`$('#header')`.

### 6. hide

Now that we can select an element with jQuery, we can use built-in jQuery functions to modify it. From here on, we will start building features into our skills website.

First off, it would be nice to make the page fade in when loaded.

To make a page fade in, it must first be hidden. We can hide elements with jQuery with a function named `hide`.

We can `hide` elements with jQuery, like this:

```javascript
$('.my-selector').hide();
```

1. We attached the `hide` function directly to the jQuery selector.
2. The `hide` function will add the CSS property `display: none` to the DOM element from the page, which will hide it.

### 7. fadeIn

In order to fade in the `skillset` element, we can use a the jQuery function named `fadeIn`.

True to its name, `fadeIn` will fade an element in over a period of time in milliseconds. It looks like this:

```javascript
$('.example-class').fadeIn(400);
```

1. We must start with an element that is not currently displayed on the page.
2. Just like before, we can attach `fadeIn` directly to a jQuery selector.
3. Within `fadeIn`'s parentheses, we can specify how long we want the fade to last in milliseconds. `400` is the default.
4. The example code will fade in the`'.example-class'` element over 0.4 seconds.

### 8. click

In order to make an element clickable, we need to write jQuery that listens to an element for a click event. jQuery can do this with an event listener function named `on('click')`.

This function will wait for a click event, and when one occurs, it will execute a provided function. The syntax looks like this:

```javascript
$('.example-class').on('click', function() {
  // execute the code here when .example-class is clicked.
});
```

1. `$('.example-class')` selects an HTML element with the class `example-class`.
2. `.on('click', function() { ... })`adds a click listener to the selector. When it's clicked the function will execute the code within its block.

### 9. show

jQuery provides a function named `show`, which is the opposite of `hide`.

To show an element, the syntax looks as such:

```javascript
$('.example-class').show();
```

1. `show` is attached directly to the jQuery selector.
2. `show` will change the CSS attribute`display: none` to a visible display property, therefore showing the element.

### 10. toggle

jQuery provides a function named `toggle` . `toggle` will hide or show an element, each time it is triggered. The syntax looks like this:

```javascript
$('example-class').toggle();
```

1. `toggle` can be called directly on an jQuery selector.
2. When `toggle` is executed, it will hide or show the element that the selector points to. If the element is currently hidden,`toggle` will show the element, and vice versa.

### 11. toggleClass

We can toggle a CSS class with a jQuery function named `toggleClass`. The syntax looks like this:

```javascript
$('.example-class').toggleClass('active')
```

1. `.toggleClass` is a function that will toggle a CSS class on the jQuery selector it's connected to. If the element has the class applied to it, `toggleClass` will remove it, and if the element does not have the class, it will add it.
2. `'active'` is the class that we will toggle on and off. Notice that `toggleClass` does not require us to include the period before`'active'` since it's already expecting a CSS class.

### 12. this

We can select the specific element we clicked on with the jQuery selector `$(this)`.

The syntax looks like this:

```javascript
$('.example-class').on('click', function() {
  $(this).toggleClass('active');
});
```

1. `$(this)` selects the clicked element. If there are multiple elements with a class of`.example-class`, `this` will only toggle the class of the one that is clicked on.
2. Notice that `$(this)` does not require quotes around it, since it is not a CSS class. Instead, `this` is a JavaScript keyword.
3. `$(this)` behaves just like our other selectors. We can attach `toggleClass` or`toggle` to it in the same way.

### 13. next

jQuery has a function named `next` to help us select elements that are next to another element. If we have this in our HTML:

```html
<div class='item-one'> ... </div>
<div class='item-two'> ... </div>
```

If we wanted to hide `item-two`, we could write:

```javascript
$('.item-one').next().hide();
```

1. We can attach `next` to any jQuery selector to select the next direct element.
2. Then, we can attach any jQuery function to`next()`. In this case, we attached `hide`, which would hide the next element after the `$('.item-one')` element.

### 14. text

Since we have a few areas to click on, it may be helpful to show users which sections they have viewed by changing the text inside the 'Recent Projects' buttons.

When a user clicks on a button, we will permanently change the text of the button to 'Projects Viewed'.

We can change the text of an element with the jQuery function `text`. It's syntax looks like this:

```javascript
$('.my-selector').text('Hello world!');
```

1. `text` attaches directly to a jQuery selector.
2. Inside of `text`'s parentheses, we can provide text that will become the text of our DOM element. The text we supply will replace any existing text, and if the element has no pre-existing text, `text` will add it.

### 15. slideToggle

jQuery provides a method named `slideToggle` that can animate an element's entrance and exit. The syntax looks like this:

```javascript
$('.example-class').slideToggle(400);
```

1. `slideToggle` can be called directly on a jQuery selector.
2. `slideToggle` also takes a parameter of milliseconds that the animation should last. The default is 400 milliseconds, or 0.4 seconds.

###  Generalizations

- How to link a JavaScript file to an HTML file using a `<script>` tag.
- jQuery is a library to help JavaScript interact with HTML elements.
- We can make sure our page is ready to go with `$(document).ready()`. Then, we can pass in a function to `ready` that will execute when the page is loaded.
- jQuery uses the same selector names as CSS.
- We can hide elements with `hide`, and show them with `show`.
- We can make elements appear with`fadeIn`.
- `on('click')` functions allow us to make HTML elements clickable. When an element is clicked, the click function will execute the function we provide. It's full sytnax looks like:`$('.example-class').on('click', function() {  // Execute when .example-class is clicked});`
- `toggle` will toggle an element on and off the page.
- `$(this)` will select the specific element that was clicked if placed inside a click function.
- `toggleClass` can toggle a class on and off.
- We can select elements next to each other with `next`.
- `text` will replace a DOM element's text with text we specify.
- `slideToggle` will make an element slide into and out of the page with an animation.


## More Info

[Learn JavaScript](https://www.codecademy.com/learn/learn-javascript)
