# Learn HTML & CSS: Part I

## HTML Fundamentals

### 1. What is HTML?

HTML is the language used to create the web pages you visit everyday. It provides a logical way to structure content for web pages.

Let's analyze the acronym "HTML", as it contains a lot of useful information. HTML stands for **H**yper**T**ext **M**arkup **L**anguage.

A [markup language](https://en.wikipedia.org/wiki/Markup_language) is a computer language that defines the **structure** and **presentation** of raw text. Markup languages work by surrounding raw text with information the computer can interpret, "marking it up" for processing.

[HyperText](https://en.wikipedia.org/wiki/Hypertext) is text displayed on a computer or device that provides access to other text through links, also known as “hyperlinks”. 

### 2. !DOCTYPE

A [web browser](https://en.wikipedia.org/wiki/Web_browser) must know what language a document is written in before they can process the contents of the document.

You can let web browsers know that you are using the HTML language by starting your HTML document with a *document type declaration*.

The declaration is the following:

```html
<!DOCTYPE html>
```

This declaration is an instruction. It tells the browser what type of document to expect, along with what version of HTML is being used in the document. **`<!DOCTYPE html>` must be the first line of code in all of your HTML documents.**

**Note:** If you don't use the doctype declaration, your HTML code will likely still work, however, it's risky. Right now, the browser will correctly assume that you are using HTML5, as HTML5 is the current standard. In the future, however, a new standard will override HTML5. Future browsers may assume you're using a different, newer standard, in which case your document will be interpreted incorrectly. To make sure your document is forever interpreted correctly, always include `<!DOCTYPE html>` at the very beginning of your HTML documents.

### 3. Preparing for HTML

The `<!DOCTYPE html>` declaration is only the beginning, however. It only tells the browser that you plan on using HTML in the document, it doesn't actually add any HTML structure or content.

To begin adding HTML structure and content, we *must* first add opening and closing `<html>` *tags*, like so:

```html
<!DOCTYPE html>
<html>

</html>
```

Anything between `<html>` and `</html>` will be considered HTML code. Without these tags, it's possible that browsers could incorrectly interpret your HTML code and present HTML content in unexpected ways.

### 4. HTML Anatomy

![HTML Anatomy](https://s3.amazonaws.com/codecademy-content/courses/web-101/htmlcss1-diagram__htmlanatomy.svg)

Before we move forward, let's standardize some vocabulary we'll use as you learn HTML. Here are some of the terms you'll see used in this course:

1. **Angle brackets** - In HTML, the characters `<` and `>`are known as angle brackets.
2. HTML element (or simply, element) - HTML code that lives inside of angle brackets.
3. **Opening tag** - the first, or opening, HTML tag used to start an HTML element.
4. **Closing tag** - the second, or closing, HTML tag used to end an HTML element. Closing tags have a forward slash (`/`) inside of them.

> With the exception of a few HTML elements, most elements consist of an opening and closing tag.

In the following example, there is one paragraph *element*, made up of one *opening tag* (`<p>`) and one *closing tag* (`</p>`):

```html
<p>Hello there!</p>
```

### 5. The Head

So far, you've declared to the browser the type of document it can expect (an HTML document) and added the HTML element (`<html>`) that will contain the rest of your code. Let's also give the browser some information about the page. We can do this by adding a `<head>`element.

The `<head>` element will **contain information about the page** that isn't displayed directly on the actual web page.

```html
<!DOCTYPE html>
<html>
  <head>

  </head>
</html>
```

###  6. Page Titles

What kind of information about the web page can the `<head>` element contain?

The browser displays the title of the page because the title can be specified directly inside of the `<title>`element, by using a `<title>` element.

```html
<!DOCTYPE html>
<html>
  <head>
    <title>My Coding Journal</title>
  </head>
</html>
```

If we were to open a file containing the HTML code in the example above, the browser would display the words `My Coding Journal` in the title bar (or in the tab's title).

![title](https://s3.amazonaws.com/codecademy-content/courses/web-101/htmlcss1-diagram__sitetitle.svg)

### 8. The Body

We've added some HTML, but still haven't seen any results in the web browser to the right. Why is that?

Before we can add content that a browser will display, we have to add a *body* to the HTML file. Once the file has a body, many different types of content can be added within the body, like text, images, buttons, and much more.

```html
<!DOCTYPE html>
<html>
  <head>
    <title>I'm Learning To Code!</title>
  </head>
  <body>

  </body>
</html>
```

### Generalizations

1. The `<!DOCTYPE html>` declaration should always be the first line of code in your HTML files.
2. The `<html>` element will contain all of your HTML code.
3. Information about the web page, like the title, belongs within the `<head>` of the page.
4. You can add a title to your web page by using the `<title>` element, inside of the head.
5. Code for visible HTML content will be placed inside of the `<body>` element.

## Common HTML Elements

### 1. Headings

Headings in HTML can be likened to headings in other types of media. For example, in newspapers, large headings are typically used to capture a reader's attention. Other times, headings are used to describe content, like the title of a movie or an educational article.

HTML follows a similar pattern. In HTML, there are six different *headings*, or *heading elements*. Headings can be used for a variety of purposes, like titling sections, articles, or other forms of content.

The following is the list of heading elements available in HTML. They are ordered from largest to smallest in size.

1. `<h1>` - used for main headings, all other smaller headings are used for subheadings.
2. `<h2>`
3. `<h3>`
4. `<h4>`
5. `<h5>`
6. `<h6>`

The following example code uses a headline intended to capture a reader's attention. It uses the largest heading available, the main heading element:

```html
<h1>BREAKING NEWS</h1>
```

### 2. Paragraphs

Often times, headings are meant to emphasize or enlarge only a few words.

If you want to add content in paragraph format, you can add a *paragraph* using the paragraph element `<p>`.

```html
<p>The Nile River is the longest river in the world, measuring over 6,850 kilometers long (approximately 4,260 miles). It flows through eleven countries, including Tanzania, Uganda, Rwanda, Burundi, Congo-Kinshasa, Kenya, Ethiopia, Eritrea, South Sudan, Sudan, and Egypt.</p>
```

Paragraphs are great for expanding the amount of content (text) on your web page. As you begin to add more text to your web page, however, keep in mind that large amounts of text in paragraph format can overwhelm web page visitors. For example, if multiple paragraphs on your web page each contain large amounts of text, your web page could become difficult to consume.

### 3. Unordered Lists

Often times, it's better to display certain types of content in an easy-to-read list.

In HTML, you can use the *unordered list* for text you decide to format in bullet points. An unordered list outlines individual *list items* with a bullet point. You've probably used an unordered list when writing down a grocery list or school supplies list.

To create a unordered list using HTML, you can use the `<ul>` element. The `<ul>` element, however, cannot hold raw text and cannot automatically format raw text with bullet points. Individual list items must be added to the unordered list using the `<li>` element.

```html
<ul>
  <li>Limes</li>
  <li>Tortillas</li>
  <li>Chicken</li>
</ul>
```

In the example above, the list was created using the `<ul>` element and all individual list items were added using `<li>` elements.

### 4. Ordered Lists

Ordered lists are like unordered lists, except that each list item is numbered. You can create the ordered list with the `<ol>` element and then add individual list items to the list using `li` elements.

```html
<ol>
  <li>Preheat the oven to 350 degrees.</li>
  <li>Mix whole wheat flour, baking soda, and salt.</li>
  <li>Cream the butter, sugar in separate bowl.</li>
  <li>Add eggs and vanilla extract to bowl.</li>
</ol>
```

### 5. Links

You can add links to a web page by adding an anchor element `<a>` and including the text of the link in between the opening and closing tags.

```html
<a>This Is A Link To Wikipedia</a>
```

Wait a minute! Technically, the link in the example above is incomplete. How exactly is the link above supposed to work if there is no [URL](https://www.codecademy.com/courses/learn-html-css/lessons/common-elements/exercises/links?action=lesson_resume&link_content_target=interstitial_lesson#) that will lead users to the actual Wikipedia page?

The anchor element in the example above is incomplete without the **`href`** *attribute*.

**Attributes** provide even more information about an element's content. They live directly inside of the opening tag of an element. Attributes are made up of the following two parts:

1. The *name* of the attribute.
2. The *value* of the attribute.

For anchor elements, the name of the attribute is `href` and its value must be set to the URL of the page you'd like the user to visit.

```python
<a href="https://www.wikipedia.org/">This Is A Link To Wikipedia</a>
```

The **`target`** attribute specifies that a link should open in a **new window**. 

For a link to open in a new window, the `target`attribute requires a value of `_blank`. The `target`attribute can be added directly to the opening tag of the anchor element, just like the `href` attribute.

```html
<a href="https://en.wikipedia.org/wiki/Brown_bear" target="_blank">The Brown Bear</a>
```

In the example above, the link would read `The Brown Bear` and open up the relevant Wikipedia page in a new window.

### 6. Images

The `<img>` element lets you add images to a web page. This element is special because it does not have a closing tag, it only has an opening tag. This is because the `<img>` element is a *self-closing* element.

```html
<img src="https://www.example.com/picture.jpg" />
```

**Note** that the `<img>` element has a required attribute called **`src`**, which is similar to the `href` attribute in links. In this case, the value of `src` must be the URL of the image. Also **note** that the end of the `<img>`element has a forward slash `/`. This is required for a self-closing element.

HTML helps support visually impaired users with the **`alt`** attribute.

The `alt` attribute is applied specifically to the `<img>` element. The value of `alt` should be a description of the image.

```html
<img src="#" alt="A field of yellow sunflowers" />
```

The `alt` attributes also serves the following purposes:

1. If an image fails to load on a web page, a user can mouse over the area originally intended for the image and read a brief description of the image. This is made possible by the description you provide in the `alt` attribute.
2. Visually impaired users often browse the web with the aid of of screen reading software. When you include the `alt` attribute, the screen reading software can read the image's description outloud to the visually impaired user.

**Note**: If the image on the web page is not one that conveys any meaningful information to a user (visually impaired or otherwise), the `alt` attribute should not be used.

### 7. Linking At Will

HTML allows you to turn nearly any element into a link by wrapping that element with an anchor element. With this technique, it's possible to turn images into links by simply wrapping the `<img>`element with an `<a>` element.

```html
<a href="https://en.wikipedia.org/wiki/Opuntia" target="_blank"><img src="#" alt="A red prickly pear fruit"/></a>
```

In the example above, an image of a prickly pear has been turned into a link by wrapping the outside of the `<img>` element with an `<a>` element.

### 8. Line Breaks

 If you *are* interested in modifying the spacing in the browser, you can use HTML's *line break* element: `<br />`.

The line break element is one self-closing tag. You can use it anywhere within your HTML code and a line break will be shown in the browser.

```html
Shall I compare thee to a summer's day?<br />Thou art more lovely and more temperate
```

The code in the example above will result in an output that looks like the following:

```
Shall I compare thee to a summer's day?
Thou art more lovely and more temperate
```

**Note**: Line breaks are not the standard way of manipulating the positioning of HTML elements, but it's likely that you'll come across them every now and then.

### 9. Indentation

Whitespace makes code easier to read by increasing (or decreasing) the spacing between lines of code. To make the structure of code easier to read, web developers often use *indentation*.

The World Wide Web Consortium ([W3C](https://en.wikipedia.org/wiki/World_Wide_Web_Consortium)) is responsible for maintaining the style standards of HTML. At the time of writing, the W3C recommends **2 spaces** of indentation when writing HTML code. Indentation is intended for elements nested within other elements.

```html
<ul>
  <li>Violin</li>
  <li>Viola</li>
  <li>Cello</li>
  <li>Bass</li>
<ul>
```

In the example above, the list items are indented with two spaces. The spaces are inserted using the spacebar on your keyboard. Unless your [text editor](https://en.wikipedia.org/wiki/Text_editor) has been configured properly, the "TAB" key on your keyboard should *not* be used for indentation.

### 10. Comments

HTML files also allow you to add *comments* to your code.

Comments begin with `<!--` and end with `-->`. Any characters in between will be treated as a comment.

```python
<!-- This is a comment that the browser will not display. -->
```

Including comments in your code is helpful for many reasons:

1. They help you (and others) understand your code if you decide to come back and review it at a much later date.
2. They allow you to experiment with new code, without having to delete old code.

```python
<!-- Favorite Films Section -->
<p>The following is a list of my favorite films:</p>
```

In the example above, the comment is used to denote that the following text makes up a particular section of the page.

```python
<!-- <a href="#" target="_blank>Codecademy</a> -->
```

In the example above, a valid HTML element (an anchor element) has been "commented out." This practice is useful when you want to experiment with new code without having to delete old code.

### Generalizations

1. You can add headings of different sizes using the different headings elements: `<h1>` through `<h6>`.
2. Paragraphs are added with the `<p>` element.
3. Unordered lists are created with the `<ul>` element and list items are added using the `<li>` element.
4. Ordered lists are created with the `<ol>` element and list items are added using the `<li>` element.
5. You can add links to your web page using the `<a>` element - don't forget the `href` attribute!
6. Images can be added with the `<img>` element - don't forget the `src` attribute!
7. Images help support visually impaired users when `<img>` elements include the `alt` attribute.
8. You can turn anything into a link by wrapping it with an `<a>`  element.
9. White space in the HTML file does *not* affect the positioning of elements in the browser.
10. The W3C recommends **2 spaces** of indentation for nested HTML elements.
11. Comments are used to take notes inside of an HTML file. You can add a comment with `<!-- This is a comment -->`.

## The CSS Setup

### 1. What is CSS?

CSS, or **C**ascading **S**tyle **S**heets, is a language that web developers use to *style* the HTML content on a web page. If you're interested in modifying colors, font types, font sizes, shadows, images, element positioning, and more, CSS is the tool for the job!

### 2. `<style>`

Although CSS is a different language than HTML, it's possible to write CSS code directly within an HTML file. This is possible because of the `<style>` element.

The `<style>` element allows you to write CSS code between its opening and closing tags. To use the `<style>` element, it must be placed inside of the head.

```html
<head>
  <style>

  </style>
</head>
```

Once `<style>` is placed in the web page's head, we can begin writing CSS code.

```html
<head>
  <style>
    h2 {
    font-family: Arial;
    }
  </style>
</head>
```

Don't worry about the CSS code in the example above just yet, you will learn more about the details of CSS code in later lessons.

### 3. Structure vs Style

Although the `<style>` element allows you to write CSS code within HTML files, this mixture of HTML and CSS can result in code that is difficult to read and maintain.

It's common for developers to add substantial amounts of custom CSS styling to a web page. When all of that CSS code is placed within a `<style>` element in an HTML file, you risk the following two things:

1. Creating a large HTML file that is difficult to read and maintain (by you and other developers). Overall, this can result in an inefficient workflow.
2. Maintaining a clear distinction between web page structure (HTML) and web page styling (CSS).

### 4. The .css file

Fortunately, the following solution will help you avoid creating large HTML files that mix in CSS code: a CSS file!

HTML files are meant to contain only HTML code. Similarly, CSS files are meant to contain only CSS code. You can create a CSS file by using the **.css** file name extension, like so: **style.css**

With a CSS file, you can write all the CSS code needed to style a page without having to sacrifice the readability and maintainability of your HTML file.

### 5. Linking the CSS File

When HTML and CSS code are in separate files, the HTML file must know exactly where the CSS code is kept, otherwise, the styling can't be applied the web page. In order to apply the styling to the web page, we'll have to *link* the HTML file and the CSS file together.

You can use the **`<link>`** element to link the HTML and CSS files together. **The `<link>` element must be placed within the head of the HTML file.** It is a self-closing tag and requires the following three attributes:

1. `href` - like the anchor element, the value of this attribute must be the address, or path, to the CSS file.
2. `type` - this attribute describes the type of document that you are linking to (in this case, a CSS file). The value of this attribute should be set to `text/css`.
3. `rel` - this attribute describes the relationship between the HTML file and the CSS file. Because you are linking to a stylesheet, the value should be set to `stylesheet`.

When linking an HTML file and a CSS file together, the `<link>` element will look like the following:

```html
<link href="https://www.codecademy.com/stylesheets/style.css" type="text/css" rel="stylesheet">
```

Note that in the example above the path to the stylesheet is a URL:

```
https://www.codecademy.com/stylesheets/style.css
```

Specifying the path to the stylesheet using a URL is one way of linking a stylesheet.

If the CSS file is stored in the same [directory](https://en.wikipedia.org/wiki/Directory_(computing)) as your HTML file, then you can specify a [relative path](https://en.wikipedia.org/wiki/Path_(computing)#Absolute_and_relative_paths) instead of a URL, like so:

```html
<link href="/style.css" type="text/css" rel="stylesheet">
```

**Using a relative path is very common way of linking a stylesheet.**

### Generalizations

1. HTML and CSS are kept in separate files in order to keep code maintainable and readable, as well as keep structure separate from styling.
2. The `<link>` element allows you to write CSS code within an HTML file.
3. A CSS stylesheet can be linked to an HTML file using the `<link>` element, which requires three attributes:
    * `href` - set equal to the path of the CSS file.
    * `type` - set equal to `text/css`.
    * `rel` - set equal to `stylesheet`.

## Basic CSS Structure & Syntax

### 1. Element Selectors

To style an HTML element using CSS, you must first *select* that element in the CSS file. For example, to style a `<p>` element, the syntax to select it using CSS is:

```css
p {

}
```

In the example above, all paragraph elements are selected using a CSS *selector*. The selector (in this case) is `p`. Note that the CSS selector essentially matches the HTML tag for that element, but without the angle brackets.

**Note:** The `p` selector in the example above will select *all* `<p>` elements on the web page.

### 2. CSS Declarations: Anatomy

![](https://s3.amazonaws.com/codecademy-content/courses/web-101/htmlcss1-diagram__cssdeclaration.svg)

It's not enough to simply select an HTML element in a CSS file. To actually style the element, you need to specify two things inside the body of the selector:

1. Property - the property you'd like to style of that element (i.e., size, color, etc.).
2. Value - the value of the property (i.e., `18px` for size, Blue for color, etc.).

```css
h1 {
  color: Blue;
}
```

In the example above, the `<h1>` element has been selected. Inside of the selector's body, the heading's`color` property is set to a value of `Blue`. The heading will now appear the color blue in the browser.

The line `color: Blue;` is referred to CSS *declaration*. A CSS declaration consists of a property and a value. Note that a semicolon (`;`) ends all declarations.

Finally, the entire snippet of code in the example above is known as a CSS *rule*. A CSS rule consists of the selector and all declarations inside of the selector.

### 3. Multiple Element Selectors

You can select multiple elements at once so that you can save time styling a shared property.

```css
h1, h2, p {
  color: Green;
}
```

In the example above, the `<h1>` heading, the `<h2>` heading, and the paragraph have all been styled to appear `Green` using a *multiple element selector*. A multiple element selector can save you time when you want to style the same property across many elements.

### 4. The Universal Selector

There's a special selector that can instantly select every single element on the web page: the *universal selector*.

```css
* {
  font-family: Arial;
}
```

In the example above, the universal selector, `*`, is used to select every element on the page and set the font to `Arial`.

What makes the universal selector so special? When all elements on a web page require the same styling, it's often more efficient to set that styling using the universal selector. Afterwards, you can modify (or remove) that styling for specific elements that don't require it.

### 5. Indentation & Spacing

Just like HTML, CSS follows certain best practices for spacing and indentation.

```css
h1 {
  color: blue;
}

p {
  color: red;
}
```

1. One space should be used between the selector and the opening curly brace (`{`).
2. No extra spaces should exist between opening and closing curly braces (`{` and `}`) and CSS declarations (as in the example above).
3. Two spaces of indentation should be used for CSS declarations.
4. One line of spacing should exist between CSS rules. In the example above, there is one line of spacing between the CSS rule for the heading and the CSS rule for the paragraph.

CSS files can become lengthy as styling is added to a web page. Proper spacing and indentation helps keep CSS code maintainable and readable for you and other developers.

### 6. Comments

Just like HTML, you can also leave *comments* in your CSS file. CSS comments begin with `/*` and end with `*/`, like so:

```css
/* This is a comment in CSS! */
```

Including comments in your code is helpful for many reasons:

1. They help you (and others) understand your code if you decide to come back and review it at a much later date.
2. They allow you to experiment with new code, without having to delete old code.

```css
/* Paragraph Styling */
p {
  color: Blue;
}
```

In the example above, a comment is used to specify CSS styling for paragraphs.

```css
/*
h1 {
  color: Red;
}
*/
```

In the example above, a valid CSS rule has been "commented out." This practice is useful when you want to experiment with new code without having to delete old code.

### Generalizations

1. A CSS selector targets an HTML element.

2. CSS declarations style HTML elements. Declarations must contain the following two things:

    - property - the property you want to style.
    - value - the value for the property you are styling.

3. CSS declarations must end in a semicolon (`;`)

4. A CSS rule consists of a CSS selector and the declarations inside of the selector.

5. Multiple element selectors can be used to style multiple elements at once.

6. Comments keep code easy to read and allow you to experiment with new code without having to remove old code.

7. CSS follows certain best practices for spacing and indentation:

    - One line of spacing between a selector and the opening curly brace.
    - No spacing between CSS declarations and the opening and closing curly braces of the CSS rule.
    - Two spaces of indentation for CSS declarations.
    - One line of spacing between CSS rules.

## Colors

### 1. Foreground vs Background

Before discussing the specifics of color, it's important to make two distinctions about color. Color can affect the following design aspects:

1. The foreground color
2. The background color

Foreground color is the color that an element appears in. For example, when a heading is styled to appear green, the *foreground color* of the heading has been styled.

Conversely, when a heading is styled so that its background appears yellow, the *background color* of the heading has been styled

In CSS, these two design aspects can be styled with the following two properties:

1. `color` - this property styles an element's foreground color.
2. `background-color` - this property styles an element's background color.

```css
h1 {
  color: Red;
  background-color: Blue;
}
```

In the example above, the text of the heading will appear in red, and the background of the heading will appear blue.

### 2. Named Colors

You've seen CSS examples that use colors like `Red`, `Blue`, or `Cyan`. In CSS, these colors are technically known as *named colors*. There are a total of [147 named colors](http://www.colors.commutercreative.com/grid/).

### 3. RGB Colors

Although named colors provide 147 different options, this is a small amount when you consider the flexibility of CSS. To take advantage of the full spectrum of colors that CSS supports, you have the option of using *RGB colors*.

RGB (Red, Green, Blue) colors offer the option of 16,777,216 possible colors. How is that possible?

RGB colors work by mixing together different amounts of red (R), green (G), and blue (B). Each color (R, G, or B) can take on 1 of a possible 256 values (between 0 and 255). This results in 16,777,216 possible colors.

To use RGB colors, you can use the `rgb()` value when styling a color.

```css
h1 {
  color: rgb(123, 20, 233);
  background-color: rgb(99, 21, 127);
}
```

In the example above, the value of `color` is set to `rgb()`. The three numbers in the parentheses represent the values for R, G, and B, in that order. 

There are many resources on the Internet known as "[color pickers](https://color.adobe.com/create/color-wheel/)" that allow you to view the result of different RGB values before you decide to use a certain color. If you're ever in need of a color picker resource, a quick Google search will yield the results you are looking for.

### 4. Hex Colors

There's an additional way to specify colors in CSS: *hexadecimal color codes*, often referred to as "hex color codes" for short.

Hex color codes also offer 16,777,216 color options, but they follow a different syntax.

When specifying an RGB color mixture, the values are in [base 10](https://en.wikipedia.org/wiki/Decimal). Hex color codes, however, use [base 16](https://en.wikipedia.org/wiki/Hexadecimal), or hexadecimal base (hence the name), to specify color mixtures.

```css
h1 {
  color: #09AA34;
}
```

When read from left to right, each group of two characters responds to a value for red, green and blue, respectively. In the example above, `09` refers to the value for red, `AA` refers to the value for blue, and `34`refers to the value for green. All hex color codes begin with a `#` character.

Is there a difference between RGB values and hex color codes?

Not really. RGB values and hex color codes are different ways to represent the same thing: color. It's possible to convert back and forth between RGB values and hex color codes (color pickers often help with this conversion).

**Note:** When a hex color code is composed of entirely of the same characters, the hex color can be abbreviated, like so:

```css
h1 {
  color: #FFFFFF;
  color: #FFF; /* This is the same color as above */
}

h2 {
  color: #AA33BB;
  color: #A3B; /* This is the same color as above */
}
```

### 5. HSL

The current revision of CSS, CSS3 (at the time of this writing), introduces a new way to specify colors using *HSL colors*.

HSL stands for **H**ue, **S**aturation, and **L**ightness. Specifically, this is what each means:

1. Hue - the technical term that describes what we understand as "color." In HSL, hue is represented on a color wheel. It can take on values between 0 and 360.
2. Saturation - the amount of gray in a given color. In HSL, saturation is specified using a percentage between 0% and 100%. The percentage 0% represents a shade of gray, whereas 100% represents full saturation.
3. Lightness - the amount of white in a given color. Similar to saturation, lightness is specified using a percentage between 0% and 100%. The percentage 0% represents black, whereas 100% represents white. 50% is normal.

You can use HSL colors in your CSS like this:

```css
h1 {
  color: hsl(182, 20%, 50%);
}
```

Notice that using HSL is very similar to using RGB.

**Note:** Because HSL is a part of CSS3, older browsers may not support it. In a later exercise, you'll learn how to work around support issues for colors.

### 6. The Alpha Value: a

You learned that RGB and hex color codes are two different methods of representing the same thing: color. However, there is one feature that RGB colors support that hex color codes do not: opacity.

Opacity is a measure of how transparent a color is. To modify opacity in RGB colors, CSS offers the `rgba()`value. Note the slight difference in `rgb()` and `rgba()`.

The extra `a` character in the `rgba()` value is known as the *alpha value*. It represents the opacity of a color. The alpha value can be a number between 0 or 1, inclusive.

```css
h1 {
  color: rgba(123, 88, 9, 0.5);
}
```

In the example above, the alpha value has been set to `0.5`. This indicates that the color of the heading will be set to 50% of its normal opacity.

**Note:** The alpha value can also be used for HSL colors, using `hsla()`:

```css
h1 {
  color: hsla(239, 45%, 22%, 0.4);
}
```

### 7. Color Declarations

RGB colors, hex color codes, and HSL colors offer web developers an extraordinary amount of color customization options. As these properties become more advanced, however, it's important to keep in mind that not all users browse the Internet with the same browser, let alone the same version of a given browser.

How does this affect web development? Newer revisions of HTML and CSS affect older browsers. Older browsers, over time, will become dated (possibly obsolete) and not be able to support newer CSS features. For example, many older browsers do not support RGBa, HSL, or HSLa.

Because of this, we must include redundant color options in our CSS code that can cater to a wide audience of different browsers.

Specifically, we can add multiple CSS color declarations, just in case a user's browser can't support a certain declaration.

```css
h1 {
  color: rgb(22, 34, 88);
  color: rgba(22, 34, 88, 0.4);
}
```

**In CSS, the latter of multiple declarations takes priority**. In the example above, if the user's browser supports `rgba()`, then that color will be applied to the heading. If it does not, then CSS will use the first `rgb()` color declaration, as a backup.

Using redundant declarations allow you to support as many users as possible across multiple versions of different Internet browsers.

## Generalizations

1. Foreground color refers to the actual color of an element, styled with the `color` property.
2. Background color refers to the color behind an element, styled with the `background-color`property.
3. There are 147 named colors available.
4. RGB and hexadecimal colors offer over 16 million color possibilities.
5. HSL is a new way of defining colors in CSS3.
6. You can modify the opacity of a color with RGBa or HSLa colors.
7. Not all browsers support newer CSS features, like opacity or HSL, so additional declarations should be made to support a wide audience of users.
8. There are many color picker resources available on the Internet to help you select specific colors, as well as provide colors in different formats.

## Fonts

### 1. Font Family

If you've ever used a formatted word processor, chances are that you probably also used a feature that allowed you change the "type of font" you were typing in. The phrase "type of font" refers to the technical term [typeface](https://en.wikipedia.org/wiki/Typeface), or *font family*.

To change the typeface of text on your web page, you can use the **`font-family`** property.

```css
h1 {
  font-family: Garamond;
}
```

In the example above, the font family for all main heading elements has been set to `Garamond`.

When setting typefaces on a web page, keep the following points in mind:

1. The font specified in a stylesheet **must** be installed on a user's computer in order for that font to display when a user visit the web page. 
2. The **default** typeface for all HTML elements is `Times New Roman`. 
3. It's a good practice to **limit** the number of typefaces used on a web page to 2 or 3.
4. When the name of a typeface consists of more than one word, it must be enclosed in double quotes (otherwise it will not be recognized), like so:

```css
h1 {
  font-family: "Courier New";
}
```

### 2. Serif vs Sans-Serif

![img](https://s3.amazonaws.com/codecademy-content/courses/web-101/htmlcss1-diagram__fontanatomy.svg)

The practice of [typography](https://en.wikipedia.org/wiki/Typography) has been around for centuries! Over time, typographers have refined their craft and have developed many different typefaces, which has allowed them, in some cases, to classify them as one of the following two types: *serif* fonts and *sans-serif* fonts.

1. Serif - the letters in these fonts have extra details on the ends of each letter. Examples include fonts like `Times New Roman` or `Georgia`, among others.
2. Sans-Serif - the letters in these fonts do not have extra details on the ends of each letter. Instead, letters have straight, flat edges. Some examples include `Arial` or `Helvetica`.

### 3. Fallback Fonts

Most computers have a small set of typefaces pre-installed. This small set includes serif fonts and sans-serif fonts, like `Times New Roman` and `Arial`, respectively.

When the stylesheet specifies a font not installed on a user's computer, the pre-installed fonts can be used as *fallback fonts* for users.

To use fallback fonts, the following syntax is required:

```css
h1 {
  font-family: Garamond, Times, serif;
}
```

The CSS rule above says: "Use the `Garamond` font for all `<h1>` elements on the web page. If that font is not available, use the `Times` font. If both of those fonts are not available, use any `serif` font pre-installed on the user's computer." The fonts specified after `Garamond`are the fallback fonts.

Fallback fonts help ensure a consistent experience for the diverse audience of users that visit a site.

### 4. More Fonts

Many (but not all) of the new fonts that emerge on a daily basis are being centralized in directories made available for public use.

For example, Google offers [Google Fonts](https://fonts.google.com/), a directory of thousands of open-source fonts that are free to use by anyone.

To use these fonts, you can link to a specific Google Font in your HTML code and use it immediately in your stylesheet. Because the HTML file links directly to the Google Font, a user's browser can display the typeface you specify. This avoids having to determine whether or not that font is installed on a user's computer.

To use a Google Font, you can use a `<link>` element, just like you did for a CSS stylesheet:

```html
<head>
  <link href="https://fonts.googleapis.com/css?family=Raleway" type="text/css" rel="stylesheet" >
</head>
```

In the example above, the `href` attribute is set to the following URL, which was retrieved from Google Fonts:

```
https://fonts.googleapis.com/css?family=Raleway
```

The URL in the example above specifies the `Raleway`typeface from Google Fonts.

You can use the new font just as you would use any other font:

```css
h1 {
  font-family: Raleway, Georgia, serif;
}
```

You now have access to thousands of new, modern, free-to-use fonts!

### 5. Font Size

To change the size of text on your web page, you can use the **`font-size`** property.

```css
p {
  font-size: 18px;
}
```

In the example above, the `font-size` of all paragraphs was set to `18px`. What exactly does `px` mean?

Measurements require units in order for them to be useful (for example kilograms for weight, or miles for distance). Font size also requires a unit of measurement.

There are three units of measurement for font size:

1. `px` - Represents the unit of *pixels*. The display of a computer monitor can be measured in pixels. A pixel is a small point on the display. How small? Most computer monitors have a resolution of 72 pixels per inch, so a pixel represents about 1/72nd of an inch. Pixels are sometimes also referred to as *points*. Pixels are used to set the exact size of an element, in this case, text.

```css
p {
  font-size: 18px;
}
```

2. `em`s - Pronounced just as it looks, "em." **An em is equal to the width of the letter "m".** Ems are a **relative** unit of measurement. They change the size of text relative to the parent element's size of text.

```css
p {
  font-size: 1.3em;
}
```

3. `%` - Percentages are also a **relative** unit of measurement. The default size of text in web browsers is 16 pixels, or `16px`. When percentages are used, they set the size of text relative to this default size. For example, setting the font size to `200%` would be equivalent to setting it to `32px`.

```css
p {
  font-size: 150%;
}
```

![img](https://s3.amazonaws.com/codecademy-content/courses/web-101/htmlcss1-diagram__fontsizings.svg)

### 6. Line Height

Text on a web page must also be easy to read. When text is styled to appear larger, the vertical spacing between lines of text can decrease, creating text that is difficult to read, particularly in paragraphs.

To avoid this problem, you can modify the spacing between lines of text with the `line-height` property.

```css
p {
  line-height: 1.5em;
}
```

When the line height of an element is modified, you are manipulating the *leading* (pronounced "ledding") of the font. When the line height is increased, the spacing between lines of text increases, which can make text easier to read.

The line height can be modified using pixels or ems, but the unit of **ems** is **preferred**, since ems offer a spacing relative to the size of the text on the page.

![img](https://s3.amazonaws.com/codecademy-content/courses/web-101/htmlcss1-diagram__leading.svg)

### 7. Word Spacing

You can also increase the spacing between words in a body of text, technically known as *word spacing*.

To do so, you can use the `word-spacing` property:

```css
h1 {
  word-spacing: 0.3em;
}
```

The **default** amount of space between words is usually **`0.25em`**. In the example above, the word spacing is set to `0.3em`, which represents an increase of only `.05em`in word spacing.

It's **not common** to increase the spacing between words, but it **may** help enhance the readability of **bolded** or **enlarged** text. Note, again, that the **preferred** unit is **ems**.

### 8. Letter Spacing

The technical term for the spacing between letters is the "kerning". The kerning can be adjusted with the `letter-spacing` property in CSS.

```css
h1 {
  letter-spacing: 0.3em;
}
```

Like word spacing, it's **not common** to increase the kerning in text, but **sometimes** it enhances the readability of **uppercase** text.

### 9. Font Weight

In CSS, the `font-weight` property turns bold on or off.

```css
p {
  font-weight: bold;
}
```

In the example above, all paragraphs on the web page would appear bolded.

The `font-weight` property has a second value: `normal`. Why does it exist?

If we wanted *all* text on a web page to appear bolded, we could select all text elements and change their font weight to `bold`. If a certain section of text was required to appear normal, however, we could set the font weight of that particular element to `normal`, essentially "shutting off" bold for that element.

### 10. Font Style

You can also *italicize* words with the `font-style`property.

```css
h3 {
  font-style: italic;
}
```

The `italic` value causes text to appear in italics. The `font-style` property also has a `normal` value.

### 11. Text Transformation

Text can also be styled to appear in either all uppercase or lowercase with the `text-transform` property.

```css
h1 {
  text-transform: uppercase;
}
```

The code in the example above formats all `<h1>` elements to appear in `uppercase`, regardless of the case used for the heading within the HTML code. Alternatively, the `lowercase` value could be used to format text in all lowercase.

Since text can be directly typed in all uppercase or lowercase within an HTML file, what is the point of a CSS rule that allows you to format [letter case](https://en.wikipedia.org/wiki/Letter_case)?

Depending on the type of content a web page displays, it may make sense to always style a specific element in all uppercase or lowercase letters. For example, a website that reports breaking news may decide to format all `<h1>` heading elements such that they always appear in all uppercase, as in the example above. It would also avoid uppercase text in the HTML file, which could make code difficult to read.

### 12. Text Alignment

To move, or align, text, we can use the `text-align`property.

```css
h1 {
  text-align: right;
}
```

The `text-align` property can be set to one of the following three values:

1. `left` - aligns text to the left hand side of the browser.
2. `center` - centers text.
3. `right` - aligns text to the right hand side of the browser.

### Generalizations

1. The `font-family` property changes the typeface of text.
2. Serif fonts have extra details on the ends of each letter. Sans-Serif fonts do not.
3. Fallback fonts are used when a certain font is not installed on a user's computer.
4. Google Fonts provides free fonts that can be used in an HTML file with the `<link>` element.
5. Font size can be specified using pixels, ems, or percentages.
6. The vertical spacing between lines of text can be modified with the `line-spacing` property.
7. The horizontal spacing between words can be modified with the `word-spacing` property.
8. The spacing between letters, the kernel, can be modified with the `letter-spacing` property.
9. Text can appear bold with the `font-weight`property.
10. Text can appear in italics with the `font-style`property.
11. Text can appear in all uppercase or all lowercase with the `text-transform` property.
12. Text can be aligned with the `text-align` property.

## Classes, IDs, & Divs

### 1.  IDs: HTML

With the proper labels, we can style individual HTML elements! Specifically, we can label HTML elements with a unique identifier, or *ID*. We can then style that specific element in the stylesheet.

To label an element with an ID, we can use the `id` attribute on an HTML element.

```css
<h1 id="botswana">Botswana</h1>
```

In the example above, the heading is labeled with an `id` of `botswana`.

What purpose do IDs serve? IDs are intended to label **unique** elements in an HTML file. No two HTML elements should ever share the same ID — that would defeat the purpose of a unique identifier!

### 2. ID Selectors: CSS

To style a specific element labeled with an ID, you can use an *ID selector* in the stylesheet.

```css
#botswana {
  background-color: #56ABFF;
}
```

In the example above, the HTML element with an ID of `botswana` is targeted with the ID selector `#botswana`.

All ID selectors begin with the octothorpe character: `#`. The value of the ID immediately follows the octothorpe. Once you've correctly targeted the element, you can proceed to style it as usual.

### 3. Classes: HTML

IDs are great for labeling unique elements, but IDs have a limitation. Because unique IDs should not be used across multiple HTML elements, they are insufficient for quickly styling elements that should all share a specific style.

CSS offers a solution to this limitation. For multiple elements that should share the same styling, *classes* can be used to label them.

To label an element with a class, we can use the `class`attribute on an HTML element.

```css
<h1 class="science">Scientist Discovers Important Cure</h1>

<h1 class="science">New Study Reveals The Importance of Sleep</h1>
```

In the example above, there are two headings with a class of `science`. Why?

HTML elements are often labeled with class names that reflect the content they represent on the web page. In the example above, perhaps a news company decided that all news headlines about science should be labeled with a class of `science`.

Later, in the stylesheet, all `science` headlines can be quickly styled to have the same styling.

### 4. Class Selectors: CSS

To style elements of the same class, you can use a *class selector* in the stylesheet.

```css
.science {
  font-family: Georgia, Times, serif;
  color: #A3B4C5;
  text-transform: uppercase;
}
```

Class selectors begin with a period (`.`) and are immediately followed by the name of the class. In the example above, all elements with a class of `science`will have their typeface, color, and letter case modified.

As you learn more about web development, you'll notice that it's very common to style groups of elements using classes. In fact, you're more likely to see classes more often than you see IDs. While IDs still play a critical role when you move into languages like JavaScript, classes are by far the most commonly used for styling groups of elements.

The class selector targets *all* elements of a particular class. It's possible, however, for multiple elements on a web page to share a specific styling, but for one of those elements to differ slightly.

For example, a heading and a paragraph (both with a class of `breaking`) may need to share the same typeface, but the paragraph may require a styling better suited for paragraphs, as in the following example.

```css
.breaking {
  font-family: Georgia, Times, serif;
}

p.breaking {
  line-height: 1.3em;
}
```

### 5. Multiple Selectors: CSS

CSS does not limit you to selectors that target a single element or class.

```css
.first, .last {
  font-size: 20px;
}
```

Using a multiple class selector is an efficient way of styling multiple HTML elements.

### 6. Multiple Classes: HTML

It's also possible to label HTML elements with more than one class. How is this functionality useful?

You learned that elements that share a styling (e.g. typeface) are labeled with the same class. When those same elements must also be differentiated, however, labeling with an additional class is helpful.

```html
<h1 class="book domestic">The Way of the Deep</h1>

<h1 class="book foreign">A Night in the Sky</h1>
```

```css
.book {
  font-family: Georgia, serif;
}

.domestic {
  font-color: #0902CC;
}

.foreign {
  font-color: #B097DD;
}
```

To label an HTML element with an additional class, simply include the class within the double quotes, immediately after the first class. HTML elements can be labeled with many classes, but whenever possible, it's best to **limit** an element to **four **classes at most.

### 7. The Div

Classes and IDs are useful for labeling elements, but a disorganized, overuse of classes and IDs can result in an HTML file that is difficult to read. We need a way of organizing the contents of the HTML file. This will help:

1. Keep HTML code easy to read.
2. Group elements that belong together.

HTML offers an element that is the backbone of code organization: the *div*, represented by `<div>` in HTML.

You can think of the div as a box, or container, that groups elements that belong together.

For example, a `<div>` can be used to group together all of the elements that make up the navigation for a web page, or any other section of a page.

```html
<div>
  <h1>Alice In Wonderland</h1>
  <p> ... </p>
</div>
```

In the example above, a heading for "Alice In Wonderland" and a brief paragraph description of the book are contained within a single `<div>`. If more books were to appear on the page, additional divs could be used to organize them. This would keep the code easier to read, maintain, and style.

### 8. Divs + Classes

Now that you know how to organize code into sections using divs, we can start labeling divs with classes instead, rather than labeling individual elements with classes.

This does not mean that labeling individual elements with classes is no longer useful. Even when divs are labeled with classes, there will be many other times when an individual element will need to be labeled with a class.

```html
<div class="container">
  <h1 class="title">Alice In Wonderland</h1>
  <p> ... </p>
</div>
```

```css
div.container {
  background-color: rgb(252, 255, 205);
  font-family: Roboto, Helvetica, sans-serif;
}

h1.title {
  color: #0D1A2F;
}
```

In the example above, a heading and paragraph are contained within a div that has a class of `container`. In the stylesheet, the background color and typeface of the div have been styled.

Divs are intended to contain other HTML elements, not raw text. Does it make sense to style a div directly then?

When a div is styled, *all elements inside* of the div will *inherit* the styling applied to the div. This example illustrates how easy it is to style sections of a web page using div.

**Note:** The example above uses a class called `container`. Chances are that you'll frequently see this class name as you learn more about web development.

The div is one of the most commonly used elements in all of HTML. Modern web pages make extensive use of the div, and learning how to use divs for organization and styling is a critical skill for all web developers.

### Generalizations

1. Code is a lot more readable when it is organized using IDs, classes, and divs.
2. IDs label HTML elements that are unique to the web page (an element that appears *only once*).
3. Classes label elements that will share the same styling. They make styling more efficient.
4. The `<div>` groups elements together. It makes the HTML file easier to read by organizing the web page into logical sections.
5. HTML elements can be labeled with multiple classes.
6. Divs are one of the most commonly used HTML elements. Understanding how they are used is a critical skill for web developers.

## Understanding the Box Model

### 1. What is the Box Model?

All HTML elements live within a box. Elements on a web page are understood by the browser as "living" inside of a container, or a box. This is what is meant by the *box model*.

When you changed the background color of an element, you changed the background color of its entire box. When you aligned text, the text was aligned relative to the element's entire box. To truly create custom websites, you'll have to understand the box model.

There are four aspects of the box model:

1. The dimensions of an element's box
2. The borders of an element's box
3. The content within an element's box
4. The area around all four sides of an element's box

### 2. Width & Height

An element's box has two dimensions: a *height* and a *width*. In HTML, all boxes have default dimensions. These default dimensions are automatically set to hold the raw contents of the box.

To modify the default dimensions an element's box in CSS, you can use the `width` and `height` properties.

These two properties can be specified with the following units of measurement:

1. Pixels - You learned about pixels when you learned about fonts. This unit lets you set the exact size of an element's box.
2. Ems - This unit sets the dimensions of the box relative to the size of the text within the box.
3. Percentages - This unit sets the dimensions of the box relative to the size of the box that it is encased in. For example, consider an element (a box) of class `blue` set to a height of 200 pixels and a width of 200 pixels. Inside of `blue`, consider another box of class `red`, set to a height of 37% and a width of 45%. The resulting dimensions of the `red` box would be a height of 74 pixels and a width of 90 pixels.

Developers **often** use **ems** or **percentages** to set box dimensions. Because many web pages are now accessed on mobile devices and other displays of differing sizes, ems and percentages allow boxes to scale depending on the size of a user's display.

### 3. Width: Minimum & Maximum

Because a web page can be viewed through displays of differing screen size, the content on the web page can suffer from those changes in size. To avoid this problem, CSS offers two properties that can limit how narrow or how wide an element's box can be sized to.

1. `min-width` - this property ensures a minimum width for an element's box.
2. `max-width` - this property ensures a maximum width for an element's box.

```css
p {
  min-width: 300px;
  max-width: 600px;
}
```

In the example above, the width of all paragraphs will not shrink below 300 pixels, nor will the width exceed 600 pixels.

Content, like text, can become difficult to read when a browser window is narrowed or expanded. These two properties ensure that content is legible by limiting the minimum and maximum widths of an element.

### 4. Height: Minimum & Maximum

You can also limit the minimum and maximum *height* of an element.

1. `min-height` - this property ensures a minimum height for an element's box.
2. `max-height` - this property ensures a maximum height for an element's box.

```css
p {
  min-height: 150px;
  max-height: 300px;
}
```

In the example above, the height of all paragraphs will not shrink below 150 pixels and the height will not exceed 300 pixels.

What will happen to the contents of an element's box if the `max-height` property is set too low? It's possible for the content to spill outside of the box, resulting in content that is not legible. How can we ensure that this doesn't happen?

### 5. Overflow

The `overflow` property controls what happens to content when it spills, or *overflows*, outside of its box. It can be set to one of the following values:

1. `hidden` - when set to this value, any content that overflows be hidden from view.
2. `scroll` - when set to this value, a scrollbar will be added to the element's box so that the rest of the content can be viewed by scrolling.

```css
p {
  min-width: 300px;
  max-width: 600px;
  min-height: 150px;
  max-height: 300px;
  overflow: scroll; 
}
```

In the example above, minimum and maximum widths and heights have been set. If any of the paragraph content overflows (perhaps a user resizes their browser window), a scrollbar will appear so that users can view the rest of the content.

### Generalizations

1. All HTML elements are contained within a box.
2. Boxes have two dimensions: a width and a height. These dimensions can be modified with the `width`and `height` properties.
3. Width and height dimensions can be set using one of three units of measurement: pixels, ems, or percentages.
4. A minimum and maximum width or height can be set for a box. This helps ensure that content remains legible when a user shrinks or expands their browser window.
5. If an element's box becomes too small, the content may overflow. The overflowed content can be controlled with the `overflow` property.

## Borders

### 1. Border Style

It's not possible to view a box's border if the border's *style* has not been set. A border's style can be set with the `border-style` property. This property can take on one of the following values:

1. `solid` - border is a solid line.
2. `dashed` - border is a series of lines or dashes.
3. `dotted` - border is a series of square dots.
4. `double` - border is two solid black lines.
5. `groove` - border is a groove (or carving).
6. `inset` - border appears to cut into the screen.
7. `outset` - border appears to pop out of the screen.
8. `ridge` - border appears as a picture frame.
9. `hidden` or `none` - no border.

```css
div {
  border-style: solid;
}
```

In the example above, a solid black line will appear around all divs on the page.

### 2. Border Width

You can control the thickness, or width, of borders with the `border-width` property. The value of `border-width` is given in pixels.

```css
p {
  border-style: solid;
  border-width: 5px;
}
```

In the example above, the solid borders of all paragraphs on the page would be set to a thickness of 5 pixels.

It's also possible to also set the `border-width`property to one of the following named thicknesses:

1. `thin`
2. `medium`
3. `thick`

While these values are perfectly valid, you may not see them often, but it's good to know that they exist.

What if you don't want the border thickness to be the same on all four sides?

In that case, another version of the `border-width`property allows you to specify the width for each side of the border.

```css
p {
  border-style: solid;
  border-width: 3px 1px 2px 1px;
}
```

The values in the example above refer to the border width in *clockwise* order (top: 3 pixels, right: 1 pixel, bottom: 2 pixels, left: 1 pixel).

If you'd like to be even more specific about the width of different sides of the border, you can use the following properties:

1. `border-top-width`
2. `border-right-width`
3. `border-bottom-width`
4. `border-left-width`

Each property affects the width of only one side of the border, giving you more flexibility in customization.

```css
p {
  border-style: solid;
  border-left-width: 4px;
}
```

In the example above, only the left side of the border will be set to a width of 4 pixels.

### 3. Border Color

The color of a border can also be customized with the `border-color` property.

```css
div.container {
  border-style: solid;
  border-width: 3px;
  border-color: rgb(22, 77, 100);
}
```

The `border-color` property accepts colors in the various formats you learned about earlier: named colors, RGB(a) colors, and hex colors. It's **common** to use **hex colors **for borders, but you'll likely also come across RGB(a) colors as well.

### 4. Shorthand

The shorthand way of setting border style, width, and color can be achieved with the `border` property. Let's look at how we can decrease the amount of [code bloat](https://en.wikipedia.org/wiki/Code_bloat) with this property.

```css
div.container {
  border-style: solid;
  border-width: 3px;
  border-color: rgb(22, 77, 100);
}
```

The code in the example above can be shortened using the `border` property:

```css
div.container {
  border: 3px solid rgb(22, 77, 100);
}
```

Note that the `border` property includes all of the properties that we previously styled individually: width, style, and color.

It's considered best practice to follow the width-style-color order when using the `border` property.

### 5. Border Radius

The corners of an element's border box can be modified with the `border-radius` property.

```css
div.container {
  border: 3px solid rgb(22, 77, 100);
  border-radius: 5px;
}
```

The code in the example above will set *all four corners* of the border to a radius of 5 pixels (i.e. the same curvature that a circle with radius 5 pixels would have).

You can create a border that is a perfect circle by setting the radius equal to the height of the box, or to `100%`.

```css
div.container {
  height: 60px;
  width: 60px;
  border: 3px solid rgb(22, 77, 100);
  border-radius: 100%;
}
```

The code in the example above creates a div that is a perfect circle.

### Generalizations

1. You can style the borders of an element's box.
2. The `border-width` property allows you to set the thickness, or width, of a border.
3. The `border-style` property allows you to change the style of border used.
4. The `border-color` property allows you to change the color of a border.
5. Individually setting the style, thickness, and color of a border can bloat code. It's more efficient to use the shorthand `border` property and specify all three properties at once, in that order.
6. Box borders don't have to be square. Their corners can be rounded with the `border-radius` property.

## Content

### 1. Padding

The space between the contents of a box and the borders of a box is known as *padding*. In CSS, you can modify this space with the `padding` property.

```css
p {
  border: 3px solid #A2D3F4;
  padding: 10px;
}
```

The code in the example will put 10 pixels of space between the content of the paragraph (the text) and the box borders, on all four sides.

The `padding` property is particularly useful at making text easier to read when the text has a border around it.

**Note:**  When **padding** is set for a box (as in the example above) it will be added to the width and height of a box, **increasing the dimensions of the box**. 

What if you don't want all four sides of a box's content to have equal padding?

In that case, another version of the `padding` property lets you specify exactly how much padding there should be on each side of the content.

```css
p {
  border: 3px solid #XXXXXX;
  padding: 5px 10px 5px 10px;
}
```

> When this version of the `padding` property is used, a padding value must be specified for all four sides of the content.

The top and bottom values for padding are the same (`5px`) and the left and right values for padding are also the same (`10px`).

When you're certain that the top and bottom values for padding will equal each other, and that the left and right values for padding will also equal each other, you can use the following shortcut:

```css
p {
  padding: 5px 10px;
}
```

The first value, `5px`, sets a padding value for the top and bottom sides of the content. The second value, `10px` sets a padding value the left and right sides of the content.

If you want to be even more specific about the amount of padding on each side of a box's content, you can use the following properties:

1. `padding-top`
2. `padding-right`
3. `padding-bottom`
4. `padding-left`

Each property affects the padding on only one side of the box's content, giving you more flexibility in customization.

```css
p {
  border: 3px solid #2D3FA3;
  padding-bottom: 10px;
}
```

In the example above, only the bottom side of the paragraph's content will have a padding of 10 pixels.

### 2. Margin

The margin refers to the space directly outside of the box. You can adjust this spacing with the `margin`property.

```css
p {
  border: 1px solid #23AD44;
  margin: 20px;
}
```

The code in the example above will place 20 pixels of space on the outside of the paragraph's box, on all four sides. This means that other HTML elements on the page cannot come within 20 pixels of the paragraph.

An understanding of the `margin` property is crucial in order to later understand element positioning in the browser.

Just like padding, what if you don't equal margin on all four sides of the box?

In that case, another version of the `margin` property lets you specify exactly how much margin there should be on each side of the box.

```css
p {
  margin: 6px 12px 6px 12px;
}
```

> When this version of the `margin` property is used, a margin value must be specified for all four sides of the box.

The top and bottom values of margin are the same (`6px`) and the left and right value of margin are also the same (`12px`).

Just like the padding shortcut, when you're certain that the top and bottom values for margin will equal each other, and that the left and right values for padding will also equal each other, you can use the following shortcut:

```css
p {
  margin: 6px 12px;
}
```

The first value, `6px`, sets a margin value for the top and bottom sides of the box. The second value, `12px` sets a margin value for the left and right sides of the box.

If you want to be even more specific about the amount of margin on each side of a box, you can use the following properties:

1. `margin-top`
2. `margin-right`
3. `margin-bottom`
4. `margin-left`

Each property affects the margin on only one side of the box, giving you more flexibility in customization.

```css
p {
  border: 3px solid #2D3FA3;
  margin-right: 15px;
}
```

In the example above, only the right side of the paragraph's box will have a margin of 15 pixels.

Because the `margin` property directly modifies the space outside of a box, it's very common to see margin values used for only specific sides of boxes. As you learn more about web development, you'll likely come across many different ways of positioning elements with the `margin` property.

**The `margin` property also lets you center content**, if you follow certain requirements. Take a look at the following example.

```css
div.headline {
  margin: auto;
}
```

When the `margin` property is set to `auto`, the element being styled will center in the page.

In theory, the div in the example above should center on the page, but it doesn't. Why?

**In order to center an element, a width must be set for that element.** Otherwise, the width of the div will be automatically set to the full width of its containing element, like the `<body>`, for example. It's not possible, therefore, to center an element that takes up the full width of the page.

```css
div.headline {
  width: 400px;
  margin: auto;
}
```

In the example above, the width of the div is set to 400 pixels, which is less than the width of the page's body. This will cause the div to center properly on the page.

**Note**: When `margin: auto` is used, an element will center *relative* to its container. For example, the div in the example above was centered relative to the width of the body. If the div was contained in larger div, the smaller div would center relative to the width of the larger div. This is important to keep in mind when attempting to center nested elements, like divs.

### 3. Resetting Defaults

All major web browsers have a default stylesheet they use in the absence of an external stylesheet. These default stylesheets are known as *user agent stylesheets*. In this case, the term "[user agent](https://en.wikipedia.org/wiki/User_agent)" is a technical term for the browser.

User agent stylesheets often have default CSS rules that set default values for padding and margin. This affects how the browser displays HTML elements, which can make it difficult for a developer to design or style a web page.

Many developers choose to reset these default values so that they can truly work with a clean slate.

```css
* {
  margin: 0;
  padding: 0;
}
```

The code in the example above resets the default margin and padding values of all HTML elements. It is often the first CSS rule in an external stylesheet.

Note that both properties are both set to `0`. When these properties are set to `0`, they do not require a unit of measurement.

### 4. Display

All HTML elements can be classified as one of the following: *inline* elements or *block-level* elements.

1. Inline elements - elements that display *inline* with text, without disrupting the flow of the text (like links).
2. Block-level elements - elements that use an entire line of space in a web page and disrupt the natural flow of text. Most of the common HTML elements are block-level elements (headings, paragraphs, divs, and more).

In CSS, you can change the default behavior of elements with the `display` property. Why is this useful?

Modifying the `display` property of an element can help achieve a desired layout for a web page. The `display` property can take on one of four values:

1. `inline` - causes block-level elements (like a div) to behave like an inline element (like a link).
2. `block` - causes inline elements (like a link) to behave like a block element (like a div).
3. `inline-block` - causes block-level elements to behave like an inline element, but retain the features of a block-level element.
4. `none` - removes an element from view. The rest of the web page will act as if the element does not exist.

It's common to use the `display` property to create a navigation bar from list items, like so:

```html
<ul>
  <li>Home</li>
  <li>Products</li>
  <li>Settings</li>
  <li>Inbox</li>
</ul>
li {
  display: inline;
}
```

In the example above, the block-level list items will now behave as inline elements. The result will be list items appearing on the same line, like a navigation bar.

### 5. Visibility

Elements can be hidden from view with the `visibility` property.

The `visibility` property can be set to one of the following values:

1. `hidden` - hides an element.
2. `visible` - displays an element.

```html
<ul>
  <li>Explore</li>
  <li>Connect</li>
  <li class="future">Donate</li>
<ul>
```

```css
.future {
  visibility: hidden;
}
```

In the example above, the list item with a class of `future` will be hidden from view in the browser.

Keep in mind, however, that users can still view the contents of the list item (e.g., `Donate`) by viewing the source code in their browser. Furthermore, the web page will *only* hide the contents of the element. It will still leave an empty space where the element is intended to display.

**Note:** What's the difference between `display: none`and `visibility: hidden`? An element with `display: none` will be completely removed from the web page. An element with `visibility: hidden`, however, will not be visible on the web page, but the space reserved for it will.

### Generalizations

1. Padding is the spacing between a box's content and the borders of the box.
2. Padding can be set equally on all sides of the content, or can be set specifically for certain sides of the content only.
3. Margin is the spacing directly outside of a box's borders.
4. Margins can be set equally on all sides of a box, or can be set specifically for certain sides of the box only.
5. The `display` changes the default behavior of HTML elements.
6. The `visibility` property hides an element, but does not remove the amount of space the element takes up on the page. If you want to hide that element and remove the empty space, use the `display` property instead.

## Changing the Box Model

### 1. Why Change the Box Model?

The box model, however, has an awkward limitation regarding box dimensions. This limitation is best illustrated with an example.

```html
<h1>Hello World</h1>
```

```css
h1 {
  border: 1px solid black;
  height: 200px;
  width: 300px;
  padding: 10px;
}
```

In the example above, a heading element's box has solid, black, 1 pixel thick borders. The height of the box is 200 pixels, while the width of the box is 300 pixels. A padding of 10 pixels has also been set on all four sides of the box's content.

Unfortunately, under the current box model, the border thickness and the padding will affect the dimensions of the box.

The 10 pixels of padding increases the height of the box to 220 pixels the width to 320 pixels. Next, the 1 pixel thick border increases the height to 221 pixels and the width to 321 pixels.

Under this box model, the border thickness and padding are added to the overall dimensions of the box. This makes it difficult to accurately size a box. Over time, this can also make all of a web page's content difficult to position and manage.

### 2. Box Model: Content-Box

![img](https://s3.amazonaws.com/codecademy-content/courses/web-101/htmlcss1-diagram__contentbox.svg)

Many properties in CSS have a default value and don't have to be explicitly set in the stylesheet.

For example, the default `font-weight` of text is `normal`, but this property-value pair is not typically specified in a stylesheet.

The same can be said about the box model that browsers assume. In CSS, the `box-sizing` property controls the type of box model the browser should use when interpreting a web page.

The default value of this property is `content-box`. This is the same box model that is affected by border thickness and padding.

### 3. Box Model: Border-Box

![img](https://s3.amazonaws.com/codecademy-content/courses/web-101/htmlcss1-diagram__borderbox.svg)

Fortunately, we can reset the entire box model and specify a new one: `border-box`.

```css
* {
  box-sizing: border-box;
}
```

The code in the example above resets the box model to `border-box` for all HTML elements. This new box model avoids the dimensional issues that exist in the former box model you learned about.

In this box model, the height and width of the box will remain fixed. The border thickness and padding will be included inside of the box, which means the overall dimensions of the box do not change.

```css
<h1>Hello World</h1>
* {
  box-sizing: border-box;
}

h1 {
  border: 1px solid black;
  height: 200px;
  width: 300px;
  padding: 10px;
}
```

In the example above, the height of the box would remain at 200 pixels and the width would remain at 300 pixels. The border thickness and padding would remain entirely *inside* of the box.

### Generalizations

1. In the default box model, box dimensions are affected by border thickness and padding.
2. The `box-sizing` property controls the box model used by the browser.
3. The default value of the `box-sizing` property is `content-box`.
4. The value for the new box model is `border-box`.
5. The `border-box` model is not affected by border thickness or padding.

## Layout

### 1. Position

The default position of an element can be changed by setting its `position` property. The `position` property can take one of four values:

1. `static` - the default value (it does not need to be specified)
2. `relative`
3. `absolute`
4. `fixed`

#### 1.1 Position: Relative

One way to modify the default position of an element is by setting its `position` property to `relative`.

This value allows you to position an element *relative* to its default position the web page.

```css
div.description {
  background-color: #1D09AF;
  width: 50px;
  height: 50px;
  position: relative;
}
```

Although the code in the example above instructs the browser to expect a relative positioning of the div, it does not specify exactly where the div should be positioned on the page.

```css
div.description {
  background-color: #1D09AF;
  width: 50px;
  height: 50px;
  position: relative;
  top: 50px; 
  left: 75px;
}
```

In the example above, the div has been positioned using two of the four *offset properties*. The valid offset properties are:

1. `top` - moves the element down.
2. `bottom` - moves the element up.
3. `left` - moves the element right.
4. `right` - moves the element left.

In the example above, the div will be moved down 50 pixels and to the right 75 pixels. Units for offset properties can be specified pixels, ems, or percentages. 

> Note that offset properties will not work if the position of the element is not set to `relative`.

#### 1.2 Position: Absolute

Another way of modifying the position of an element is by setting its position to `absolute`.

When an element's position is set to `absolute`, all other elements on the page will *ignore* the element and act like it is not present on the page.

```css
div.description {
  background-color: #1D09AF;
  width: 50px;
  height: 50px;
  position: absolute;
}
```

Unlike the `relative` value, the code in the example is valid. The div will be pinned down to its current position. Unfortunately, if offset properties aren't specified, it's possible for the div's content to overlap with other content on the page, especially since other elements with ignore the div.

Offset properties can be set in order to avoid this problem. The specific offset values will depend on what makes the best sense for the content of a web page.

```css
div.description {
  background-color: #1D09AF;
  width: 50px;
  height: 50px;
  position: absolute; 
  left: 250px;
}
```

#### 1.3 Position: Fixed

When an element's position is set to `absolute`, that element can still scroll out of view when a user scrolls.

We can *fix* an element to a specific position on the page (regardless of user scrolling) by setting its position to `fixed`.

```css
div.navigation {
  position: fixed;
  height: 50px; 
  width: 100%;
}
```

In the example above, the div will remain fixed to its position no matter where the user scrolls on the page. This technique is used often for navigation bars on a web page.

It's still possible, however, for content (like text) to overlap other content when using this position. One solution is to set an opaque background color for the element.

```css
div.navigation {
  position: fixed;
  background-color: #4BF5FF;
  height: 50px; 
  width: 100%;
}
```

The opaque background color will prevent any other content on the page from overlapping with any content inside of the div.

### 2. Z-Index

When boxes on a web page have a combination of different positions, the boxes (and therefore, their content) can overlap with each other, making the content difficult to read or consume.

```css
div.navigation {
  background-color: #4BF5FF;
  width: 100%;
  height: 100px;
  position: fixed; 
}

div.description {
  background-color: #1D09AF;
  width: 50px;
  height: 50px;
  position: relative;
  top: 200px;
}
```

In the example above, the `description` div would ignore the `navigation` div and overlap it as a user scrolls. The opaque background color of the `navigation` div is not enough to prevent this from happening.

The `z-index` property controls how far "back" or how far "forward" an element should appear on the web page.

The `z-index` property accepts integer values. Depending on their values, the integers instruct the browser on the order in which elements should be displayed on the web page.

```css
div.navigation {
  background-color: #4BF5FF;
  width: 100%;
  height: 100px;
  position: fixed;
  z-index: 1; 
}

div.description {
  background-color: #1D09AF;
  width: 50px;
  height: 50px;
  position: relative;
  top: 200px;
}
```

In the example above, the z-index of the `navigation`div has been set to `1`, which instructs the browser to move this div *forward* and stack it "on top" of the other elements when the user scrolls.

It's not necessary to set the z-index of the `description` div to 0 or anything lower than 0. Setting the z-index of `navigation` to a number greater than 0 is sufficient to prevent overlapping content.

### 3. Float

So far, you've learned how to specify the exact position of an element using offset properties. If you're simply interested in moving an element as far left or as far right as possible on the page, you can use the `float`property.

The `float` property can be set to one of two values:

1. `left` - this value will move, or float, elements as far left as possible.
2. `right` - this value will move elements as far right as possible.

```css
div.block {
  width: 100px;
  float: left;
}
```

When an element is floated, any other content within the same containing element will naturally flow around the element.

Floated elements must have a width specified, as in the example above. Otherwise, the element will assume the full width of its containing element, and attempting to float the element may not yield any visible results.

### 4. Clear

The `float` property can also be used to float multiple elements at once. When multiple floated elements have different heights, however, this can affect their layout on the page. Specifically, elements can "bump" into each other and not allow other elements to properly move the left or or the right.

Setting the `clear` property of an element lets you specify how elements should behave when they bump into each other on the page.

The `clear` property specifies how elements should behave when they bump into each other on the page. It can take on one of the following values:

1. `left` - the left side of the element will not touch any other element within the same containing element.
2. `right` - the right side of the element will not touch any other element within the same containing element.
3. `both` - neither side of the element will touch any other element within the same containing element.
4. `none` - the element can touch either side.

```css
div {
  width: 200px;
  float: left;
}

div.special {
  clear: left;
}
```

In the example above, all divs on the page are floated to the left side. The div with class `special` did not move all the way to the left because a taller div blocked its positioning. By setting its `clear` property to `left`, the `special` div will be moved all the way to the left side of the page.

### Generalizations

1. The `position` property allows you to specify the position of an element in three different ways.
2. When set to `relative`, an element's position is relative to its default position on the page.
3. When set to `absolute`, an element's position can be pinned to any part of the web page, but the element will still move out of view the page is scrolled.
4. When set to `fixed`, an element's position can be pinned to any part of the web page. The element will remain in view no matter what.
5. The `z-index` of an element specifies how far back or how far forward an element appears should appear on the page.
6. The `float` property can move elements as far left or as far right as possible on a web page.
7. You can clear an element's left or right side (or both) using the `clear` property.

## Adding Images

### 1. Width x Height

We can modify the dimensions of an image using the `width` and `height` properties.

```html
<img src="#" alt="" class="" />
```

```css
img.X {
  width: 350px;
  height: 200px; 
}
```

It's important to specify the width and height for an image on your web page, as this helps the browser know exactly how much space should be reserved for the image, rather than having to download an entire image for the user.

Ideally, however, images should be saved at the dimensions that they will be displayed. For example, rather than specify a height and a width for an image using CSS, that....

### 2. Centering Images

Images can also be centered, but first, their default behavior must be changed. By default, images are inline elements. For images to center properly, they must behave as block-level elements.

```css
img.leaf {
  width: 300px;
  height: 200px; 
  display: block;
}
```

In the example above, the image's `display` property has been set to `block`. Now the image can be aligned as a block-level element.

```css
img.leaf {
  width: 300px;
  height: 200px; 
  display: block;
  margin: 0px auto;
}
```

In the example above, the image is aligned using the `margin` property. The top and bottom margins of the image's box are set to `0` margin. The left and right margins are set to `auto`, which automatically sets the exact amount of margin needed on the left and right sides in order to center the image.

**Note:** To align images to the left or right side of a page, you can use the `float` property you learned about earlier.

### 3. Background: Images

Images can also be added to the backgrounds of HTML elements with the `background-image` property.

```css
body {
  background-image: url("https://www.example.com/leaf.jpg");
}
```

The `background-image` can be set to a value of `url()`.

1. `url()` - contains the URL of the image, enclosed in double quotes.

In the example above, the background of the body will be set to the image specified in double quotes. This technique can be used on nearly any HTML element.

### 4. Background: Repeat

You can control how a background image *repeats* with the `background-repeat` property. This property can take one of four values:

1. `repeat` - the default value — the image will repeat horizontally and vertically.
2. `repeat-x` - the background image will be repeated only along the x-axis (horizontally).
3. `repeat-y` - the background image will be repeated only along the y-axis (vertically).
4. `no-repeat` - the background image will not be repeated at all and will appear only once.

```css
p {
  background-image: url("#");
  background-repeat: repeat-x;
}
```

In the example above, the paragraph's background image will repeat horizontally.

### 5. Background: Position

When a background image is not repeated, its position can be modified with the `background-position`property.

```css
p {
  background-image: url("#");
  background-repeat: no-repeat;
  background-position: right center;
}
```

A background image is positioned using a 3 by 3 grid (three rows, three columns), meaning there are 9 total possible positions for the image:

1. `left top` - top left corner of the element's box.
2. `center top` - top center of the element's box.
3. `right top` - top right corner of the element's box.
4. `left center` - left column, center row.
5. `center center` - the center of the element's box.
6. `right center` - right column, center row.
7. `left bottom` - bottom left corner of the element's box.
8. `center bottom` - bottom center of the element's box.
9. `right bottom` - bottom right corner of the element's box.

Note that the values are in pairs.

```css
p {
  background-image: url("#");
  background-repeat: no-repeat;
  background-position: right top;
}
```

In the example above, the background image is not repeated. It's positioned in the top right corner of the element's box.

**Note:** When setting this property, if only one value is specified, the second value will default to `center`.

### 6. Background: Shorthand

 CSS allows you to set all three properties at once using a shorthand property: `background`.

Previously, we set these three properties as follows:

```css
p {
  background-image: url("#");
  background-repeat: no-repeat;
  background-position: right center;
}
```

The code in the example above can be shortened using the `background` property.

```css
p {
  background: url("#") no-repeat right center;
}
```

Note that the `background` property includes all of the properties that we previously styled individually: background image, repetition, and position (in that order). It's considered best practice to follow this order of values when setting the `background property`.

### 7. Background: Size

To modify a background image's size, you can use the `background-size` property.

This exercise will focus on two of the most common values of the `background-size` property:

1. `cover` - expands the image as large as possible to cover the full width or height of a container. If the dimensions of the container (say, a div) are larger than the dimensions of the image, the image will become distorted. This value is best for images that don't communicate important content to the user, like background images.
2. `contain` - expands the image as large as possible, but the image will be letterboxed, which means it won't cover the full width or height of a container.

```css
div.header {
  height: 400px;
  width: 100%;
  background: url("#") no-repeat right center;
  background-size: cover;
}
```

In the example above, the background image will expand to cover the full size of the div.

### 8. Background: Attachment

With the `background-attachment` property, you can specify whether or not a background image should remain at one position on the web page or whether it should move up and down as the user scrolls through a web page.

The `background-attachment` property can take one of two values:

1. `scroll` - this value allows the image to move up and down as a user scrolls on the web page (this is the default value).
2. `fixed` - this value pins the image's position on the page.

```css
p {
  background: url("#") no-repeat right center;
  background-attachment: fixed;
}
```

In the example above, the background image will remained fixed as a user scrolls through the web page.

### 9. Background: Color

A wide variety of different background styles are used across many modern websites today. Some sites use large images in their layout, while others use creative [color gradients](https://en.wikipedia.org/wiki/Color_gradient) as their background.

The `background-image` property you learned about earlier allows you to do more than simply set the background image of an element. It also lets you use color gradients in your web page.

Gradients are planned to be a part of the newest revision of CSS, CSS3. Due to the many browsers available, there is no standard way of defining a gradient using CSS (different browsers require different syntax). In this exercise, we'll look at one value supported on a couple of major browsers.

The `background-image` property can be set to the following value:

1. `-webkit-linear-gradient()` - this value accepts two arguments: the two colors the linear gradient will transition to and from. The colors are usually specified as hex color codes.

```css
div.header {
  height: 400px;
  width: 400px;
  background-image: -webkit-linear-gradient(#666CCC, #BC1324);
}
```

### 10. Image vs Div Background

You've learned how to add images to a web page using the `<img>` element and the `background` property. What's the difference between these two methods? When should one method be used over another?

The method used depends on the type of image.

Some images are part of the content of a web page (icons, logos, album photos, etc.) and they communicate important information to a user. Other images are intended simply to style a web page (header backgrounds, etc.), not to communicate important information.

When an image communicates important information, you can use the `<img>` element and style the image using CSS, if needed.

When an image is intended to style a web page, you can use the `background` property and further style it with CSS.

### Generalizations

1. Image dimensions are set using the `width` and `height` properties.
2. A background image can be added to any element using the `background-image` property.
3. A background image's repetition is controlled with the `background-repeat` property.
4. The position of a non-repeating image can be controlled using the `background-position`property.
5. The `background` property is a shorthand way of setting an image, repetition, and it's position.
6. The `background-image` also supports color gradients.

## HTML Tables

### 1. Create a Table

Before displaying data, you must first create the table that will contain the data by using the ``element.

```html
<table>

</table>
```

The `<table>` element will contain all of the tabular data you plan on displaying.

### 2. Table Data

Rows aren't sufficient to add data to a table. Each cell element must also be defined. In HTML, you can add data using the *table data* element: `.

```html
<table>
  <tr>
    <td>73</td>
    <td>81</td>
  </tr>
</table>
```

In the example above, two data points (`73` and `81`) were entered in the one row that exists. By adding two data points, we created two cells of data.

If the table were displayed in the browser, it would show a table with one row and two columns.

### 3. Table Headings

Table data doesn't make much sense without titles to describe what the data represents.

To add titles to rows and columns, you can use the *table heading* element: `.

The table heading element is used just like a table data element, except with a relevant title. Just like table data, a table heading must be placed within a table row.

```html
<table>
  <tr>
    <th></th>
    <th scope="col">Saturday</th>
    <th scope="col">Sunday</th>
  </tr>
  <tr>
    <th scope="row">Temperature</th>
    <td>73</td>
    <td>81</td>
  </tr>
</table>
```

What happened in the code above?

First, a new row was added to hold the three headings: a blank heading, a `Saturday` heading, and a `Sunday`heading. The blank heading creates the extra table cell necessary to align the table headings correctly over the data they correspond to.

In the second row, one table heading was added as a row title: `Temperature`.

Note, also, the use of the `scope` attribute, which can take one of two values:

1. `row` - this value makes it clear that the heading is for a row.
2. `col` - this value makes it clear that the heading is for a column.

HTML code for tables may look a little strange at first, but analyzing it piece by piece helps make the code more understandable.

### 4. Table Borders

So far, the tables you've created have been a little difficult to read because they have no borders.

In older versions of HTML, a border could be added to a table using the `border` attribute and setting it equal to an integer. This integer would represent the thickness of the border.

```html
<table border="1">
  <tr>
    <td>73</td>
    <td>81</td>
  </tr>
</table>
```

The code in the example above is following is [deprecated](https://en.wikipedia.org/wiki/Deprecation), so please don't use it. It's meant to illustrate older conventions you may come across when reading other developers' code.

The browser will likely still interpret your code correct if you use the `border` attribute, but that doesn't mean the attribute should be used. Instead, you can achieve the same effect using **CSS**.

```css
table, td {
  border: 1px solid black;
}
```

The code in the example above uses CSS instead of HTML to show table borders.

### 5. Spanning Columns

What if the table contains data that spans multiple columns?

For example, a personal calendar could have events that span across multiple hours, or even multiple days.

Data can span columns using the `colspan` attribute. The attributes accepts an integer (greater than or equal to 1) to denote the number of columns it spans across.

```html
<table>
  <tr>
    <th>Monday</th>
    <th>Tuesday</th>
    <th>Wednesday</th>
  </tr>
  <tr>
    <td colspan="2">Out of Town</td>
    <td>Back in Town</td>
  </tr>
</table>
```

In the example above, the data `Out of Town` spans the `Monday` and `Tuesday` table headings using the value `2` (two columns). The data `Back in Town` appear only under the `Wednesday` heading.

### 6. Spanning Rows

Data can also span multiple rows using the `rowspan`attribute.

The `rowspan` attribute is used for data that spans multiple rows (perhaps an event goes on for multiple hours on a certain day). It accepts an integer (greater than or equal to 1) to denote the number of rows it spans across.

```html
<table>
  <tr> <!-- Row 1 -->
    <th></th>
    <th>Saturday</th>
    <th>Sunday</th>
  </tr>
  <tr> <!-- Row 2 -->
    <th>Morning</th>
    <td rowspan="2">Work</td>
    <td rowspan="3">Relax</td>
  </tr>
  <tr> <!-- Row 3 -->
    <th>Afternoon</th>
  </tr>
  <tr> <!-- Row 4 -->
    <th>Evening</th>
    <td>Dinner</td>
  </tr>
</table>
```

In the example above, there are four rows:

1. The first row contains an empty cell and the two column headings.
2. The second row contains the `Morning` row heading, along with `Work`, which spans two rows under the `Saturday` column. The "Relax" entry spans three rows under the `Sunday` column.
3. The third row only contains the `Afternoon` row heading.
4. The fourth row only contains the `Dinner` entry, since "Relax" spans into the cell next to it.

### 7. Table Body

Over time, a table can grow to contain a lot of data and become very long. When this happens, the table can be sectioned off so that it is easier to manage.

Long tables can be sectioned off using the *table body* element: .

The  element should contain the all of the table's data, excluding the table headings (more on this in a later exercise).

```html
<table>
  <tbody>
    <tr>
      <th></th>
      <th>Saturday</th>
      <th>Sunday</th>
    </tr>
    <tr>
      <th>Morning</th>
      <td rowspan="2">Work</td>
      <td rowspan="3">Relax</td>
    </tr>
    <tr>
     <th>Afternoon</th>
    </tr>
    <tr>
      <th>Evening</th>
      <td>Dinner</td>
    </tr>
  </tbody>
</table>
```

In the example above, all of the table data is contained within a table body element. Note, however, that the headings were also kept in the table's body — we'll change this in the next exercise.

### 8. Table Head

 When a table's body is sectioned off, however, it also makes sense to section off the table's headings using the `<thead>`  element.

```html
<table>
  <thead>
    <tr>
      <th></th>
      <th>Saturday</th>
      <th>Sunday</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>Morning</th>
      <td rowspan="2">Work</td>
      <td rowspan="3">Relax</td>
    </tr>
    <tr>
     <th>Afternoon</th>
    </tr>
    <tr>
      <th>Evening</th>
      <td>Dinner</td>
    </tr>
  </tbody>
</table>
```

In the example above, the only new element is `<thead>` . The table headings are contained inside of this element. 

> Note that the table's head still requires a row in order to contain the table headings.

### 9. Table Footer

The bottom part of a long table can also be sectioned off using the  `<tfoot> ` element.

```html
<table>
  <thead>
    <tr>
      <th>Quarter</th>
      <th>Revenue</th>
      <th>Costs</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>Q1</th>
      <td>$10M</td>
      <td>$7.5M</td>
    </tr>
    <tr>
      <th>Q2</th>
      <td>$12M</td>
      <td>$5M</td>
    </tr>
  </tbody>
  <tfoot>
    <tr>
      <th>Total</th>
      <td>$22M</td>
      <td>$12.5M</td>
    </tr>
  </tfoot>
</table>
```

In the example above, the footer contains the totals of the data in the table. Footers are often used to contain sums, differences, and other data results.

### 10. Styling with CSS

Tables, by default, are very bland. They have no borders, the font color is black, and the typeface is the same type used for other HTML elements.

You can use CSS to style tables just like you have done in the past. Specifically, you can change style the various aspects mentioned above.

```css
table, th, td {
  border: 1px solid black;
  font-family: Arial, sans-serif;
  text-align: center;
}
```

The code in the example above demonstrates just some of the various table aspects you can style using the CSS properties you learned about earlier.

### Generalizations

1. The `<table>` element creates a table.
2. The `<tr>` element adds rows to a table.
3. To add data to a row, you can use the `<td>` element.
4. Table headings clarify the meaning of data. Headings are added with the `<th>` element.
5. Table data can span columns using the `colspan`attribute.,
6. Table data can span rows using the `rowspan`attribute.
7. Tables can be split into three main sections: a head, a body, and a footer.
8. A table's head is created with the `<thead>` element.
9. A table's body is created with the `<tbody>` element.
10. A table's footer is created with the `<tfoot>` element.
11. All the CSS properties you learned about in this course can be applied to tables and their data.









