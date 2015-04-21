---
layout: post
title: "Ionic - How to setup on Windows"
published: true
tags: [ionic]
categories: [programming, mobile-development, ionic]
date: 2015-01-11 20:45:35
---

If you are like me and just starting to work with the [Ionic Framework](http://www.ionicframework.com) and don't already have a machine setup to do Android, iOS, Node, etc development then many of the guides out there leave out a number of steps that you need to do in order to get everything working.  

It is really easy to get everything working though once you know the steps.  Since I am a Windows user and love to automate work that is easily repeatable, I used  [Chocolatey](http://www.chocolatey.org) and [Boxstarter](http://www.boxstarter.org) to automate the setup for the Ionic Framework.

### Software to be installed

- [NodeJS](https://chocolatey.org/packages/nodejs.install)
- [Git](https://chocolatey.org/packages/git)
- [Ant](https://chocolatey.org/packages/ant)
- [JDK7](https://chocolatey.org/packages/jdk7)
- [Android SDK](https://chocolatey.org/packages/android-sdk)
- [Android Studio](https://chocolatey.org/packages/AndroidStudio)
- [Google Chrome](https://chocolatey.org/packages/GoogleChrome)
- Cordova using npm
- gulp using npm
- ionic 
- Ruby (optional)
- Sass (optional)
- Webstorm (optional)
- Github for Windows (optional)
- Visual Studio Community Edition (optional)
- Genymotion (optional)


### How to install software


1. Install Chocolatey from [http://www.chocolatey.org](http://www.chocolatey.org).  Command is on the front-page of the site.

{% highlight  text %}

Command Prompt: @powershell -NoProfile -ExecutionPolicy unrestricted -Command "iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))" && SET PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin

or

Powershell Command Prompt: iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))

{% endhighlight %}

    
2. Install the BoxStarter Chocolatey package after install chocolatey, the command is cinst BoxStarter
3. Close the cmd prompt or powershell prompt that you opened to install Chocolatey and BoxStarter
4. On the desktop there should be a BoxStarter Shell icon, double-click on that to run it.  If the icon is not on the desktop, then open up a command prompt and type BoxStarterShell.
5. Run the following command to install this Gist:

{% highlight  text %}

Install-BoxStarterPackage -PackageName  https://gist.githubusercontent.com/digitaldrummerj/3fe2eb057004b6742b89/raw/c042aecff396d9b26d4061f45544bff80ff321e8/IonicSetup  -DisableReboots

{% endhighlight %}

- **NOTE:** If you want to install any of the optional software you will need to fork the gist file and remove the # in front of the line for the package you want to install.
    
### Post Install Steps

1. Open a command prompt (it won't work from a powershell command prompt)
2. type Android
	- This will launch the Android SDK Manager.  
    - Select the API 19 and check the SDK Platform and ARM EABI v8a System Image 
    - Scroll to the bottom and select the Google USB Driver
    - Click the install button.  This can take a bit of time.
3. If you are going to use the Android Enumator you will need to configure an Android Virtual Device (AVD).  To do this, with the Android SDK Manager open under the Tools menu select Manage AVD
	- This will launch the Android Virtual Device (AVD) Manager
    - Click the Create Button, fill out all of the fields, and click ok to create the AVD
    - Select the newly created AVD and click the Start button.  If everything worked it should start up the emulator.
             

### Verify that everything works

1. Open a command prompt
2. navigate the directory where you store you development projets (I use c:\projects)
3. from c:\projects type: ionic start todo blank
4. cd into c:\projects\todo  (directory was created by the ionic start command)
5. type: ionic platform add android
6. type: ionic build android
7. if using emulator type: ionic emulate android --livereload
8. if using Android x86 Virtual Machine you will need to enable remote debugging before you can run the app using my blog post @ [http://digitaldrummerj.github.io/Android-x86-Virtual-Machine-Instead-Of-Emulator/](http://digitaldrummerj.github.io/Android-x86-Virtual-Machine-Instead-Of-Emulator/)
9. ionic run android --livereload
	- NOTE: --livereload only works for Bridged VM and not for NAT
