---
published: false
title: Ionicbox and the missing instructions
layout: post
tags: [ionic]
categories: [programming, mobile-development]
---

Today, I decided to try out the [Ionicbox](https://github.com/driftyco/ionic-box) so that I could see what the experience was like and be able to better explain it to newbies.  Ionicbox is a a pre-configured virtual machine that has everything installed that you need to do development using the [Ionic Framework](http://www.ionicframework.com/).

The first thing I noticed was that the at IonicBox only boots to a command prompt and there are no other instructions at [https://github.com/driftyco/ionic-box](https://github.com/driftyco/ionic-box) on how to use the virtual machine.  Luckily, my friend [Troy Miles](https://twitter.com/therockncoder) has the missing instructions on how to use Ionicbox  [http://therockncoder.blogspot.com/2014/10/getting-started-building-mobile-apps.html](http://therockncoder.blogspot.com/2014/10/getting-started-building-mobile-apps.html).  

Quick Steps
- Install [Virtualbox](http://www.virtualbox.org)
- Install [Vagrant](http://www.vagrantup.com)
- Open Command Prompt
- Create a directory to hold the vagrant configuraton file for the IonicBox
- Navigate to the created directory
- run vagrant init drifty/ionic-android
- In the directory a file called VagrantFile was created.  Open it in notepad or your favorite text editor
- Add to forward the web server port: config.vm.network :forwarded_port, host: 8100, guest: 8100
- Add to forward the live reload port: config.vm.network :forwarded_port, host: 35729, guest: 35729
- Add folder from host to guest.  make sure c:\projects exists: config.vm.synced_folder "c:\\projects", "/home/vagrant/projects"
- Add to give the machine a name besides the generated one: config.vm.hostname = "IonicBox"
- Find the virtualbox configuration section and replace it with the section below 


	# -*- mode: ruby -*-
	# vi: set ft=ruby :
	
	Vagrant.configure(2) do |config|
	config.vm.box = "drifty/ionic-android"
	config.vm.hostname = "IonicBox"
	config.vm.boot_timeout = 600
	
	config.vm.network :forwarded_port, host: 8100, guest: 8100
	config.vm.network :forwarded_port, host: 35729, guest: 35729
	
	config.vm.synced_folder "c:\\projects", "/home/vagrant/vagrant_projects"
	
	config.vm.provider "virtualbox" do |vb|
		vb.gui = false
		vb.customize ["modifyvm", :id, "--vram", "128"]
		vb.customize ["modifyvm", :id, "--clipboard", "bidirectional"]
		vb.customize ["modifyvm", :id, "--usb", "on"]
		vb.customize ["usbfilter", "add", "0", "--target", :id, "--name", "android", "--vendorid", "0x18d1"]
		vb.memory = 2048
		vb.cpus = 2	 
		
		vb.name = "IonicBox Linux"
	
	end
	end
	
	
	
