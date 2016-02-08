---
title: Post by Category
permalink: /categoryview/
active: archivebycategory
sitemap: false
layout: page
---

[By Date]({{"/monthview" | prepend: site.baseurl}}) | [By Tag Cloud]({{"/tagcloudview" | prepend: site.baseurl}})

{% assign tags = site.categories | sort %}
{% assign sorted_posts = site.posts | sort: 'title' %}
{% assign tagArray = "" | split: "/" %}
{% assign tagArrayDowncased = "" | split: "/" %}
{% for tag in site.categories %}
    {% assign tagDowncased = tag | first | downcase | split: "," %}
    {% assign tagArrayDowncased = tagArrayDowncased | push: tagDowncased %} 
    {% capture  html %}<a href="#{{ tag | first | downcase | slugify }}">{{ tag | first | downcase | replace: '-', ' ' }}({{ tag | last | size }})</a>{% if forloop.last == false %} • {% endif %} {% endcapture %}
    {% assign tagArray = tagArray | push: html %}    
{% endfor %}

{% assign tagsSorted = tagArrayDowncased | sort %}

{% assign sortedtags = tagArray | sort %}        
<div>
    {% for tag in sortedtags %}
        {{tag}}
    {% endfor %}
</div>

<p>&nbsp;</p>

{% for tag in tags %}
<p><a name="{{ tag | first | slugify }}"></a>&nbsp;</p>
<h3 class="archivetitle">{{ tag | first | replace:'-', ' ' }} <i class="badge">{{ tag | last | size }}</i> </h3>

<ul>{% for post in sorted_posts %}{%if post.categories contains tag[0]%}<li><a href="{{ post.url | prepend: site.baseurl }}">{{ post.title }}</a> {% if post.author %} • {{ post.author }}{% endif %}{% if post.date %} • {{ post.date | date: "%B %e, %Y" }}{% endif %}</li>{%endif%}{% endfor %}</ul>
{% endfor %}