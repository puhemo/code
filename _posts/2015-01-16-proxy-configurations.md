---
published: true
layout: post
title: Npm, Bower, Git, and Bash Proxy Configurations
---

When you are using npm, bower, and git when behind a proxy server you have to do a little bit of configuration.  Luckily it is super easy to do these configurations.  These instructions are for a windows machine.  All of the files below will need to be created in your user home directory c:\users\[Your User Name].

All of these files start with a period and have no file extension.  Unfortunately you can create these in Windows Explorer and it doesn't support starting a file with a period.  You can create them though in notepad or your text editor of choice.  Just make sure a file extension doesn't get added to the file.

## Bash Shell
 File Name: .bash_profile


	export http_proxy=[Your Proxy]:[Proxy Port]
	export https_proxy=[Your Proxy]:[Proxy Port]
	export npm_config_proxy=[Your Proxy]:[Proxy Port]
	export npm_config_https_proxy=[Your Proxy]:[Proxy Port]
    
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
    

