---
published: true
layout: post
title: Using Ionic behind a proxy server
categories: [proxy]
---

I ran into an issue today on the vagrant IonicBox when I tried to create a new Ionic project at work behind the firewall/proxy even with all of the configurations for npm, git, bower, and bash setup for the proxy as detailed at [http://digitaldrummerj.github.io/proxy-configurations/](http://digitaldrummerj.github.io/proxy-configurations/).

Luckily, Ionic had a fix for this already.  All I had to do was put PROXY=http://myserver:myport in front of the ionic start command.

       PROXY=http://myserver:myport ionic start todo blank
       
 