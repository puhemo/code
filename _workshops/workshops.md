---
title: ''
published: true
type: home
layout: workshoppage2
permalink: '/workshops/index'

---

Here you will find a list of available workshop tutorials that I have created.  

{% for lab in (site.workshops | order: 'title') %}
{% if lab.ishome == true and lab.url != "/workshops/index") %}
<article>
<header>
<h2><a href="{{ lab.url | prepend: site.baseurl }}.html">{{ lab.title }}<br /></a></h2>
</header>
 <div>
{{ lab.excerpt | markdownify }}
  </div>
</article>
{% endif %}
{% endfor %}

