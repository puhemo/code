---
layout: post
title: 'Jekyll Tip: Showing Liquid Code'
date: 2016-05-11 06:00
categories: ['jekyll','blogging']
published: true
excerpt: |
    There are times when you need to be able to output code snippets that contain what jekyll thinks is liquid code or the jekyll templating language.  This especially happens when you are doing Angular tutorial since &#123;&#123 &#125;&#125; is how you output properties to the UI.
---

{% assign imagedir = "/images/" | prepend: site.baseurl | prepend: site.url %}

There are times when you need to be able to output code snippets that contain what jekyll thinks is liquid code or the jekyll templating language.  This especially happens when you are doing Angular tutorial since using the double brackets &#123;&#123;  &#125;&#125; is how you output properties to the UI.

To include liquid markup in the code snippet you need to surround the code snippet with the raw and endraw tags like so

<figure class="highlight"><pre><code class="language-liquid" data-lang="liquid"><span class="p">&#123;%</span><span class="w"> </span><span class="nt">raw</span><span class="w"> </span><span class="w"> </span><span class="p">%&#125;</span>

    &#123;&#123; Notice the double brackets will be in the output &#125;&#125;

<span class="p">&#123;%</span><span class="w"> </span><span class="nt">endraw</span><span class="w"> </span><span class="p">%&#125;</span></code></pre></figure>

This will output:

{% highlight liquid %}
{% raw %}
{{ Notice the double brackets are output }}
{% endraw %}
{% endhighlight %}


