---
title: "Learn Sass"
date: 2017-01-14
modified: 2017-01-14
published: true
categories:
  - SASS
tags:
  - HTML
  - CSS
  - SASS
excerpt: |
    **Sass**, or **S**yntactically **A**wesome **S**tyle**S**heets, is an extension language for CSS. With Sass, you can write clean, sustainable CSS code and solve the common repetition and maintenance challenges present in traditional CSS.
---

* TOC
{:toc}

## Your First Sass Stylesheet

### 1. Why Sass?

**Sass**, or **S**yntactically **A**wesome **S**tyle**S**heets, is an extension language for CSS. With Sass, you can write clean, sustainable CSS code and solve the common repetition and maintenance challenges present in traditional CSS.

In addition to being a valuable skill for any front-end developer, transitioning from CSS to Sass is pretty smooth due to the familiar syntax. For this reason, we will be learning the**SCSS** (Sassy CSS) syntax.

### 2. Compiling Sass

Sass can't be directly interpreted by your browser, so it must first be converted, or *compiled*, to CSS before the browser can directly understand it.

*Compiling* refers to converting code to lower level code so that it can be executed. By compiling SCSS to CSS, it can be interpreted by your browser and the results will appear on a webpage.

Before we dive into writing Sass, let's first learn how to compile it to CSS by typing the following command in the terminal and pressing enter:

```scss
sass main.scss main.css
```

The `sass` command above takes in two arguments:

1. The input (**main.scss**)
2. The location of where to place that output (**main.css**)

### 3. Nesting Selectors

*Nesting* is the process of placing selectors inside the *scope* of another selector:

- In programming, a variable's scope is the context in which a variable is defined and available to use.
- In Sass, it's helpful to think of the scope of a selector as any of the code between its opening `{` and closing `}` curly brackets.
- Selectors that are *nested* inside the scope of another selector are referred to as *children*. The former selector is referred to as the *parent*. This is just like the relationship observed in HTML elements.

```scss
.parent {
  color: blue;
  .child {
    font-size: 12px;
  }
}
```

In the example above `.child` is the child selector and `.parent` is the parent selector.

The above SCSS would compile to the following, equivalent CSS:

```css
.parent {
  color: blue;
}

.parent .child {
    font-size: 12px;
}
```

Nesting allows you to see the clear DOM relationship between two selectors while also removing the repetition observed in CSS.

### 4. Nesting Properties

n SCSS, nesting is not limited only to selectors. You can also nest common CSS properties if you append a `:` colon suffix after the name of the property.

For example, the following SCSS code:

```scss
.parent {
  font : {
    family: Roboto, sans-serif;
    size: 12px;
    decoration: none;
  }
}
```

will compile to the following CSS:

```css
.parent {
  font-family: Roboto, sans-serif;
  font-size: 12px;
  font-decoration: none;
}
```

### 5. Variables In Sass

*Variables* in SCSS allow you to assign an identifier of your choice to a specific value.

Why is that useful? Unlike in CSS, if you need to tweak a value, you'll only have to update it in one place and the change will be reflected in multiple rules.

In Sass, `$` is used to define and reference a variable:

```scss
$translucent-white: rgba(255,255,255,0.3);
```

**Note:** It's important to stick to one naming convention for variables when you first build out your codebase. This will help you reference them easily in the future.

### 6. Sass(y) Types

There are different *data types* you can assign to a variable in CSS.

In addition to the *color* data type we have seen, there are also:

1. *Numbers*, such as `8.11`, `12`, and `10px`. Notice that while `10` has a unit of `px`associated with it, it is still considered a number.
2. *Strings* of text, with and without quotes. Some examples are `"potato"`,`'tomato'`, `span`.
3. *Booleans*, or simply `true` and `false`.
4. *null*, which is considered an empty value.

### 7. Maps & Lists 

In addition to color, numbers, strings, booleans, and null, Sass also has two other data types, *lists* and *maps*.

- *Lists* can be separated by either spaces or commas. For example, the following list denotes font properties, such as:

```
1.5em Helvetica bold;
```

or

```
Helvetica, Arial, sans-serif;
```

**Note:** You can also surround a list with parentheses and create lists made up of lists.

- *Maps* are very similar to lists, but instead each object is a key-value pair. The typical map looks like:

```
(key1: value1, key2: value2);
```

**Note:** In a map, the value of a key can be a list or another map.

### Generalizations

1. **Nesting** is the process of placing child selectors and properties in the scope of a parent selector. This allows a programmer to draw DOM relationships and avoid repetition.

2. **Variables** make it easy to update code and reference values by allowing you to assign an identifier to a value.

3. Sass **Data Types** include:

    - Numbers
    - Strings
    - Booleans
    - null
    - Lists
    - Maps

## Mixins and the & Selector

### 1. The & Selector in Nesting

Recall that, in CSS, a pseudo-element is used to style parts of an element, for example:

- Styling the content `::before` or `::after` the content of an element.
- Using a pseudo class such as `:hover` to set the properties of an element when the user's mouse is touching the area of the element.

In Sass, the `&` character is used to specify exactly where a parent selector should be inserted. It also helps write psuedo classes in a much less repetitive way.

For example, the following Sass:

```scss
.notecard{ 
  &:hover{
      @include transform (rotatey(-180deg));  
    }
  }
```

will compile to the following CSS:

```css
.notecard:hover {
  transform: rotatey(-180deg);
}
```

### 2. What is a Mixin?

In addition to variables and nesting, Sass has multiple constructs that reduce repetition.

In Sass, a *mixin* lets you make groups of CSS declarations that you want to reuse throughout your site.

The notation for creating a mixin is as follows:

```scss
@mixin backface-visibility {
  backface-visibility: hidden;
  -webkit-backface-visibility: hidden;
  -moz-backface-visibility: hidden;
  -ms-backface-visibility: hidden;
  -o-backface-visibility: hidden;
}
```

**Note:** Mixin names and all other Sass identifiers use hyphens and underscores interchangeably. The following code:

```scss
.notecard {
.front, .back {
    width: 100%;
    height: 100%;
    position: absolute;

    @include backface_visibility;
  }
}
```

is equivalent to the following CSS:

```css
.notecard .front, .notecard .back {
  width: 100%;
  height: 100%;
  position: absolute;

   backface-visibility: hidden;
  -webkit-backface-visibility: hidden; 
  -moz-backface-visibility: hidden;
  -ms-backface-visibility: hidden;
  -o-backface-visibility: hidden;
}
```

### 3. Mixins: Arguments

Mixins also have the ability to take in a value.

An *argument*, or parameter, is a value passed to the mixin that will be used inside the mixin, such as `$visibility` in this example:

```scss
@mixin backface-visibility($visibility) {
  backface-visibility: $visibility;
  -webkit-backface-visibility: $visibility;
  -moz-backface-visibility: $visibility;
  -ms-backface-visibility: $visibility;
  -o-backface-visibility: $visibility;
}
```

In fact, **you should only ever use a mixin if it takes an argument**. 

The syntax to pass in a value is as follows:

```scss
@include backface-visibility(hidden);
```

In the code above, `hidden` is passed in to the`backface-visibility` mixin, where it will be assigned as the value of its argument,`$visibility`.

### 4. Default Value Arguments

Mixin arguments can be assigned a *default value* in the mixin definition by using a special notation.

A default value is assigned to the argument if no value is passed in when the mixin is included. Defining a default value for each argument is optional.

The notation is as follows:

```scss
@mixin backface-visibility($visibility: hidden) {
   backface-visibility: $visibility;
  -webkit-backface-visibility: $visibility;
  -moz-backface-visibility: $visibility;
  -ms-backface-visibility: $visibility;
  -o-backface-visibility: $visibility;
}
```

In the example above, if no value is passed in when `backface-visibility` is included,`hidden` would be assigned to all properties.

### 5. Mixin Facts

In general, here are 5 important facts about arguments and mixins:

1. Mixins can take multiple arguments.
2. Sass allows you to explicitly define each argument in your `@include` statement.
3. When values are explicitly specified you can send them out of order.
4. If a mixin definition has a combination of arguments with and without a default value, you should define the ones with no default value first.
5. Mixins can be nested.

Here are some concrete examples of the rules:

```scss
@mixin dashed-border($width, $color: #FFF) {
  border: {
     color: $color;
     width: $width;
     style: dashed;
  }
}

span { //only passes non-default argument
    @include dashed-border(3px);
}

p { //passes both arguments
    @include dashed-border(3px, green);
}

div { //passes out of order but explicitly defined
   @include dashed-border(color: purple, width: 5px); 
}
```

In the example above, the color of the border of `span` elements would be white, the border of `paragraph` elements would be green, while the `div` elements would have a thicker purple border.

### 6. List Arguments

Sass allows you to pass in multiple arguments in a list or a map format.

For example, take the multiple properties needed to create the college-ruled stripes in the back of our notecard.

```scss
@mixin stripes($direction, $width-percent, $stripe-color, $stripe-background: #FFF) {
  background: repeating-linear-gradient(
    $direction,
    $stripe-background,
    $stripe-background ($width-percent - 1),
    $stripe-color 1%,
    $stripe-background $width-percent
  );
}
```

In this scenario, it makes sense to create a map with these properties in case we ever want to update or reference them.

```scss
$college-ruled-style: ( 
    direction: to bottom,
    width-percent: 15%,
    stripe-color: blue,
    stripe-background: white
);
```

When we include our mixin, we can then pass in these arguments in a map with the following`...` notation:

```scss
.definition {
      width: 100%;
      height: 100%;
      @include stripes($college-ruled-style...);
 }
```

**Note:** Remember to always prioritize readability over writing less code. This approach is only useful if you find it adds clarity to your codebase.

### 7. String Interpolation

In Sass, **string interpolation** is the process of placing a variable string in the middle of two other strings.

In a mixin context, interpolation is handy when you want to make use of variables in selectors or file names. The notation is as follows:

```scss
@mixin photo-content($file) {
  content: url(#{$file}.jpg); //string interpolation
  object-fit: cover;
}

//....

.photo { 
  @include photo-content('titanosaur');
  width: 60%;
  margin: 0px auto; 
  }
```

String interpolation would enable the following CSS:

```css
.photo { 
  content: url(titanosaur.jpg);
  width: 60%;
  margin: 0px auto; 
}
```

### 8. The & Selector in Mixins

Great job! You've accomplished some fancy styling with mixins. Now it's time to tie in how the `&` selector plays into mixins.

Sass allows `&` selector usage inside of mixins. The flow works much like you think it would:

1. The `&` selector gets assigned the value of the parent at the point where the mixin is included.
2. If there is no parent selector, then the value is null and Sass will throw an error.

```scss
@mixin text-hover($color){
  &:hover {
      color: $color; 
  }
}
```

In the above, the value of the parent selector will be assigned based on the parent at the point where it is invoked.

```scss
  .word { //SCSS: 
    display: block; 
    text-align: center;
    position: relative;
    top: 40%;
    @include text-hover(red);
  }
```

The above will compile to the following CSS:

```css
  .word{ 
    display: block;
    text-align: center;
    position: relative;
    top: 40%;
  }
  .word:hover{
    color: red;
  }
```

> Notice that the mixin inherited the parent selector `.word` because that was the parent at the point where the mixin was included.

### Generalizations

- *Mixins* are a powerful tool that allow you to keep your code DRY. Their ability to take in arguments, assign default values to those arguments, and accept said arguments in whatever format is most readable and convenient for you makes the mixin Sass's most popular directive.
- The `&` selector  is a Sass construct that allows for expressive flexibility by referencing the parent selector when working with CSS psuedo elements and classes.
- *String interpolation* is the glue that allows you to insert a string in the middle of another when it is in a variable format. Its applications vary, but the ability to interpolate is especially useful for passing in **file names**.

## Functions and Operations

### 1. Functions in SCSS

**Functions** and **operations** in Sass allow for computing and iterating on styles.

With Sass functions you can:

- Operate on color values
- Iterate on lists and maps
- Apply styles based on conditions
- Assign values that result from math operations

### 2. Arithmetic and Color

As mentioned, Sass specifically comes equipped with functions that make working with colors easier.

The *alpha parameter* in a color like RGBA or HSLA is a mask denoting opacity. It specifies how one color should be merged with another when the two are on top of each other.

- In Sass, the function **`fade-out`** makes a color more transparent by taking a number between 0 and 1 and decreasing opacity, or the alpha channel, by that amount:

```scss
   $color: rgba(39, 39, 39, 0.5);
   $amount: 0.1;
   $color2: fade-out($color, $amount);//rgba(39, 39, 39, 0.4)
```

- The **`fade-in`** color function changes a color by increasing its opacity:

  ```scss
  $color: rgba(55,7,56, 0.5);
  $amount: 0.1;
  $color2: fade-in($color, $amount); //rgba(55,7,56, 0.6)
  ```

- The function **`adjust-hue($color, $degrees)`** changes the hue of a color by taking color and a number of degrees (usually between -360 degrees and 360 degrees), and rotate the color wheel by that amount.

### 3. Color Functions

Sass also allows us to perform mathematical functions to compute measurements— including colors.

Here is how Sass computes colors:

1. The operation is performed on the red, green, and blue components.
2. It computes the answer by operating on every two digits.

```scss
$color: #010203 + #040506;
```

The above would compute piece-wise as follows:

```
01 + 04 = 05
02 + 05 = 07
03 + 06 = 09
```

and compile to:

```css
color: #050709;
```

Sass arithmetic can also compute HSLA and string colors such as `red` and `blue`.

### 4. Arithmetic

The Sass arithmetic operations are:

1. addition `+`
2. subtraction `-`
3. multiplication `*`
4. division `/`, and
5. modulo `%`.

**Note:** Modulo, or `%`, is the remainder in a given division, so "9%2" would be "1".

SCSS arithmetic requires that the units are compatible; for example, you can't multiply pixels by ems.

Also, just like in regular math, multiplying two units together results in squared units:`10px * 10px = 100px * px`.

Since there is no such thing as squared units in CSS, the above would throw an error. You would need to multiply `10px * 10` in order to obtain `100px`.

### 5. Division Can Be Special

In CSS the `/` character can be used as a separator. In Sass, the character is also used in division.

Here are the specific instances `/` counts as division:

1. If the value, or any part of it, is stored in a variable or returned by a function.
2. If the value is surrounded by parentheses, unless those parentheses are outside a list and the value is inside.
3. If the value is used as part of another arithmetic expression.

Here are a few examples:

```scss
width: $variable/6; //division
line-height: (600px)/9; //division
margin-left: 20-10 px/ 2; //division
font-size: 10px/8px; //not division
```

### 6. Each Loops

Beyond the simple math and color transformations we explored in the previous exercises, Sass also allows for more complex functions.

*Each loops* in Sass iterate on each of the values on a list. The syntax is as follows:

```scss
@each $item in $list {
  //some rules and or conditions
}
```

The value of `$item` is dynamically assigned to the value of the object in the list according to its position and the iteration of the loop.

### 7. For Loops

*For loops* in Sass can be used to style **numerous elements** or assigning properties all at once. They work like any for-loop you've seen before.

Sass's for loop syntax is as follows:

```scss
@for $i from $begin through $end {
   //some rules and or conditions
}
```

In the example above:

1. `$i` is just a variable for the index, or position of the element in the list
2. `$begin` and `$end` are placeholders for the start and end points of the loop.
3. The keywords `through` and `to` are interchangeable in Sass

### 8. Conditionals

In Sass, `if()` is a function that can only branch one of two ways based on a condition. You can use it inline, to assign the value of a property:

```scss
width: if( $condition, $value-if-true, $value-if-false);
```

For cases with more than two outcomes, the`@if`, `@else-if`, and `@else` directives allow for more flexibility.

```scss
@mixin deck($suit) {
 @if($suit == hearts || $suit == spades){
   color: blue;
 }
 @else-if($suit == clovers || $suit == diamonds){
   color: red;
 }
 @else{
   //some rule
 }
}
```

The mixin above is a good example for how we would want to handle the coloring of a deck of cards based on a suit condition.

### Generalizations

- **Functions** in Sass allow for an easier way to style pages, work with colors, and iterate on DOM elements.
- Having both **for loops** and **each loops**gives the programmer different formats to iterate on both lists and maps.
- The introduction of **conditional statements** allows you to create logic-based styling rules using SCSS.

There are other native Sass functions available to use, and you can even make your own custom functions if you have a good foundation in Ruby, check out more information [here](http://sass-lang.com/documentation/Sass/Script/Functions.html).

## Sustainable SCSS

### 1. Sass Structure

![Sass Structure](https://s3.amazonaws.com/codecademy-content/courses/Sass/sass_structure.svg)

Here we have an example of a well-organized Sass file structure. Notice how the file structure makes it easy to think of the functionality of each component, facilitating the action of finding and updating files.

### 2. @Import in SCSS

In addition to having a solid file structure, a big part of staying organized is splitting up the logic into smaller manageable components.

Sass extends the existing CSS `@import` rule to allow including other SCSS and Sass files.

- Typically, all imported SCSS files are imported into a main SCSS file which is then combined to make a single CSS output file.
- The main/global SCSS file has access to any variables or mixins defined in its imported files. The `@import` command takes a filename to import.

By default, `@import` looks for a Sass file in the same or otherwise specified directory but there are a few circumstances where it will behave just like a CSS `@import` rule:

- If the file’s extension is **.css**.
- If the filename begins with http://.
- If the filename is a url().
- If the `@import` has any media queries.

In addition to keeping code organized, importing files can also save you from repeating code. For example, if multiple SCSS files reference the same variables, importing a file with variables partial would save the trouble of redefining them each time.

### 3. Organize with Partials

*Partials* in Sass are the files you split up to organize specific functionality in the codebase.

- They use a `_` prefix notation in the file name that tells Sass to hold off on compiling the file individually and instead import it.

```
_filename.scss
```

- To import this partial into the main file - or the file that encapsulates the important rules and the bulk of the project styles - omit the underscore.

For example, to import a file named**_variables.scss**, add the following line of code:

```scss
  @import "variables";
```

The global file imports all the components and centralizes the logic.

### 4. @Extend

Many times, when styling elements, we want the styles of one class to be applied to another in addition to its own individual styles, so the traditional approach is to give the element both classes.

```html
<span class="lemonade"></span>

<span class="lemonade strawberry"></span>
```

This is a potential bug in maintainability because then both classes always have to be included in the HTML in order for the styles to be applied.

Enter Sass's `@extend`. All we have to do is make our strawberry class extend `.lemonade`and we will no longer have this dilemma.

```css
.lemonade {
  border: 1px yellow;
  background-color: #fdd;
}
.strawberry {
  @extend .lemonade;
  border-color: pink;
}
```

If you observe CSS output, you can see how `@extend` is working to apply the `.lemonade` rules to `.strawberry`:

```scss
.lemonade, .strawberry {
  border: 1px yellow;
  background-color: #fdd;
}

.strawberry {
  @extend .lemonade;
  border-color: pink;
}
```

If we think of `.lemonade` as the extendee, and of `.strawberry` as the extender, we can then think of Sass appending the extender selector to the rule declarations in the extendee definition.

This makes it easy to maintain HTML code by removing the need to have multiple classes on an element.

### 5. %Placeholders

Sometimes, you may create classes solely for the purpose of extending them and never actually use them inside your HTML.

Sass anticipated this and allows for a special type of selector called a *placeholder*, which behaves just like a class or id selector, but use the `%` notation instead of `#` or `.`

*Placeholders* prevent rules from being rendered to CSS on their own and only become active once they are extended anywhere an id or class could be extended.

```scss
 a%drink {
    font-size: 2em;
    background-color: $lemon-yellow;
 }

 .lemonade {
  @extend %drink;
  //more rules
 }
```

would translate to

```css
  a.lemonade {
    font-size: 2em;
    background-color: $lemon-yellow;
 }

.lemonade {
  //more rules
}
```

Placeholders are a nice way to consolidate rules that never actually get used on their own in the HTML.

### 6. @Extend vs @Mixin

Sweet! Recall that mixins, unlike extended selectors, insert the code inside the selector's rules wherever they are included, only including "original" code if they are assigning a new value to the rule's properties via an argument.

Let's look at the `@mixin` and `@extend`constructs closely and compare output:

```scss
@mixin no-variable {
  font-size: 12px;
  color: #FFF;
  opacity: .9;
}

%placeholder {
  font-size: 12px;
  color: #FFF;
  opacity: .9;
}

span {
  @extend %placeholder;
}

div {
  @extend %placeholder;
}

p {
  @include no-variable;
}

h1 {
  @include no-variable;
}
```

would compile to:

```css
span, div{
  font-size: 12px;
  color: #FFF;
  opacity: .9;
}

p {
  font-size: 12px;
  color: #FFF;
  opacity: .9;
  //rules specific to ps
}

h1 {
  font-size: 12px;
  color: #FFF;
  opacity: .9;
  //rules specific to ps
}
```

We can clearly see extending results in way cleaner and more efficient output with as little repetition as possible.

As a general rule of thumb, you should

- Try to only create mixins that take in an argument, otherwise you should extend.
- Always look at your CSS output to make sure your extend is behaving as you intended.

### Generalizations

- **Sustainability** is key in Sass, planning out the structure of your files and sticking to naming conventions for both variables, mixins, and selectors can reduce complexity.
- Understanding **CSS output** is also essential to writing sustainable SCSS. In order to make the best choices about what functions and directives to use, it is important to first understand how this will translate in CSS.
- Mixins should only be used if they take in an argument, otherwise, you should **extend the selector's rules,** whether it be a class, id, or placeholder.

## More Info

[Learn Sass](https://www.codecademy.com/learn/learn-sass)
