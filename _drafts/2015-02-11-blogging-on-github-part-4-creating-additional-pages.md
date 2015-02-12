---
published: true
layout: post 
title: Blogging On Github - Part 4 Adding Additional Pages 
categories: ['Blogging', 'Github', 'How-To', 'Jekyll']
date: 2015-02-11  
---

Welcome to part 4 of the series on Blogging on  Github.  In this lesson we will go through how to add additional page such as the [speaking]( {{ site.url}}/speaking) page on this blog.
 
**Lesson Length**: 10 minutes
 
**Other Lessons in the Series**

* [View Part 1 Getting Started]({{site.url}}/blogging-on-github-part-1/)
* [View Part 2 Creating your first blog post]({{site.url}}/blogging-on-github-part-2-your-first-post/)
* [View Part 3 Adding the ability for readers to comment on your post]({{site.url}}/blogging-on-github-part-3-adding-comments/)

### Overview 

As your blog grows you are going to want to add additional information besides  just blog post.  If you start speaking at events or want to show off your portfolio or blog post by category/date, you are going to want these as separate pages.  These pages  most  likely will have there own look and feel as well.  

### Section 1: Creating the file for the page 

If you have been following along with the other part in this series,  the step should be familiar to you.  

1. Open a web browser and navigate to your [username].github.io reporepository.
2. Click on the + button to add a new file
3.  Name the file portfolio.md
4.  Go to the next section to decide on the layout for the page 

### Section 2: Choosing a layout 

To tell the jekyll engine what the layout of the page should be, you need to add the front matter layout tag. 

From  [ Part 2 Creating your first blog post](http://digitaldrummerj.me/blogging-on-github-part-2-your-first-post/), you will remember that the front matter is the metadata about blog post but it is used in jekyll  for any page as well.  All of the front matter tags are the same as a blog post.

To change the layout from being a blog post to a page, you will change the layout front matter tag to page instead of post.  You will also want to include the sitemap tag line below.  

By default jekyll  adds files to the sitemap that search engines use to find pages on your site.  Setting  it to false will stop this page from being added.  We will remove the sitemap tag once we  are ready to share the page. 

**front  matter tags**

	---
	...other front matter tags  such as title
	layout: page
	sitemap: false 
	---
	
### Section 3: Adding content 

The content is written in markdown just like blog post are.   In  [ Part 2 Creating your first blog post](http://digitaldrummerj.me/blogging-on-github-part-2-your-first-post/), we covered the common markdown tags.

For now just add some simple markdown like below:

	## 	My Portfolio 
	
	This is a placeholder page that will eventually have information about my portfolio.  

After you have added the above text, scroll to the bottom of the page and click the commit button.

###Section 4: Previewing page 

To  view the page navigate to http://[username].github.io/portfolio

You should see something like this with your site header and color scheme.

![first page]({{ site.url}}/images/github_first-page.png)

Right now the page is published but not linked to from anywhere.

### Section 5: Adding page to menu 

Once  you are ready to share the page with your readers, you will want to add it to your main menu and have it indexed by search engines.

To tell search engines to index the page, we need to remove the front matter tag, sitemap:false.

To add it to the menu:

1. Navigate to the _layout directory in the repository 
2. Click on the _default.html page.  
3. Click on the ![github_edit_button.png](github_edit_button.png) icon to edit the file.
4. Find the main menu.  You can search for home or about to find the section 
5. Add the following line in the menu at the position you want the portfolio page link to be dispdisplay
	
          <li><a href="{{ site.url }}/portfolio">Portfolio </a></li>
          
6. We need to commit the file to the repository by scrolling to the bottom of the page and clicking on the commit button.  
7. Now navigate to your blog and the page link should show in the main menu.  Click  on the link and make sure it takes you to the page. 

In the next lesson we will build on this one by adding in a page to show the blog post by category.   

### Section 6:  Future lessons

* [Part 1 Getting Started]({{site.url}}/blogging-on-github-part-1/)
* [Part 2 Creating your first blog post]({{site.url}}/blogging-on-github-part-2-your-first-post/)
* [Part 3 Adding the ability for readers to comment on your post]({{site.url}}/blogging-on-github-part-3-adding-comments/)
* Part 4 Creating additional pages (this lesson)
* Part 5 Adding a page that list post by category
* Part 6 Adding a page that list post by month
* Part 7 Customizing the theme
* Part 8 Adding a custom Google search
* Part 9 Using your own domain name
* Part 10 How to make change locally and push them to Github