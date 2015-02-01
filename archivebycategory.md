---
layout: page
title: Post by Category
permalink: /categoryview/
active: archivebycategory
sitemap: false
---
<article>
  <section class="containerOuter pageHeader">
    <section class="containerInnerNarrow">


{% assign tags = site.categories | sort %}
{% for tag in tags %}
 <span class="site-tag">
    <a href="#{{ tag | first | slugify }}">
            {{ tag[0] | replace:'-', ' ' }} ({{ tag | last | size }})
    </a>
</span>
{% endfor %}
</section>
</section>


<div id="index">

{% for tag in tags %}
<a name="{{ tag[0] }}"></a><h2>{{ tag[0] | replace:'-', ' ' }} ({{ tag | last | size }}) </h2>
{% assign sorted_posts = site.posts | sort: 'title' %}
{% for post in sorted_posts %}
{%if post.categories contains tag[0]%}
<article>
  <h2><a href="{{ site.url }}{{ post.url }}" title="{{ post.title }}">{{ post.title }} - <span>{{ post.date |  date: "%B %e" }}</span></a></h2>
   <p>{{ post.excerpt | strip_html | truncate: 160 }}</p>
</article>
{%endif%}
{% endfor %}

{% endfor %}
</div>

