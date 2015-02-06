---
layout: post
title: Blogging on Github Part 2: Your First Post published: false  
categories:[github,blogging,jekyll]
tags: [github,blogging,jekyll,series]
published: true
---
### Overview
Welcome to part 2 of the series on blogging on  github.  In this post we will go through making your first blog post.

[View Part 1 - Getting Started](http://digitaldrummerj.me/blogging-on-github-part-1/)

**Length:** 10 minutes 

We will go through all of the steps to create a new post, add metadata such as title/categories/tags/date, and then make it live on the site.  

### Section 1: Creating the file 

Thr first step is to create a new file to hold the content of the blog post.  In Jekyll all of the blog post are markdown files and are stored in the _post directory.    When you commit this file to Github, it will be compiled into a static html page.  

The filename is in the format of year-month-day-title-separated-by-dashes.md.  

	2015-02-17-my-first-post.md
	
Go ahead and create your file now. 

### Section 2: Creating metadata 

Now we need to define some information about our blog post.  Since Jekyll doesn't have any kind of database behind it, all of the information such as title, is published,  categories, publish date, etc are stored at the top of the file in what is called Front Matter.  

To define the front matter section you have a line with 3 dashes in it and then repeat this same line to signal the end of the front matter section. 

Below are common metadata you will want to fill out.  

- layout:  is the name of the layout  from the _layouts directory.  If followed part 1 and cloned the jekyll-now repository, then the name is post.
- title:  the title of the blog post that will showbon the site.  Should be in quotes to avoid conflict with front matter parameter. 
- published: true or false.  Determines  if the post shows  on the website or not.
- date: date of the post.  this is optional and if not defined will use date in filename.
- categories: list of categories.  comma delimited.  put in quotes for multi word categories.  optional but recommended.  
- tags: list of tags that would be used to build a tag cloud.  optional but recommended. 
 
#### Sample Front Matter:
	---
	layout: post
	title: Blogging on Github Part 2: Your First Post 	published: false  
	date: 2015-02-01
	categories:[github,blogging,jekyll]
	tags: [github,blogging,jekyll,series]
	---
	
### Section 3:  Creating content 

Now on to creating the content of the post.  

The content of the post will be written in markdown and be directly below the front matter section .

**Common Markdown Tags**

#####Headers  

A #  starting  a line indicates to makebitba header and the number # indicates  the size of the header tag.  

	#  = 	h1
	## = h2
	and so on up the an h6
	
**examples**

#  h1
## h2
### h3
#### h4
##### h5
###### h6



##### Numbered list  or Bullets 

For bullets: start a line with a * or -.

	* sample list
	* next bullet

* sample list 
* next bullet 

For numbered list start with a 1 or the number you want to start with.

	1. sample ordered list
	2. number 2

1. sample ordered list 
2. number 2


##### Bold

surround  the text you to build with 2 ** and then put 2 more after the text  to end the bold.

	** sample bold ** 

**sample bold **

##### Links

link to other pages:

	[link name display](http://myurl.com)
	
[link name display](http://myurl.com)


##### Code Highlighting 

There are 2 ways:

1. tab the line in and it will group the text like the examples above.

1. use the highlighter markup
	
	{% highlight c# %}
	// some c# code....
	var a = "bad variable name"
	{% endhighlight %}

#####  Further Reading on Markdown

Github documentation on their markdown:  [https://help.github.com/articles/github-flavored-markdown/](https://help.github.com/articles/github-flavored-markdown/).

### Section 4:  Saving as draft

Saving as a draft in super simple.  You just need to set the front matter published tag equal to false.

	published: false
	
You can also create a drafts folder and save the file in the but if you do that then you will need to move the file to the _post folder when you are ready to publish.

### Section  5: Publishing post 

Publishing a post is as simple as changing the front matter published to true and committing the change to the github repository.  

	published: true

Github will take care of the conversion from markdown to an html page.  This should happen automatically within a minute and show up on the blog home page at the top.  

If it doesn't show up then check your email that you registered on github with to see if there was a jekyll compile error email.  

### Section 6:  Future lessons

* [Part 1 Getting Started](http://digitaldrummerj.me/blogging-on-github-part-1/)
* Part 2 Creating your first blog post
* Part 3 Adding the ability for readers to comment on your post
* Part 4 How to make change locally and push them to Github
* Part 5 Creating additional pages
* Part 6 Adding a page that list post by category
* Part 7 Adding a page that list post by month
* Part 8 Customizing the theme
* Part 9 Adding a custom Google search
* Part 10 Using your own domain name
