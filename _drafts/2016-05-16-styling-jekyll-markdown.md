---
layout: post
title: 'Jekyll Tip: Styling Your Jekyll Markdown'
date: 2016-05-16 06:00
categories: ['jekyll','blogging']
published: true
excerpt: |
    
---

{% assign imagedir = "/images/" | prepend: site.baseurl | prepend: site.url %}

As I was writing some tutorials recently I wanted to be able to style the html elements that Jekyll  outputs with different css classes.  

For example I wanted to use a blockquote both items to be aware of and warnings to watch out for.   For the regular note I wanted it to have a nice blue border whereas the warning u wanted to have a red border.  This gives the user a better experience by being able to easily find items that might give them trouble.  

With the kramdown markdown parser that Jekyll uses you can easily add these css classes without having to write it the html code.  

##paragraph

**markdown**

    {:.fake-h2}
    This will be styled as a p tag with the css class fake-2

**output**

    <p class="fake-h2">Objective</p>

## list

**markdown**

    * {:.done} done - Completed this
    * Not done yet

**output**

    <ul>
        <li class="done">done - Completed this</li>
        <li>Not done yet</li>
    </ul>

## blockquotes

**markdown**

    > The npm install command will take several minutes to run depending on internet speed
    {:.warning}
    {:title="my title"}
    {: #myid }

**output**

    <blockquote class="warning" id="myid" title="my title">
        The npm install command will take several minutes to run depending on internet speed
    </blockquote>

## surround text

**markdown**

{% highlight liquid %}
{:.ruby}
    some Code here
{% endhighlight %}

**output**

    <div class="ruby highlighter-rouge"><pre class="highlight"><code>some Code here
    </code></pre>
    </div>

## inline

**markdown**

    This *is*{:.underline} some `code`{:#id}{:.class}.
    A [link](google.com){:rel='something'} and some **tools**{:.tools}.

    this *is italic*{::}*marked*{:.special} text


**output**

    <p>This <em class="underline">is</em> some <code id="id" class="class highlighter-rouge">code</code>.
    A <a href="google.com" rel="something">link</a> and some <strong class="tools">tools</strong>.</p>

    <p>this <em>is italic</em><em class="special">marked</em> text</p>