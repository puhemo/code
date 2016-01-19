---
layout: post
title: Calling Filters in Your Angular Controller 
date: 2016-01-28 06:00
categories: ['angular']
published: true
excerpt: | 

    Here is a quick tip for how to call a filter from within your Angular controller.  This example assumes that you already know what a filter is and have one created.  

---

Here is a quick tip for how to call a filter from within your Angular controller.  This example assumes that you already know what a filter is and have one created.  

1. Inject $filter into your controller
2. Call your filter by calling $filter("filter name", arg1, arg2, arg3).   

Calling a filter from your view:

{% raw %}
    <p>{{myDateVariable | myfilter : arg1 : 'arg2' }}</p>
{% endraw %}
    
Calling the same filter from your controller:
    
    var value = $filter("myFilter", myDateVariable, arg1, arg2);