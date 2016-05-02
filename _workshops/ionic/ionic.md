---
title: 'Ionic Workshop'
published: true
layout: workshoppage
permalink: '/workshops/ionic/index'
type: home
---

<!-- DOCTOC SKIP -->

This workshop is designed to be an all day workshop.  In the workshop it is a mix of lecture and hand-on labs.  You will be building a simple "Personal Project Task Tracking" that will demonstration many of the ionic components.

Note that the workshop can be modified to run as a half day workshop as well.

{% assign labs = site.workshops | sort: 'title' %}
{% for lab in labs %}
{% if lab.type == "ionicoverview" %}
<a href="{{ lab.url | prepend: site.baseurl }}">{{ lab.title }}<br /></a>
{% endif %}
{% endfor %}


## Hands-On Labs

{% assign labs = site.workshops | sort: 'title' %}
{% for lab in labs %}
{% if lab.type == "ionic" %}
<a href="{{ lab.url | prepend: site.baseurl }}">{{ lab.title }}<br /></a>
{% endif %}
{% endfor %}


## Extra Hands-On Labs

These are labs that are not planned into the workshop schedule but still are useful to do on your own or if time permits during the workshop

{% assign extras = site.workshops | sort: 'title' %}
{% for lab in extras %}

{% if lab.type == "ionicextra" %}
<a href="{{ lab.url | prepend: site.baseurl }}">{{ lab.title }}<br /></a>
{% endif %}
{% endfor %}

