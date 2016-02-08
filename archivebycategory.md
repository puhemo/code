---
title: Post by Category
permalink: /categoryview/
active: archivebycategory
sitemap: false
layout: page
---

[By Date]({{"/monthview" | prepend: site.baseurl}}) | [By Tag Cloud]({{"/tagcloudview" | prepend: site.baseurl}})

{% assign sorted_posts = site.posts | sort: 'title' %}
{% assign tagArray = "" | split: "/" %}
{% assign listingArray = "" | split: "/" %}

{% for tag in site.categories %}
    {% capture  html %}<a href="#{{ tag | first | downcase | slugify }}">{{ tag | first | downcase | replace: '-', ' ' }}({{ tag | last | size }})</a>{% if forloop.last == false %} • {% endif %} {% endcapture %}
    {% assign tagArray = tagArray | push: html %}

    {% assign listItemArray = "" | split: "/" %}
    {% capture listTitle %}<p><a name="{{ tag | first | downcase | slugify }}"></a>&nbsp;</p><h3 class="archivetitle">{{ tag | first | downcase | replace:'-', ' ' }} <i class="badge">{{ tag | last | size }}</i> </h3>{% endcapture %}
    {% assign listItemArray = listItemArray | push: listTitle %}
    {% for post in sorted_posts %}
        {%if post.categories contains tag[0]%}
            {% capture list %}<li><a href="{{ post.url | prepend: site.baseurl }}">{{ post.title }}</a> {% if post.author %} • {{ post.author }}{% endif %}{% if post.date %} • {{ post.date | date: "%B %e, %Y" }}{% endif %}</li>{% endcapture %}
            {% assign listItemArray = listItemArray | push: list %}
        {%endif%}
   {% endfor %}
   {% assign listingArray = listingArray | push: listItemArray %}
{% endfor %}

{% assign sortedtags = tagArray | sort %}                    
<div>
    {% for tag in sortedtags %}
        {{tag}}
    {% endfor %}
</div>

{% assign sortedList = listingArray | sort %}
{% for item in sortedList %}
    {% for list in item %}
{{ list }}
    {% endfor %}    
{% endfor %}
 