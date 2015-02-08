---
published: true
layout: post
title: Npm, Bower, Git, and Bash Proxy Configurations
tags: [setup, proxy, bower, git, npm, ionic]
categories: [programming, proxy, nodejs, npm, bash, bower]
date: 2015-02-01 20:45:35
excerpt: "How to set proxy configurations for various tools"
---

**Updated 2015-Feb-01**:  Added running source command for Bash and Ruby Gems section

When you are using npm, bower, and git when behind a proxy server you have to do a little bit of configuration.  Luckily it is super easy to do these configurations.  These instructions are for a windows machine.  All of the files below will need to be created in your user home directory c:\users\[Your User Name].

All of these files start with a period and have no file extension.  Unfortunately you can create these in Windows Explorer and it doesn't support starting a file with a period.  You can create them though in notepad or your text editor of choice.  Just make sure a file extension doesn't get added to the file.

## Bash Shell
 File Name: .bash_profile or .bashrc


	export http_proxy=[Your Proxy]:[Proxy Port]
	export https_proxy=[Your Proxy]:[Proxy Port]
	export npm_config_proxy=[Your Proxy]:[Proxy Port]
	export npm_config_https_proxy=[Your Proxy]:[Proxy Port]

Note:   After updated the .bash_profile or .bashrc, you should run one of teh following commands to make the configuration active for the current session.

	source ~/.bashrc
	or
	source ~/.bash_profile


## Bower
 File Name:  .bowerrc.


	{
		"proxy":"http://[Your Proxy]:[Proxy Port]",
		"https-proxy":"http://[Your Proxy]:[Proxy Port]"
	}
      
## Git
 File Name: .gitconfig


	[http]
		proxy = http://[Your Proxy]:[Proxy Port]
	[https]
		proxy = http://[Your Proxy]:[Proxy Port]

## NPM
 File Name: .npmrc


	proxy=http://[Your Proxy]:[Proxy Port]
	https-proxy=http://[Your Proxy]:[Proxy Port]
    
## Ruby Gem Install

If you have set the proxy in the .bash_profile or .bashrc, then Ruby should pick it up.

If you need to manually set it

	export http://[Your Proxy]:[Proxy Port]
	sudo gem install [your gem name]

