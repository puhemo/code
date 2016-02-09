---
layout: post
title: Jekyll 3 Breaking Change -  Category and Tag Listing Are Case Sensitive 
date: 2016-02-09 10:00
categories: ['blogging' ,'jekyll ]
published: true
series: blogging-with-jekyll
excerpt: |

--- 
{% assign imagedir = "/images/jekyll/" | prepend: site.baseurl | prepend: site.url %}

Note: This  post will be using just  categories since I don't use tags on my site but it works the same way for  tags.  Basically you just replace categories in all of the code samples with tags and you are done.
  
 With the upgrade to Jekyll 3 on Github Pages, I noticed that all of a sudden my category archive page was showing tags sorted by case.  So the first thing I did was go look at the change log to see if I missed a change but I didn't see anything.  I may have missed it though since there are a lot of changes.

Since I couldn't find anything in the change log, It took a bit too figure out what  was going on.  After a bunch of research I discovered  that in Jekyll 2.0 they automatically converted categories and tags to lowercase but in 3.0 they decided to change this behavior to no longer change the case of them.  

I figured there had to be an easy way to fix this but unfortunately there was not with how I wanted my listing to work. On my category archive page I show the number of post per category.  This threw a monkey wrench into it since categories is an array that contains all of the post that you can easily get the size from.  If I told it to lowercase the category then it would convert it to a string and lose all of the post for the tag so you couldn't do a count of them.  I also couldn't just change the case of the tag position in the array because then  it would not find the  post belonging to that tag.    

So in the end I ended up doing a bunch of preparing of the category musings listing  to get the html output of the tag with count in lowercase into an array and then calling the sort method on it. 

This got  me the listing of the categories with count in a sorted order that was case ininsensitive So I was back to the behavior that I expected and wanted.  

The next step was to get the listing of posts by category in the same insensitive order.  Unfortunately like I tried initially I couldn't just lowercase all of the tags cause it wouldn't find the post.  So I had to do some preprocessor of the html and then sort it before outputting it.  This one was a little tricky to figure out.  

Basically I ended up creating an array to hold each category and the associated blog post.  Then I added that array to an another array so that I could sort the array and since the first position in each array was the category in lowercase it would sort correctly. 