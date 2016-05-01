---
collection: workshops
title: 'Lab 1: Mac - Installing the Ionic Framework'
published: true
type: ionic
layout: workshoppost
---

Length: 30 minutes (depending on internet connection speed)

## Objective

* Setup your computer with the required software to create an Ionic Framework based project and be able to run/test it in the browser.

> **<font color="red">NOTE:</font>** If you already have node v.4+, Google Chrome and Visual Studio Code installed, you can skip to [section 1.4](#section-14-ionic)

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->


- [Section 1.0: NodeJs](#section-10-nodejs)
- [Section 1.1: Git Command Line](#section-11-git-command-line)
- [Section 1.2: Google Chrome](#section-12-google-chrome)
- [Section 1.3: Visual Studio Code](#section-13-visual-studio-code)
- [Section 1.4: Ionic](#section-14-ionic)
- [Conclusion](#conclusion)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->



## Section 1.0: NodeJs

> **<font color="red">NOTE:</font>** If you already have node v.4+ installed, you can skip this section and go to [section 1.1](section-11-git-command-line)


1. Open a Web Browser and go to [http://nodejs.org](http://nodejs.org)
1. Click on the link for the LTS version to download the NodeJs installer
1. Run the installer and click next or continue through the installer taking all of the defaults
1. Open up a terminal and run

        $ node -v

1. If the node -v command returns a version number, then node is installed

## Section 1.1: Git Command Line

On a recent Mac git comes pre-installed.  To verify it is installed open up terminal and run:

            $ git --version.

If you do not have the git command line tools installed, you will need to install it.  As well, it also indicates that you are running an old version of OSx and you may have issue completing this lab.

1. Open a web browser and go to [https://msysgit.github.io/](https://msysgit.github.io/)
1. Click the download button.
1. Run the downloaded exe and follow the installer instructions.

## Section 1.2: Google Chrome

> **<font color="red">NOTE:</font>** If you already have Google Chrome installed, you can skip this section and go to [section 1.3](section-13-visual-studio-code)

For testing in the browser as well on Android devices Google Chrome gives you the best debugging experience.

When deploying to an Android device you will be able to use the Chrome Developer Tools for debugging just as you do normally for a web site.

1. Open a web browser and navigate to [https://www.google.com/chrome/browser/desktop/index.html](https://www.google.com/chrome/browser/desktop/index.html)
1. Click the "Download Chrome" button to download chrome
1. Launch the installer exe after it downloads and follow the on screen instructions

## Section 1.3: Visual Studio Code

> **<font color="red">NOTE:</font> If you already have Visual Studio Code installed, you can skip this section and go to [section 1.4](section-14-ionic)

Visual Studio Code is a great free lightweight cross-platform code editor.

By having everyone use the same editor it helps to eliminate editor specific issues.  You can however use any text editor or coding ide that you would like for developing ionic applications.

1. Open a web browser and navigate to [http://code.visualstudio.com](http://code.visualstudio.com)
1. Click the "Download for Mac" button to download Visual Studio Code
1. Double-click on the downloaded archive to expand the contents.
1. Drag Visual Studio Code.app to the Applications folder, making it available in the Launchpad.
1. Add VS Code to your Dock by right-clicking on the icon and choosing Options, Keep in Dock.

## Section 1.4: Ionic

1. Open up a terminal
1. Run the command: 

        $ sudo npm install -g ionic cordova bower gulp
        
1. Give it your password when asked
    * If it keeps saying password is wrong, make sure that your account has a strong password.
    
    
**Verify Installation**

1. Check that ionic installed correctly, run: 
    
        $ ionic -v
        
    * 1.7.14 as of this writing.
    
1. Check that cordova installed correctly, run: 

        $ cordova -v
        
    * 6.0.0 as of this writing.

1. Check that bower installed correctly, run: 

        $ bower -v
        
    * 1.7.9 as of this writing
    
1. Check that gulp installs correctly, run:

        $ gulp -v
        
    * 3.9.0 as of this writing


## Conclusion

You now have all of the software components needed to create an Ionic project and run/test it out in a web browser.  In the next lab you will create your first Ionic application and test it in the browser.

