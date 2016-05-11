---
layout: post
title: 'Jekyll Tip: Styling Your Jekyll Markdown'
date: 2016-05-16 06:00
categories: ['jekyll','blogging']
published: true
excerpt: |
    
---

{% assign imagedir = "/images/" | prepend: site.baseurl | prepend: site.url %}

There are times where you want to add a little more style to the jekyll markdown output but you don't want to have to write out all of the html to do.  With the kramdown markdown parser that Jekyll uses you can add extra metadata tags in your markdown

## list

**markdown**

    * {:.done}done - Completed this
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