---
title: 'Ionic Workshop'
published: true
layout: workshoppage
permalink: '/workshops/ionic/index'
type: home
---

{% for lab in site.workshops %}
{% if lab.type == "ionic" %}
<a href="{{ lab.url | prepend: site.baseurl }}">{{ lab.title }}<br /></a>
{% endif %}
{% endfor %}

