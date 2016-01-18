---
layout: post
title: Jekyll - How To Validate Links and Images
date: 2016-02-02 06:00
categories: ['jekyll', 'github']
published: true
series: blogging-with-jekyll 
excerpt: |
	Before you publish your blog post you want to make sure that all of the links and images in the post are validate.  You also want to make that all of the links and images from previous post are still validate.  The last thing you want is to be notified by a user that you have a broken link or a missing image.  
    
	Luckily  there is a ruby gem that can do this work for us.  This gem is called html-proofer.

---

Before you publish your blog post you want to make sure that all of the links and images in the post are validate.  You also want to make that all of the links and images from previous post are still validate.  The last thing you want is to be notified by a user that you have a broken link or a missing image.  

Luckily  there is a ruby gem that can do this work for us.  This gem is called html-proofer.   You can either install the gem as part of your Gemfile or as another ruby gem. 

### Gemfile 

Add this line to your Gemfile
	gem 'html-proofer'
	
Then to run the validation run 

	bundle exec html-proof ./_site/
	
### Ruby Gem 

Install the ruby gem just like any other ruby gems 

	gem install html-proofer 
	
Then to run the validation run 

	html-proof ./_site/
	
You will now get a report of any broken links or image tags.  You may need to look at some of the include or  layout file to fix links.  Once you get the initial set of links fixed, you will mainly have to worry about the new updates to the blog.