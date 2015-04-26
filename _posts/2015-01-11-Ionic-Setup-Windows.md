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

On Windows, you will only be able to setup Android development.  Apple requires a Mac in order to do iOS development.

### Software to be installed

- [NodeJS](https://chocolatey.org/packages/nodejs.install)
- [Git](https://chocolatey.org/packages/git)
- [Ant](https://chocolatey.org/packages/ant)
- [JDK7](https://chocolatey.org/packages/jdk7)
- [Android SDK](https://chocolatey.org/packages/android-sdk)
- [Android Studio](https://chocolatey.org/packages/AndroidStudio)
- [Google Chrome](https://chocolatey.org/packages/GoogleChrome)
- Npm Modules: cordova, gulp and ionic
- [Genymotion](https://www.genymotion.com/)
- [Webstorm](https://www.jetbrains.com/webstorm/) (optional)


### How to install software

1. Install Chocolatey from [http://www.chocolatey.org](http://www.chocolatey.org).  Command is on the front-page of the site or below.  Open an administrative command prompt to run the command.  To open an administrative command prompt on Windows 8, go to the start menu, type cmd and then ctrl+shift+click on the cmd search result.

{% highlight  text %}

Command Prompt: @powershell -NoProfile -ExecutionPolicy unrestricted -Command "iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))" && SET PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin

{% endhighlight %}

1. Install the [BoxStarter](http://boxstarter.org) Chocolatey package
{% highlight  text %}

cinst BoxStarter

{% endhighlight %}

1. Close the command prompt that you opened to install Chocolatey and BoxStarter
1. On the desktop there should be a BoxStarter Shell icon, double-click on that to run it.  If the icon is not on the desktop, then open up a command prompt and type BoxStarterShell.
1. I have setup a gist file that has all of the Chocolatey commands to run to install the rest of the software and configure it.  Run the gist file from the Boxstarter Shell:

{% highlight  text %}

Install-BoxStarterPackage -PackageName  https://gist.githubusercontent.com/digitaldrummerj/3fe2eb057004b6742b89/raw/c042aecff396d9b26d4061f45544bff80ff321e8/IonicSetup  -DisableReboots

{% endhighlight %}

- **NOTE:** If you want to install any of the optional software you will need to fork the gist file and remove the # in front of the line for the package you want to install.
    
### Post Install Steps

1. Open a command prompt (it won't work from a powershell command prompt)
1. type Android
	- This will launch the Android SDK Manager.  
    - Select the API 19 and check the SDK Platform and ARM EABI v8a System Image 
    - Scroll to the bottom and select the Google USB Driver
    - Click the install button.  This can take a bit of time.
1. If you are going to use the Android Emulator you will need to configure an Android Virtual Device (AVD).  To do this, with the Android SDK Manager open under the Tools menu select Manage AVD
	- This will launch the Android Virtual Device (AVD) Manager
    - Click the Create Button, fill out all of the fields, and click ok to create the AVD
    - Select the newly created AVD and click the Start button.  If everything worked it should start up the emulator.
1. Configure Genymotion Setup
    *  After Genymotion is installed, open up the Genymotion UI and click on the Add Button.
    * Then click the Sign in button and follow the login instructions to login with the account that you create as part of the Genymotion download.
    * After you are logged in, select from the Android Version drop down 4.4.4
    * From the Device model drop down select a device type
    * Then select a device from the available list
    * Click the Next button.
    * Click the Next button and wait for the device to download
    * Click the Finish button.

### Verify that everything works

1. Open a command prompt
1. Navigate the directory where you store you development projects (I use c:\projects)
1. From c:\projects type: ionic start todo blank
1. cd into c:\projects\todo  (directory was created by the ionic start command)
1. Run the command:

{% highlight  text %}
ionic platform add android
{% endhighlight %}

1. Run the command:

{% highlight  text %}
ionic build android
{% endhighlight %}

1. If using emulator run the command:
    * Note: The Genymotion emulator is seen as a device and not an emulator.

{% highlight  text %}
ionic emulate android
{% endhighlight %}

1. If running on a device run the command:
    * For Android, if using the Genymotion emulator, make sure to start the Genymotion device you downloaded before running the command below.  You can start the device by selecting the device that you downloaded and clicking the start button.
{% highlight  text %}
ionic run android
{% endhighlight %}