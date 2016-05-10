---
layout: post
title: 'Jekyll Part 15: Showing Liquid Code'
date: 2016-05-11 06:00
categories: ['jekyll','blogging']
published: true
series: blogging-with-jekyll
excerpt: |
    
---

{% assign imagedir = "/images/" | prepend: site.baseurl | prepend: site.url %}

Welcome to part 15 of the series on Blogging on Github.

In this lesson, we are going to look at how to have jekyll show code that includes liquid syntax.

**Length**: 10 minutes

{% include series.html %}

{% highlight js %}
    {% raw %}
        {{ test }}
        {% assign test = 'test' %}
    {% endraw %}
{% endhighlight %}

{% include series.html %}
