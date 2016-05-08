---
title: 'Ionic Workshop '
published: true
layout: workshoppost2
permalink: '/workshops/ionic/index'
type: ionic
ishome: true
excerpt: |
    This workshop will introduce you using the Ionic Framework to build a hybrid mobile application that you can release through the Apple, Google and Microsoft stores.  The workshop will be a mix of lecture to introduce concepts and then a lab to reinforce those concepts.   By the end of this workshop you will have a completed application that stores its data in the Cloud and is ready to be deployed to devices.
todo: |
    * Validate lengths for each lab
    * generate pdf for all of labs (optional)
    * make sure that all labs have todo removed from them
    * Add links to slides
    * update TOC
    * Remove Git tab sections
---


<!-- DOCTOC SKIP -->



Welcome to my [Ionic](http://ionicframework.com) workshop.  This workshop is designed to be a hands-on all day workshop.  There will be a mix of lecture to introduce concepts and then a lab to reinforce those concepts.

  By the end of this workshop you will have a completed application that stores its data in the Cloud and is ready to be deployed to devices.

> Note that the workshop can be modified to run as a half day workshop as well.

For these labs to work you need to setup your machine for [Ionic](http://ionicframework.com) development.  The instructions do vary depending on if you are on Windows or Mac.  Linux is supported for development but we are not going to be using it in this workshop.

<div class="more-link">
<p>

{% for lab in (site.workshops | where: "type", page.type | order: 'title') %}
{% if lab.type == page.type and lab.order == 1 %}
<a href="{{lab.url}}">Start {{lab.title}} &raquo;</a>
{% endif %}
{% endfor %}
</p>
</div>