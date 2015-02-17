---
layout: post
title: 'Blogging On Github - Part 6 Adding Post by Date Page'
date: 2015-02-17
categories: ['Blogging', 'Github', 'How-To', 'Jekyll']
published: true
---

Welcome to part 6 of the series on blogging on github.  In this lesson we will go through creating a page to show the blog post by date.
 
**Lesson Length**:  15 minutes

**Other Lessons in the Series**

* [View Part 1 Getting Started]({{site.url}}/blogging-on-github-part-1/)
* [View Part 2 Creating your first blog post]({{site.url}}/blogging-on-github-part-2-your-first-post/)
* [View Part 3 Adding the ability for readers to comment on your post]({{site.url}}/blogging-on-github-part-3-adding-comments/)
* [View Part 4 Creating additional pages]({{ site.url}} /blogging-on-github-part-4-creating-additional-pages/)
* [View Part 5 Adding a page that list post by category ]({{ site.url}}/blogging-on-github-part-5-adding-a-category-page/)

### Overview

A typical blog has a way for your readers to view posts by either category or date, so that they can look at your archives without having to go through the blog post one by one.  In the last lesson, we added the post by category page.  Now it is time to add the post by date page. 

### Section 1: Creating the Date Page

If you have been following along with the other lessons in the series, this should be familiar to you.

1. Open a web browser and navigate to your [username].github.io repository.

1. Click on the + button to add a new file

    ![Github Plus Button]({{site.url}}/images/github_add_button.png)

1.  Name the file archivebydate.md

    ![Github Name the New File archivebydate.md]({{site.url}}/images/github_part_5_archivebydate_file_name.png)


### Section 2: Adding the Metadata

Add the following front matter to the top of the archivebycategory.md file.

    {% raw %}
        ---
        layout: page
        title: Post by Date
        permalink: /monthview/
        sitemap: false
        ---
    {% endraw %}

### Section 3:  Html to Display Post

After the front matter, add the following code to display the post by Year and Month.  
    {% raw %}
    <div id="index">
{% for post in site.posts %}
{% unless post.next %}
<h2>{{ post.date | date: '%Y' }}</h2>
{% else %}
{% capture year %}{{ post.date | date: '%Y' }}{% endcapture %}
{% capture nyear %}{{ post.next.date | date: '%Y' }}{% endcapture %}
{% if year != nyear %}
{% if forloop.index != 1 %}</ul>{% endif %}
  <h2>{{ post.date | date: '%Y' }}</h2>
{% endif %}
{% endunless %}

{% capture month %}{{ post.date | date: '%m%Y' }}{% endcapture %}
{% capture nmonth %}{{ post.next.date | date: '%m%Y' }}{% endcapture %}
{% if month != nmonth %}
{% if forloop.index != 1 %}</ul>{% endif %}
<h2>{{ post.date | date: '%B %Y' }}</h2><ul>
{% endif %}


{% if post.link %}
  <h3 class="link-post">
    <a href="{{ site.url }}{{ post.url }}" title="{{ post.title }}">{{ post.title }}</a>
    <a href="{{ post.link }}" target="_blank" title="{{ post.title }}"><i class="fa fa-link"></i></a></h3>
{% else %}
  <h3><a href="{{ site.url }}{{ post.url }}" title="{{ post.title }}">{{ post.title }}<p class="date">{{ post.date |  date: "%B %e, %Y" }}</p></a></h3>
  <p>{{ post.excerpt | strip_html | truncate: 160 }}</p>
{% endif %}


{% endfor %}
</div>
    {% endraw %}

###  Section 4: Viewing the Category Page

1. After you have added the above text, scroll to the bottom of the page, add your commit note, and    click the commit button.

    ![Github Commit archivebydate.md]({{site.url}}/images/github_part_5_commit_archivebydate.png)

1. To  view the category page, navigate to http://[username].github.io/monthview

1. Your page should look like the following but with your avatar, site name and description in the header of the page.

    ![month view screenshot]({{ site.url}}/images/github_part_5_archivebydate_in_browser.png)

1. Right now the page is published but not linked to from anywhere.  In the next section we will add it to the header section of the page.

### Section 5: Adding Month View into Header

We are going to add the "show by date" link into the header section next to the link to view by category that we added in the [previous lesson]({{ site.url}}/blogging-on-github-part-5-adding-a-category-page/). 

1. Go into the _layouts directory by clicking on _layouts

1. Click on the default.html file to open it.

1. Click on the ![github_edit_button.png]({{site.url}}/images/github_edit_button.png) icon to edit the file.

1. In the &lt;div id="archives"&gt; tag that we added previously, add the following html snippet after the category view link.

        {% raw %}
            or <a
                    title="The complete archive of {{ site.name }}'s Blog by month" href="{{ site.url}}/monthview">date</a>
      
        {% endraw %}

1. Scroll down to the bottom, add the commit comment, and click on the commit change button.

    ![Commit default.html changes]({{site.url}}/images/github_part_6_commit_default.png)

1. Now go view your blog's home page at http://[username].github.io/.  You should now see the "browse by category or date" link in the header.

    ![Blog's Home Page with Browse By Category or Date Link in Header]({{site.url}}/images/github_part_6_browse_by_category_or_date_in_header.png)

### Conclusion

With just a few simple steps, you were able to add  the post by month page and put it in the header.  In the next lesson we will discuss how the theming works and how to modify the theme.

### Series Lessons

* [Part 1 Getting Started]({{site.url}}/blogging-on-github-part-1/)
* [Part 2 Creating your first blog post]({{site.url}}/blogging-on-github-part-2-your-first-post/)
* [Part 3 Adding the ability for readers to comment on your post]({{site.url}}/blogging-on-github-part-3-adding-comments/)
* [Part 4 Creating additional pages](http://digitaldrummerj.me/blogging-on-github-part-4-creating-additional-pages/)
* [Part 5 Adding a page that list post by category]({{ site.url}}/blogging-on-github-part-5-adding-a-category-page/)
* Part 6 Adding a page that list post by month (this lesson)
* Part 7 Customizing the theme
* Part 8 Adding a custom Google search
* Part 9 Using your own domain name
* Part 10 How to make change locally and push them to Github
* Part 11 Pro Tips