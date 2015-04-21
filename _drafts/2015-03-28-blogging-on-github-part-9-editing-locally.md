---
published: true
layout: post
title: 'Blogging On Github - Part 9  Editing Locally'
categories: ['Blogging', 'Github', 'How-To', 'Jekyll']
date: 2015-3-28
---

Welcome to part 9 of the series on Blogging on Github.  In this lesson, we are going to setup your computer to be able to edit your blog on your computer.

**Length**: 60 minutes

{% include githubseries_top.html %}

### Overview

Up to this point we have been using the Github web site to edit all of our files but the downside to this is that any chances you want to make show up live in your blog.


Part of having a blog is making it your own and giving it personality.  One of the easiest ways to do this is to use a custom domain name that fits the blog.  So far we have been using http://[username].github.io to get to your blog, but now we will go through the process of setting up a custom domain name like http://digitaldrummerj.me.  At first it might seem like this is going to be complicated but it is actually very easy to set this up.

### Section 1: installing Software

* Ruby
* Bundle Installer
* Git

ruby —version
sudo gem install bundler
must have Xcode install
xcode-select —install (required for nokigiri)
cd into Blog
create Gemfile

bundle install
if fails read error message, and install any missing components
bundle install
gem install nokigiri -v 1.6.6.2

Xcode command line tools


### Section 2: Getting your Blog onto your computer


### Section 3: Testing Your Blog Works on Your Computer


### Section 4: Making your first edit locally



### Section 5: Using Drafts



### Conclusion

Now users will be able to get to your blog with the domain name that you just configure.  Even if the user tries to go to the http://[username].github.io it will redirect them to your domain name.

In our next lesson, I will show you how to edit your blog post and files locally instead of using the Github web site.  This will allow you to make changes without having to publish them to the world just to test them.  You will also be able to see what a draft blog post will look like so that you can get it all looking the way you want it to before making it live to the world.

{% include githubseries_bottom.html %}