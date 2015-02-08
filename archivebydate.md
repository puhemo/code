---
layout: page
title: Post by Month
permalink: /monthview/
active: archivebydate
sitemap: false
---

  <div id="index">
{% for post in site.posts %}
{% unless post.next %}
<h3>{{ post.date | date: '%Y' }}</h3>
{% else %}
{% capture year %}{{ post.date | date: '%Y' }}{% endcapture %}
{% capture nyear %}{{ post.next.date | date: '%Y' }}{% endcapture %}
{% if year != nyear %}
{% if forloop.index != 1 %}</ul>{% endif %}
  <h3>{{ post.date | date: '%Y' }}</h3>
{% endif %}
{% endunless %}

{% capture month %}{{ post.date | date: '%m%Y' }}{% endcapture %}
{% capture nmonth %}{{ post.next.date | date: '%m%Y' }}{% endcapture %}
{% if month != nmonth %}
{% if forloop.index != 1 %}</ul>{% endif %}
<h2>{{ post.date | date: '%B %Y' }}</h2><ul>
{% endif %}


{% if post.link %}
  <h2 class="link-post">
    <a href="{{ site.url }}{{ post.url }}" title="{{ post.title }}">{{ post.title }}</a>
    <a href="{{ post.link }}" target="_blank" title="{{ post.title }}"><i class="fa fa-link"></i></a></h2>
{% else %}
  <h2><a href="{{ site.url }}{{ post.url }}" title="{{ post.title }}">{{ post.title }}<p class="date">{{ post.date |  date: "%B %e, %Y" }}</p></a></h2>
  <p>{{ post.excerpt | strip_html | truncate: 160 }}</p>
{% endif %}


{% endfor %}
</div>