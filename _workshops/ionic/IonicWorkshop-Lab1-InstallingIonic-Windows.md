---
collection: workshops
title: 'Lab 01: Windows Installations'
published: true
type: ionic
layout: workshoppost
---

Length: 30 minutes (depending on internet connection speed)

## Objective

* Setup your Windows computer with the required software to create an Ionic Framework based project and be able to run/test it in the browser.

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->


- [Section 1.0: Chocolatey](#section-10-chocolatey)
- [Section 1.1: NodeJs](#section-11-nodejs)
- [Section 1.2: Git Command line](#section-12-git-command-line)
- [Section 1.3: Google Chrome](#section-13-google-chrome)
- [Section 1.4: Visual Studio Code](#section-14-visual-studio-code)
- [Section 1.5: Ionic](#section-15-ionic)
- [Conclusion](#conclusion)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## Section 1.0: Chocolatey

> **<font color="red">NOTE:</font>** If you already have node v.4+, the git command line, Google Chrome and Visual Studio Code installed, you can skip to [section 1.5](#section-15-ionic)</font>

[Chocolatey](http://chocolatey.org) is a Windows package manager that takes care of downloading and installing software packages.  For Windows, it makes installing software a breeze if there is an existing Chocolatey package which for the software we are using there are packages available. 

1. Open an administrative command prompt
    * From the start menu type cmd
    * Find the command prompt
    * Right-click on the command prompt and select "Run As Administrator"
1. Run command:
    
       @powershell -NoProfile -ExecutionPolicy unrestricted -Command "iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))" && SET PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin

1. Close and re-open the administrative command prompt to make pick the environment variables that were added for chocolatey

## Section 1.1: NodeJs

> **<font color="red">NOTE:</font>** If you already have node v.4+ installed, you can skip this section and go to [section 1.2](section-12-git-command-line)</font>

1. Open an administrative command prompt
1. Run the command:  

        $ choco install -y nodejs

1. Open a new non-administrative command prompt and run the command

        $ node -v

1. If the node -v command returns a version number, then node is installed and working correctly.

## Section 1.2: Git Command line

> **<font color="red">NOTE:</font>** If you already have the git command line installed, you can skip this section and go to [section 1.3](#section-13-google-chrome)</font>

1. Open an administrative command prompt
1. Run the command:
        
        $ choco install -y git

1. Open a new non-administrative command prompt and run the command: 

        $ git --version
        
1. If the git --version command returns a version number, then git is installed

## Section 1.3: Google Chrome

> **<font color="red">NOTE:</font>** If you already have Google Chrome installed, you can skip this section and go to [section 1.4](section-14-visual-studio-code)</font>

For testing in the browser as well on Android devices Google Chrome gives you the best debugging experience.  

When deploying to an Android device you will be able to use the Chrome Developer Tools for debugging just as you do normally for a web site.

1. Open an administrative command prompt
1. Run the command:

        $ choco install -y googlechrome
        

## Section 1.4: Visual Studio Code

> **<font color="red">NOTE:</font>** If you already have Visual Studio Code installed, you can skip this section and go to [section 1.5](section-15-ionic)</font>

Visual Studio Code is a great free lightweight cross-platform code editor.  

By having everyone use the same editor it helps to eliminate editor specific issues.  You can however use any text editor or coding ide that you would like for developing ionic applications. 

1. Open an administrative command prompt
1. Run the command:

        $ choco install -y visualstudiocode
      

## Section 1.5: Ionic

1. Open up a regular non-administrative command prompt
1. Run the command: 

        npm install -g ionic cordova bower gulp
                    
**Verify Installation**

1. Check that ionic installed correctly, run: 
    
        ionic -v 
        
    * 1.7.14 as of this writing.
    
1. Check that Cordova installed correctly, run:

        cordova -v 
        
    * 6.0.0 as of this writing.

1. Check that bower installed correctly, run: 

        bower -v
        
    * 1.7.9 as of this writing
    
1. Check that gulp installs correctly, run:

        gulp -v
        
    * 3.9.0 as of this writing 

## Conclusion

You now have all of the software components needed to create an Ionic project and run/test it out in a web browser.  In the next lab you will create your first Ionic application and test it in the browser.

