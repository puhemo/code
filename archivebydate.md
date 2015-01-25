---
layout: page
title: Post by Month
permalink: /monthview/
active: archivebydate
---

{% for post in site.posts %}
{% capture month %}{{ post.date | date: '%m%Y' }}{% endcapture %}
{% capture nmonth %}{{ post.next.date | date: '%m%Y' }}{% endcapture %}
{% if month != nmonth %}
{% if forloop.index != 1 %}</ul>{% endif %}
<h3>{{ post.date | date: '%B %Y' }}</h3><ul>
{% endif %}
<li><a href="{{ post.url }}">{{ post.title }}</a> - <time>{{ post.date | date: "%e %B %Y" }}</time></li>

{% endfor %}