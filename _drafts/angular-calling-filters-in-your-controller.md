---
layout: post
title: Calling Filters in Your Angular Controller 
date: 2016-01-25
categories: ['angular', 'quick tips']
published: true
excerpt: | 

Here is a quick tip for how to call a filter from within your Angular controller.  Basically you inject $filter into your controller and then call your filter by calling $filter("filter name", arg1, arg2, arg3).   

---

Here is a quick tip for how to call a filter from within your Angular controller.  Basically you inject $filter into your controller and then call your filter by calling $filter("filter name", arg1, arg2, arg3).   

    <p>{{myDateVariable | myfilter : arg1 : 'arg2' }}
    
    var value = $filter("myFilter", myDateVariable, arg1, arg2);
    
      

