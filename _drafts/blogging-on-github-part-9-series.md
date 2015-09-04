
---
layout: post
title: 'Blogging On Github - Part 9 - Series'
series: blogging-on-github 
date: 2015-08-20 06:00
categories: ['Blogging', 'Github', 'How-To', 'Jekyll']
published: false
---

Why want it?

Show screenshot

How to implement

Update Jekyll repo


Add css for panel


Code below for series.html



{% if page.series %}

{% assign count = '0' %}
{% assign idx = '0' %}
{% for post in site.posts reversed %}
	{% if post.series == page.series %}
		{% capture count %}{{ count | plus: '1' }}{% endcapture %}
		{% if post.url == page.url %}
			{% capture idx %}{{count}}{% endcapture %}
		{% endif %}
	{% endif %}
{% endfor %}


<div class="panel seriesNote">
	<p>This article is <strong>Part {{ idx }}</strong> in a <strong>{{ count }}-Part</strong> Series.</p>
	<ul>
	{% assign count = '0' %}
	{% for post in site.posts reversed %}
	{% if post.series == page.series %}
		{% capture count %}{{ count | plus: '1' }}{% endcapture %}
		<li>Part {{ count }} - 
		{% if page.url == post.url %}
			This Article
		{% else %}
			<a href="{{post.url}}">{{post.title}}</a>
		{% endif %}
		</li>
	{% endif %}
	{% endfor %}
	</ul>
</div>
{% endif %}