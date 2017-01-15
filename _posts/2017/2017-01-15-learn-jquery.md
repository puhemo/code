---
title: "Learn jQuery"
date: 2017-01-15
modified: 2017-01-15
published: true
categories:
  - jQuery
tags:
  - HTML
  - CSS
  -  jQuery
excerpt: |
    jQuery is a **library**, or set of helpful add-ons, to the **JavaScript **programming language.
---

* TOC
{:toc}

## Introduction to jQuery

###1. The Document Object Model

To get the most out of jQuery, we should review how an HTML page is put together.

An HTML document is structured according to the **Document Object Model**, or **DOM**. It's by interacting with the DOM that jQuery is able to access and modify HTML.

The DOM consists of every element on the page, laid out in a hierarchical way that reflects the way the HTML document is ordered. Just as with an HTML document, elements in the DOM can have parents, children, and siblings.

### 2. What is jQuery?

jQuery is a **library**, or set of helpful add-ons, to the **JavaScript **programming language. It may seem counterintuitive to learn how to use a library before learning the actual language, but there are a few good reasons for this.

1. It takes a while to become comfortable with JavaScript, and it's trickier to manipulate HTML elements directly with JavaScript than with jQuery. In order to help you build awesome websites faster, we're starting you off with jQuery.
2. jQuery provides a simple interface for the underlying JavaScript. It's easier for many users to learn jQuery first, then dive into the nitty-gritty JavaScript details later.
3. jQuery is much better at giving you immediate, visual results than regular JavaScript. 

### 3. Linking Your HTML and JavaScript Files

Great! Now we need to link our HTML page to our jQuery script so our jQuery magic will affect our HTML.

Just like we need a ` <link>` tag to connect our HTML and CSS, we need a `<script>` tag to connect our HTML and jQuery. The tag looks like this:

```html
<script type="text/javascript" src="script.js"></script>
```

Note that the `<script>` tag is **not** self-closing; it requires a closing `</script>` tag.

### 4. Getting Started

We'll need to start up our jQuery magic using the `$(document).ready();` syntax you've seen. It works like this:

- `$()` says, "hey, jQuery things are about to happen!"
- Putting `document` between the parentheses tells us that we're about to work our magic on the HTML`document` itself.
- `.ready();` is a **function**, or basic action, in jQuery. It says "hey, I'm going to do stuff as soon as the HTML document is ready!"
- Whatever goes in `.ready()`'s parentheses is the jQuery **event** that occurs as soon as the HTML document is ready.

So,

```javascript
$(document).ready(something);
```

says: "when the HTML document is ready, do `something`!" (We'll show you how to replace `something` with an action in the next exercise.)

Note that `.ready();` ends with a semicolon. This tells jQuery that you're done giving it a command.

### 5. The Functional Approach

Remember, when we say "function," you can think "action." Functions are the basic unit of doing work in jQuery.

For this reason, jQuery includes a`function` keyword. The syntax looks like this:

```javascript
function(){
    jQuery magic;
}
```

If we add our function inside our`.ready()`, jQuery will run the code in our function as soon as the HTML document loads. The syntax would then look like this:

```javascript
$(document).ready(function() {
    jQuery magic;
});
```

Remember, we end our jQuery statements with a semicolon.

## jQuery Functions and Selectors

### 1. $(document).ready

**Functions** are the basic unit of action in jQuery. The main entry point of most jQuery applications is a block of code that looks like this:

```javascript
$(document).ready(function() {
    Do something
});
```

Let's go through it bit by bit.

- `$(document)` is a jQuery object. The`$()` is actually a function in disguise; it turns the `document` into a jQuery object.
- `.ready()` is a type of function; you can think of it as sort of a helper that runs the code inside its parentheses as soon as the HTML document is ready.
- `function(){}` is the action that`.ready()` will perform as soon as the HTML document is loaded. (In the above example, the `Do something`placeholder is where those actions would go.)

### 2. Functions Explained

A function is made up of three parts: the `function` keyword, any inputs that function takes (they go between the`()`s and are separated by commas if there are more than one), and whatever actions the function should perform (these go between the `{}`s). The general form is:

```javascript
function(input1, input2, etc) {
    Do a thing
    Do another thing
    Do yet another thing!
}
```

One of the nice things about jQuery is that you can give a function just about anything as an input—even another function! That's why `.ready()` can take`function` between its parentheses; it's taking a function as input.

### 3. Variables

Variables are a place for us to store information for use at a later time. Variables can hold any type of information you work with, so just think of them as containers.

The single `=` sign is used to **assign** values. For instance, in jQuery, you can write

```javascript
var lucky = 7;
var name = "Codecademy";
var $p = $('p');
```

Our first variable contains a number, 7, while the second variable contains some text, "Codecademy". Our 3rd variable stores the result of a jQuery selector `$('p')` in the **variable** `$p` . As you can see, this is just a handy way to save this information for later.

Why would we do this? Well, up until now we haven't had to modify anything more than once. If we wanted to change the webpage based on new information, we would need to store that information in variables. Maybe you want to create a loading page and have it vanish as you receive that information. It'd be a good idea to use variables.

### 4. `$p vs $('p')`

You probably noticed that we used both `$` and `$()` in the last exercise:

```javascript
var $p = $('p');
```

There's a subtle difference between the two.

`$p` is just a variable name. There is *no* magic associated with the `$` in `$p`; it's just a convention for saying, "hey, this variable contains a jQuery object." We could call `$p` anything we want:`$paragraph`, `paragraph`, `space_cows`, whatever! It's just helpful for people reading our code to see `$p`, since this is a concise way of saying "hey, there's a `'p'` jQuery object in here."

`$()`, on the other hand, *is* magic. This is the function in disguise that creates jQuery objects. If you're making a jQuery object, you gotta use it!

### 5. Selecting by Class

Recall that we can select classes in CSS by using a dot (`.`). If we have`class="red"` in our HTML, we can target it in CSS with `.red`. In jQuery, all we need to do is put `'.red'` in quotes, and we can pass it to `$()` to make a jQuery object.

### 6. Selecting by ID

If we can select by class, it follows that we can also select by ID. We do this by putting the ID name (in quotes) inside`$()`. Just as we need the `.` for classes, we need the `#` for IDs. We could target `id="header"` like so:

```javascript
$('#header');
```

The semicolon at the end is important—it's how jQuery knows we're done giving it a command. For now, a good rule of thumb is that you should put semicolons at the end of any line that does not end with an open `{`. 

### 7. Flexible Selections

Anything you can target with CSS, you can modify with jQuery. For example, we can apply a `fadeTo()` to a `p` selector like this:

```javascript
$('p').fadeTo('slow', 0);
```

We can apply a `fadeTo()` to an `li` selector like this:

```javascript
$('li').fadeTo('slow', 0);
```

We can apply a `fadeTo()` to both the `p` and `li` selectors like this:

```javascript
$('p, li').fadeTo('slow', 0);
```

This is called a compound selector.

### 8. 'this' is Important!

```javascript
$(document).ready(function() {
    $('div').mouseenter(function() {
        $('div').hide();
    });
});
```

The second line is good: this tells us that when we mouse into a `div`, we should take a certain action. However,`$('div').hide();` won't just hide the`div` you mouse into; it will hide *all* the`div`s on the page. How can we tell jQuery we only want to affect *this* particular `div`?

With `this`, of course!

The `this` keyword refers to the jQuery object you're currently doing something with. Its complete rules are a little tricky, but the important thing to understand is if you use an **event handler** on an element—that's the fancy name for actions like `.click()`and `.mouseenter()`, since they handle jQuery events—you can call the actual **event** that occurs (such as `fadeOut()`) on `$(this)`, and the event will *only* affect the element you're currently doing something with (for example, clicking on or mousing over).

## Modifying HTML Elements

### 1. Creating HTML Elements

Dynamically adding elements to our HTML page is a powerful tool—it lets us modify not only the formatting, but the actual *structure* of our websites in response to a user's actions. For example, when you get a Gchat, each message is actually a new `<div>` being dynamically added to the page. Cool, right?

If you think about it, we've sort of done this already: all we're doing is setting a variable equal to a jQuery object. In this case, however, instead of just having something like:

```javascript
$p = $('p');
```

We'll want to pass in an entire HTML element in quotes:

```javascript
$p = $("<p>I'm a new paragraph!</p>");
```

When we put text in quotes like this, we call it a **string** (as in a "string of characters"). From now on, when we say "string," you can think "text" or "phrase." Strings are always in single or double quotes. 

### 2. Inserting Elements

We can insert our newly created elements using a few jQuery actions.

`.append()` inserts the specified element as the last child of the target element. `.prepend()` inserts the specified element as the *first* child of the target element. If we have a div of class `.info`,

```javascript
$(".info").append("<p>Stuff!</p>");
$(".info").prepend("<p>Stuff!</p>");
```

will add a paragraph containing the text "Stuff!" inside all divs of class`.info`. `.append()` will make the paragraph the last child of each div; `.prepend()` will make the paragraph the first child of each div. 

`.appendTo()` does the same as `.append()`, but it just reverses the order of "what to add" and "where to add it." The code

```javascript
$('<p>Stuff!</p>').appendTo('.info');
```

has the same effect as the `.append()`code above. `.prependTo()` has a similar relationship to `.prepend()`.

### 3. Before and After

We can specify where in the DOM we insert an element with the `.before()` and `.after()` functions. The syntax looks like this:

```javascript
$('target').after('<tag>To add</tag>');
```

Where `'target'` is the element after which you want to add something and the bit between ` <tag>`s is the HTML element you want to add. You can add``s, ``s, or any other valid HTML you like.

### 4. Moving Elements Around

Moving elements around in the DOM is a snap—all we need to do is use the jQuery functions we just learned on existing elements instead of creating new ones.

```javascript
var $paragraph = $("p"); // existing element
$("div").after($paragraph); // Move it!
// Same as:
$("div").after($("p"));
```

1. We can select an element using `$("p")` and assign it to a variable
2. We can move the position in the DOM by using the variable in our `after()` statement

> Note: This does not copy the element from one location to another, it moves the original element effectively saving you from having to delete the original.

### 5. Removing Elements

Adding elements to our HTML documents is great, but without the ability to remove them, our pages can quickly become cluttered. Thankfully, we have two jQuery functions, `.empty()` and `.remove()`, that help us delete content from our pages.

`.empty()` deletes an element's content and *all its descendants*. For instance, if you `.empty()` an `'ol'`, you'll also remove all its `'li'`s and their text.

`.remove()`, not only deletes an element's content, but deletes the element itself.

### 6. Adding and Removing Classes

We don't have to limit ourselves to adding or removing entire elements, though—we can fine-tune our jQuery superpowers to alter classes, CSS, and even the contents of our HTML elements.

Let's start with classes. jQuery includes two functions, `.addClass()` and`.removeClass()`, that can be used to add or remove a class from an element. This is great if, for example, you have a `highlighted` class that you want to apply to an element when clicked.

The syntax looks like this:

```javascript
$('selector').addClass('className');
$('selector').removeClass('className');
```

where `'selector'` is the HTML element you want and `'className'` is the class name you want to add or remove.

> Remember: You aren't selecting anything, you are modifying your element. This means that you do not need `#` or `.` before your class.

### 7. Toggling Classes

What if we want to toggle a class back and forth, though? That is, what if we want jQuery to automatically check to see whether our `#text` is `.highlighted`, so that when we click on it, it adds the class if it isn't there and removes it if it is?

As you probably guessed, jQuery includes a `.toggleClass()` function that does exactly this. If the element it's called on has the class it receives as an input, `.toggleClass()` removes that class; if the target element doesn't have that class, `.toggleClass()` adds it.

### 8. Changing Your Style

What if we want to fine-tune individual CSS property values, though? Remember `style="height:300px; width:300px;"`? jQuery makes it a snap!

Because resizing elements is so common, jQuery has specific `.height()` and `.width()` functions that can be used to change the heights and widths of HTML elements. For instance:

```javascript
    $("div").height("100px");
    $("div").width("50px");
```

would give all `<div>`s on the page a height of 100 pixels and a width of 50 pixels.

jQuery also includes a general-purpose `.css()` function that takes two inputs: the first is the CSS element to alter, and the second is the value to set it to. For example:

```javascript
    $("div").css("background-color","#008800");
```

would give all `<div>`s on the page a green background color. You can modify any element's CSS attributes this way.

### 9. Modifying Content

Finally, we can update the contents of our HTML elements—that is, the bit between the opening and closing tags—using the `.html()` and `.val()`functions.

`.html()` can be used to set the contents of the **first element match it finds**. For instance,

```javascript
$('div').html();
```

will get the HTML contents of the *first* div it finds, and

```javascript
$('div').html("I love jQuery!");
```

will set the contents of the first div it finds to "I love jQuery!"

`.val()` is used to get the value of form elements. For example,

```javascript
$('input:checkbox:checked').val();
```

would get the value of the first checked checkbox that jQuery finds.

## jQuery Events

### 1. Review of jQuery Events

You know a lot about jQuery events already, but it never hurts to review the basics.

The setup almost always looks like this:

```javascript
$(document).ready(function() {
    $('thingToTouch').event(function() {
        $('thingToAffect').effect();
    });
});
```

where "thing to touch" is the HTML element you'll click on, hover over, or otherwise interact with, and "thing to affect" is the HTML element that fades away, changes size, or undergoes some other transformation.

Sometimes these elements are one and the same—you might hover over a `<div>` to change its opacity. Other times, you might interact with a separate element; for example, you might click on a button to resize a `<div>`.

Sometimes if you want an effect to occur right away, without an event like `.click()` or `.hover()`, you'll skip the second line in the above:

```javascript
$(document).ready(function() {
    $('thingToAffect').effect();
});
```

### 2. The .dblclick() Event

We might want to cause a jQuery effect when a user *double* clicks on an element, rather than just single-clicking. We can do this with the`.dblclick()` event handler.

```javascript
$(document).ready(function() {
  $('div').dblclick(function() {
    $(this).fadeOut('fast');
  });
});
```

### 3. Hover

What if you wanted to create an effect when your mouse is on top of an object, then have that effect vanish when your mouse moved away? You might notice this effect in use on many site's navigation bars!

```javascript
$('div').hover(
    function(){
      $(this).addClass('highlight');
   },
   function(){
      $(this).removeClass('highlight');
   }
);
```

1. We first select the element we want to modify `$('div')`
2. Secondly notice that our `hover`effect is able to take two `functions(){}` separated by a comma. The comma is very important!
3. The first `function(){}` we pass will be run when we first mouse over our target. Here we apply a class of`highlight`
4. The second `function(){}` will be called when our mouse leaves the object. This is where we remove the class `highlight`

Your second `function(){}` doesn't have to be the opposite of the first`function(){}`, but it would be very common!

### 4. Let's .focus()!

Another event we can make use of is `.focus()`. We say an element has **focus** when we click on it or tab over to it. If you've ever filled out a form on a web page and seen how each text box lights up when you tab to it or click on it, you've seen focus in action!

The `.focus()` event handler only works on elements that can receive focus—the list of these elements is a bit vague, but HTML elements like `<textarea>`s and  `<input>`s are the usual suspects.

### 5. The .keydown() Event

You're not limited to mouse events in jQuery—you can trigger events using the keyboard, as well!

The `.keydown()` event is triggered whenever a key on the keyboard is pressed. It only works on whatever page element has focus, so you'll need to click on the window containing your div before pressing a key in order for you to see its effects.

Let's go ahead and combine our new event with a new effect: `.animate()`! We'll use this to move an object on the screen whenever we press a key.

The `.animate()` effect takes two inputs: the animation to perform, and the time in which to perform the animation. Here's an example:

```javascript
$(document).ready(function() {
   $('div').animate({left:'+=10px'},500);
});
```

This will take the first div it finds and move it ten pixels to the right. Remember, increasing the distance from the left margin moves something to the right; the `+=` bit is just a shorthand for "take the existing number and add ten to it." In this case, it add ten pixels to the current distance from the left margin.

## jQuery Effects

### 1. Introducing: jQuery UI

All right! Time to blaze new jQuery trails with a new jQuery library: **jQuery UI**.

jQuery UI includes a number of ultra-fancy animations you can use to make your websites do incredible things.

For instance, remember when we lamented that jQuery didn't include a`.blowUp()` effect for our planet Krypton? Well, that's still true. But jQuery UI has an `.effect()` effect, and we are totally going to give it the input `'explode'`.

Note that we've included an extra `<script>` tag in our HTML documents; this is used to include jQuery UI in our webpages. We don't have to do this with regular jQuery, since Codecademy automatically includes it for us.

```html
<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.9.1/jquery-ui.min.js"></script>
```

### 2. .bounce()

Another possible effect is `'bounce'`. We give this as an input to `.effect()`just like `'explode'`, but we add an extra input to tell it how many times to bounce. This code will make our target `'div'` bounce twice in 200 milliseconds:

```javascript
$('div').effect('bounce', {times:2}, 200);
```

### 3. .slide()

Not surprisingly, we do this by calling the `.effect()` effect and passing in `'slide'` as an input.

If you want to see everything jQuery UI can do, you can check out the documentation [here](http://jqueryui.com/)!

### 4. Special Effects

The `.effect()` effect has all kinds of magical goodness in it, but it's not the most amazing thing jQuery UI can do. The library has a number of built-in effects that can make your website look sleek and professional with surprisingly little code.

You can learn more in the [jQuery UI documentation](http://jqueryui.com/)!

### 5. Drag Racing

jQuery UI includes a `.draggable()`function that can make any HTML element draggable—you can click on it and move it anywhere on the page!

### 6. One Resize Fits All

```javascript
$(document).ready(function() {
    $('div').resizable();
})
```

### 7. A Greater Selection

```javascript
$(document).ready(function() {
    $('ol').selectable();
});
```

### 8. Let's Sort Things Out

```javascript
$(document).ready(function() {
    $('ol').sortable();
});
```

## More Info

[jQuery](https://www.codecademy.com/learn/jquery)    

[How jQuery Works](http://learn.jquery.com/about-jquery/how-jquery-works/)    

[jQuery Selecting Elements](http://learn.jquery.com/using-jquery-core/selecting-elements/)    

[jQuery Selectors Library](http://api.jquery.com/category/selectors/)    

[Manipulating Elements](http://learn.jquery.com/using-jquery-core/manipulating-elements/)    

[DOM Manipulation](http://api.jquery.com/category/manipulation/)    

[jQuery Events (overview)](https://learn.jquery.com/events/)    

[jQuery Events Library](http://api.jquery.com/category/events/)

[jquery Effects + Intro](http://learn.jquery.com/effects/)    

[jQuery Effects Library](http://api.jquery.com/category/effects/)







