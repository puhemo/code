---
layout: post
title: Ionic Setup on OSx
published: true
---

##Ionic Setup for OSx

If you are like me and just starting to work with the Ionic Framework and don’t already have a machine setup to do Android, iOS, Node, etc development then many of the guides out there leave out a number of steps that you need to do in order to get everything working.

Even being a windows user I was able to pretty easily get Ionic working on a Mac.  The only difference between the Windows setup and the OSx setup is that you can only add iOS to Ionic on a Mac.  

### Software to be installed

- [NodeJS](https://nodejs.org)
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
- Github for OSx (optional)
- Genymotion (optional)

### Install Steps
1. Install homebrew  and node js via http://www.johnpapa.net/how-to-use-npm-global-without-sudo-on-osx/
2. NPM packages 
	- npm install -g cordova
	- npm install -g ionic
    - npm install -g bower
3. JDK 7
	- Download from [http://www.oracle.com/technetwork/java/javase/downloads/jdk7-downloads-1880260.html](http://www.oracle.com/technetwork/java/javase/downloads/jdk7-downloads-1880260.html)
	- After install from the terminal create ~/.bash_profile if it doesn't already exist.  You can use touch ~/.bash_profile to create the file.
    - Open up either vi or nano and add the following line:    
    
		Add export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_72.jdk/Contents/Home

4. Android Studio
	- Download from [http://developer.android.com/sdk/index.html#Other](http://developer.android.com/sdk/index.html#Other)
5. Ant
	- Download from [http://ant.apache.org/bindownload.cgi](http://ant.apache.org/bindownload.cgi)
    - Unzip to /users/[Your Username]/Development/ into a apache-ant-1.9.4
    - Open ~/.bash_profile and add the following line:
    
    export ANT_HOME=/users/jpjames/Development/apache-ant-1.9.4
    
6. Android SDK 
	* Download from [http://developer.android.com/sdk/index.html#Other](http://developer.android.com/sdk/index.html#Other_
    - Unzip to /users/[Your username]/Development
	- Open ~/.bash_profile and add the following line:
	
    Add export PATH=${PATH}:/users/[Your UserName]/Development/android-sdk-mac_x86/tools:/users/[Your Username]/Development/android-sdk-mac_x86/platform-tools:${ANT_HOME}/bin
7. Download correct Android API 
	- in terminal type source ~/.bash_profile to load the ~/.bash_profile changes.
    - type android from terminal.  If everything is working correct it will open up the Android SDK Manager.
	- Install API 19  with SDK Platforms and Arm Image checked
	- Install the Google USB Driver 
8. Configure Android Emulator
	* In terminal type android avd.  If everything is working correct it will open up the Android AVD Manager.
	* Click the create button and add at least 1 device to emulate
9. Google Chrome
	- Download from [https://www.google.com/chrome/browser/desktop/](https://www.google.com/chrome/browser/desktop/)
10. Install Xcode from app store.  This will take awhile since it is ~2 gigs in size.
	- Once install is completed, open xcode and accept the license
11. Install the IOS Simulator that Ionic will use.
	* npm install -g ios-sim
   
### Verify that everything works

1. Open terminal
2. navigate the directory where you store you development projets (I use /users/[Your Username]/projects)
3. type: ionic start todo blank
4. cd into ~/projects/todo  (directory was created by the ionic start command)
5. type: ionic platform add android
6. type: ionic build android
7. if using emulator type: ionic emulate android --livereload
8. if using Android x86 Virtual Machine you will need to enable remote debugging before you can run the app using my blog post @ [http://digitaldrummerj.github.io/Android-x86-Virtual-Machine-Instead-Of-Emulator/](http://digitaldrummerj.github.io/Android-x86-Virtual-Machine-Instead-Of-Emulator/)
9. ionic run android --livereload
	- NOTE: --livereload only works for Bridged VM and not for NAT
10. ionic platform add ios
11. ionic build ios
12. ionic emulate ios


