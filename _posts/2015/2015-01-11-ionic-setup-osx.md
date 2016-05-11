---
layout: post
title: Ionic - Setup on OSx
published: true
categories: [ionic]
date: 2015-01-11 20:45:35
excerpt: | 
    If you are like me and just starting to work with the Ionic Framework and don’t already have a machine setup to do Android, iOS, Node, etc development then many of the guides out there leave out a number of steps that you need to do in order to get everything working.
    
    Even being a windows user I was able to pretty easily get Ionic working on a Mac.  The only difference between the Windows setup and the OSx setup is that you can only add iOS to Ionic on a Mac.  
---

If you are like me and just starting to work with the Ionic Framework and don’t already have a machine setup to do Android, iOS, Node, etc development then many of the guides out there leave out a number of steps that you need to do in order to get everything working.

Even being a windows user I was able to pretty easily get Ionic working on a Mac.  The only difference between the Windows setup and the OSx setup is that you can only add iOS to Ionic on a Mac.  

## Software to be installed

- [NodeJS](https://nodejs.org)
- [Ant](https://chocolatey.org/packages/ant)
- [JDK7](https://chocolatey.org/packages/jdk7)
- [Android SDK](https://chocolatey.org/packages/android-sdk)
- [Android Studio](https://chocolatey.org/packages/AndroidStudio)
- [Google Chrome](https://chocolatey.org/packages/GoogleChrome)
- Npm Modules: cordova, gulp and ionic
- [Genymotion](https://www.genymotion.com/) (Android emulator replacement)
- [Webstorm](https://www.jetbrains.com/webstorm/) (optional)
- Github for OSx (optional)
- XCode

## General Install Steps
1. Install homebrew and node js via [http://www.johnpapa.net/how-to-use-npm-global-without-sudo-on-osx/](http://www.johnpapa.net/how-to-use-npm-global-without-sudo-on-osx/)
1. NPM packages
	- npm install -g cordova
	- npm install -g ionic
    - npm install -g gulp
1. Google Chrome
    	- Download from [https://www.google.com/chrome/browser/desktop/](https://www.google.com/chrome/browser/desktop/)

## Android Setup Steps
1. JDK 7
	- Download from [http://www.oracle.com/technetwork/java/javase/downloads/jdk7-downloads-1880260.html](http://www.oracle.com/technetwork/java/javase/downloads/jdk7-downloads-1880260.html)
	- After install from the terminal create ~/.bash_profile if it doesn't already exist.  You can use touch ~/.bash_profile to create the file.
    - Open up either vi or nano and add the following line:    

{% highlight  text %}
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_72.jdk/Contents/Home
{% endhighlight %}

1. Android Studio
	- Download from [http://developer.android.com/sdk/index.html#Other](http://developer.android.com/sdk/index.html#Other)
1. Ant
	- Download from [http://ant.apache.org/bindownload.cgi](http://ant.apache.org/bindownload.cgi)
    - Unzip to /users/[Your Username]/Development/ into a apache-ant-1.9.4
    - Open ~/.bash_profile and add the following line:

{% highlight  text %}
export ANT_HOME=/users/jpjames/Development/apache-ant-1.9.4
{% endhighlight %}

1. Android SDK
	* Download from [http://developer.android.com/sdk/index.html#Other](http://developer.android.com/sdk/index.html#Other_
    - Unzip to /users/[Your username]/Development
	- Open ~/.bash_profile and add the following line:

{% highlight  text %}
export PATH=${PATH}:/users/[Your UserName]/Development/android-sdk-macosx/tools:/users/[Your Username]/Development/android-sdk-macosx/platform-tools:${ANT_HOME}/bin
{% endhighlight %}

1. Download correct Android API
	- in terminal type source ~/.bash_profile to load the ~/.bash_profile changes.
    - type android from terminal.  If everything is working correct it will open up the Android SDK Manager.
	- Install API 22  with SDK Platforms and Arm Image checked 
1. Configure Android Emulator
	* In terminal type android avd.  If everything is working correct it will open up the Android AVD Manager.
	* Click the create button and add at least 1 device to emulate
1. Configure Genymotion Setup
    *  After Genymotion is installed, open up the Genymotion UI and click on the Add Button.
    * Then click the Sign in button and follow the login instructions to login with the account that you create as part of the Genymotion download.
    * After you are logged in, select from the Android Version drop down 4.4.4
    * From the Device model drop down select a device type
    * Then select a device from the available list
    * Click the Next button.
    * Click the Next button and wait for the device to download
    * Click the Finish button.

## iOS Setup Steps
10. Install Xcode from app store.  This will take awhile since it is ~2 gigs in size.
	- Once install is completed, open xcode and accept the license
11. Install the IOS Simulator that Ionic will use.

{% highlight  text %}
npm install -g ios-sim
{% endhighlight %}

## Verifying that everything works


1. Open terminal
1. Navigate the directory where you store you development projects (I use /users/[Your Username]/projects)
1. From c:\projects type: ionic start todo blank
1. cd into c:\projects\todo  (directory was created by the ionic start command)
1. Run the commands:

{% highlight  text %}
ionic platform add android
ionic platform add ios
{% endhighlight %}

1. Run the command:

{% highlight  text %}
ionic build android
ionic build ios
{% endhighlight %}

1. If using emulator run the command:
    * Note: The Genymotion emulator is seen as a device and not an emulator.

{% highlight  text %}
ionic emulate android
ionic emulate ios
{% endhighlight %}

1. If running on a device run the command:
    * For Android, if using the Genymotion emulator, make sure to start the Genymotion device you downloaded before running the command below.  You can start the device by selecting the device that you downloaded and clicking the start button.
    * For iOS: In order to run on an iOS device you must go through the Apple provisioning process.

{% highlight  text %}
ionic run android
ionic run ios
{% endhighlight %}
