---
published: false
layout: post
title: 'Blogging On Github - Part 10 -  Installing Jekyll On OSx and Linux'
categories: ['Blogging', 'Github', 'How-To', 'Jekyll']
date: 2015-09-09 06:00
series: blogging-on-github 

---

Welcome to part 9 of the series on Blogging on Github.  

In this lesson, we are going to setup your Windows computer to be able to edit your blog on your computer.

**Length**: 60 minutes

{% include series.html %}

### Overview

Up to this point we have been using the Github web site to edit all of our files but the downside to this is that any chances you want to make show up live in your blog before you have had a chance to test them.  

Instead, it is better if you can test out all of your changes and review your blog post before letting the world see them.  It will also let you have draft post where you can see them locally but on github they will not be visible.

Note that Jekyll is not officially supported on Windows but it does work and I have not had any issues with it.

### Section 1: installing Software

I am a big fan of Chocolatey and luckily a good majority of the software that we need had a chocolatey package so I wrote a gist file that we will install using Boxstarter.

###Section 1.1: Ubuntu

####Installing NodeJs

First we are going to install NodeJS using the Node.js Version Manager (NVM) using these [commands](https://www.digitalocean.com/community/tutorials/how-to-install-node-js-on-an-ubuntu-14-04-server)

	sudo apt-get update
	sudo apt-get install build-essential libssl-dev
	curl https://raw.githubusercontent.com/creationix/nvm/v0.16.1/install.sh | sh
	source ~/.profile
	
	nvm install 0.12.7 # See All Versions nvm ls-remote
	node -v
	

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


bundle exec jekyll serve


1. If there were no errors, you are now ready to install jekyll.



### Section 2: Getting your Blog onto your computer

In this section, you will clone the blog repo from github and install jekyll.

1. Open a command prompt 
1. Create the directory c:\projects

		
		mkdir ~/projects
	
1. cd into c:\projects

		 
		cd ~/projects
		  
1. Clone your github blog repo to your local machine with the "git clone [Repo Name]" command.  Below is the example if you were to clone the jekyll repo for this blog series.

		git clone https://github.com/digitaldrummerj/jekyllforblogseries.git 

1. cd into the repo that you just cloned

		cd jekyllforblogseries
	
1. Make sure that you have a GemFile with no file extension in the root of your repo with the following contents

		source 'https://rubygems.org'
		gem 'github-pages'
		gem 'jekyll-redirect-from'

1. Run the command to install the github-pages gem which has all of the required modules to make jekyll work and the jekyll redirect from plugin.  It is one of the few plugins that Github pages supports and allows you to move pages around and have them automatically redirect so that people with bookmarks can still find a moved page.   

		bundle install


Now we have jekyll installed.  Time to test it out

### Section 3: Testing Your Blog Works on Your Computer

Now that we have everything installed for jekyll it is time to test it out.  

1. From a command prompt in your blog repo directory run the following command to tell jekyll to build and run the web site locally
 
		jekyll serve 

1. If it build successfully you will see something like this

![Jekyll Serve Success]({{site.url}}/images/BloggingOnGitHub/10/jekyllserve.png)

1. Now if you open up your browser and navigate to http://localhost:4000 you will see you blog.

However, by default your _config.yml file will be set for production which will cause any place that you have referenced the site.url to not working on your local machine.  You don't want to change your _config.yml file though for development since you will accidentally check it in at some point and break your blog.  Instead we can tell jekyll to use multiple configuration files.  When you load multiple files it will load them in order and then override any settings from a previously loaded config.

1. Create a new file in the root of your repo called _configdev.yml
1. In the _configdev.yml add the following lines to set the url, turn off disqus/google analytics and google search.  

	# then add this to the url as well "/repository-name"
	url: http://localhost:4000
	disqus:
	disquscommentcount: 
	google_analytics: 
	google_search: 
 
 1. If your jekyll serve is still running do a ctrl+c to stop it.
 1. Now run the following command to tell jekyll the config yml files to load
 
 	jekyll serve --config _config.yml,_configdev.yml
	 
1. 	If it build successfully you will see something like this

![Jekyll Serve Success]({{site.url}}/images/BloggingOnGitHub/10/jekyllserve_multipleconfigs.png)
 
1. Now if you open up your browser and navigate to http://localhost:4000 you will see you blog and any place that reference site.url will be working..


### Conclusion

Now you are ready to do all of your editing locally and  test it out before the world gets to see it. 

In our next lesson, I will show you how to create draft blog post that will only show on your local machine so that you don't have to either clutter up your post directory with drafts or worry about accidentally publishing an unfinished article.

{% include series.html %}
