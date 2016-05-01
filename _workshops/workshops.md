---
title: ''
published: true
type: home
layout: workshoppage
permalink: '/workshops/index'
---

Here you will find a list of available workshop tutorials that I have created.  

{% for lab in site.workshops %}
{% if lab.type == "home"  and lab.url != "/workshops/index" %}
<a href="{{ lab.url | prepend: site.baseurl }}">{{ lab.title }}<br /></a>
{% endif %}
{% endfor %}

