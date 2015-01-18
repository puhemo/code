---
published: true
title: Ionicbox Notes and things it missed
layout: post
tags: [ionic]
categories: [programming, mobile-development]
---

I am getting ready to present on Ionic and decided that I needed to try out the IonicBox to see how it worked and if it did really make it easier to get up to speed. The first thing I noticed was that IonicBox only boots to a command prompt.   In this day and age, users don't want to just work from a command prompt or have to learn all of the linux commands or use vi as their editor.  There is no reason that you need to do all of this either as Ubuntu has a graphic UI.  There is 2 options:  1.) Setup an XWindows server 2.) Install the Ubuntu desktop (preferred option).  Even after you get up the UI, there is still some configuration work to do that I detail later on in this post.

## Install a GUI

### First Option: Setup XWindows Server

The first option is to setup an XWindows server on your Windows host but why not just use the VirtualBox GUI and the GUI that comes with Ubuntu.  If you do decided that you want to setup an XWindows Server on your Windows machine, here is some helpful instructions [http://forum.ionicframework.com/t/run-android-emulator-in-ionic-vigrant/9102](http://forum.ionicframework.com/t/run-android-emulator-in-ionic-vigrant/9102).  

### Second Option: Install Ubuntu Desktop

The second option is the preferred option which is to install the Ubuntu desktop and just use the Virtualbox GUI.  This also keeps everything native to VirtualBox and doesn't require you to install anything onto your windows machine.

Full install including stuff like open office
	
	sudo apt-get install ubuntu-desktop
    
Install just the desktop without all of the add-on software.

	sudo apt-get install --no-install-recommends ubuntu-desktop
    
You may get some failures connecting to the apt-get repository and download stuff.  If you do, then run sudo apt-get update followed by the sudo command you used above.


Once the ubuntu-desktop successfully installs run:
	sudo passed ubuntu 
	sudo reboot
	Login to the GUI with the vagrant account.

## Post GUI Install Steps

Now you will want to install Google Chrome, JetBrains WebStorm and configuration the Android SDK.

### Google Chrome

You will want to install Google Chrome to add in debugging. Get Google Chrome from [http://www.google.com/chrome/] (http://www.google.com/chrome/)

### Webstorm Install and Configuration

Get WebStorm from [https://www.jetbrains.com/webstorm/](https://www.jetbrains.com/webstorm/)
- To install Webstorm unzip it to a directory
- Then run the ./bin/webstorm.sh file to launch WebStorm.

To install a shortcut into the launch run the following commands:
	
    sudo apt-get install --no-install-recommends gnome-panel
	sudo gnome-desktop-item-edit /usr/share/applications/ --create-new

This will launch a UI to create the shortcut.  Fill out the values.

	Type: Application
	Name: WebStorm
	Command: /[Your WebStorm Directory]/bin/webstorm.sh
	Comment: Any Comment

In my case this didn't add a shortcut to the launch but when I clicked on the 1st button in the launcher to "Search Computer and Online Sources", typed in Webstorm, then it showed up and I was able to launch it.  Once it was launched, I could right-click on the icon in the launch bar and tell it to lock it to the launch bar.  

### Install Android Emulator and Configure it

The Android emulator is also not setup.  You will want to open up a terminal and type android to launch the Android SDK Manager.  Make sure to download the ARM Image for API 19.  Unselect any other API that it wants to install.  Any upgrades for already installed Android software is ok.

After this has completed, would will want to go under the Tools menu in the Android SDK Manager and select AVD Manager.  You will want to install at least one device to emulate.  It won't be long though before you get tired of the slowness of the emulator and move to testing in Chrome and one a device.

### Bonus: Add Terminal to Launcher
You will also want to do another "Search Computer and Onlline Sources" and type terminal.  Once the Terminal is launched pin it to the desktop.  This will be helpful since a lot of commands are run in a terminal for Ionic and git.  
