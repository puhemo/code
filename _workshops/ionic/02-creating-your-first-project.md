---
collection: workshops
title: 'Lab 02: Your First Project'
published: true
type: ionic
layout: workshoppost2
order: 2
lab: ionic
length: 5-10 minutes (depending on internet connection)
todo: |
    * Validate Mac security for ionic project directory
    * Mac Chrome Dev Tools Shortcut
    * Done - Add more information about the start command is actually doing
    * Done - Update screenshot to not show lab
    * Done - Create seperate section for the lab
    * Done - Link localhost url
    * Done - Toogle Device Mode icon
---

{% assign imagedir = "../images/first-project/" %}

## Objectives


Create your first Ionic project and view the project in a web browser.

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
<h2>Table of Contents</h2>

- [Section 2.0: Creating A Project](#section-20-creating-a-project)
  - [Section 2.0.1: Steps](#section-201-steps)
  - [Section 2.0.2 Start Command Details](#section-202-start-command-details)
  - [Section 2.0.3: Mac Cleanup](#section-203-mac-cleanup)
- [Section 2.1: Install Dependencies](#section-21-install-dependencies)
- [Section 2.2: Testing Project](#section-22-testing-project)
  - [Section 2.2.1: Ionic Lab](#section-221-ionic-lab)
  - [Section 2.2.2: Chrome Dev Tools](#section-222-chrome-dev-tools)
- [Conclusion](#conclusion)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## Section 2.0: Creating A Project

Ionic comes with 3 templates: blank, side menu, and tabs.  These templates have everything that you need to get started using ionic and deploy it to a device.  For this workshop we are going to use the blank template and build up our application from scratch.

The side menu comes with a pre-configured side menu while the tabs template comes with tabs already setup.  Both of these templates also include a few example pages.

### Section 2.0.1: Steps

1. Open a command prompt (Windows) or terminal (OSx)
1. Navigate to where you typically store your project files/code.  For myself, here is where I store my project files: 
    * Windows: c:\projects
    * OSx: ~/Documents/projects
1. Run the command:
    
        $ ionic start myFirstIonicApp blank --appname "Ionic WS"

    * --appname : Human readable name for the app

    > The start command may take a few minutes to run

### Section 2.0.2 Start Command Details

While the start command runs lets take a look at what is doing for us and go through the output that it generates.

1. Download the base project and template from Github

        Creating Ionic app in folder C:\projects\myFirstApp based on blank project
        Downloading: https://github.com/driftyco/ionic-app-base/archive/master.zip
        Downloading: https://github.com/driftyco/ionic-starter-blank/archive/master.zip
        Updated the hooks directory to have execute permissions

1. Next it updates the config.xml which contains all of the metadata about our application

        Update Config.xml

1. Setup and Config the cordova project to allow us to add platforms and deploy devices later

        Initializing cordova project

1. At this point the project is generated and the output shows us some help commands to run

        Your Ionic project is ready to go! Some quick tips:

         * cd into your project: $ cd myFirstApp
         * Setup this project to use Sass: ionic setup sass
         * Develop in the browser with live reload: ionic serve
         * Add a platform (ios or Android): ionic platform add ios [android]
                Note: iOS development requires OS X currently

                See the Android Platform Guide for full Android installation instructions:
                https://cordova.apache.org/docs/en/edge/guide_platforms_android_index.md.html
         * Build your app: ionic build <PLATFORM>
         * Simulate your app: ionic emulate <PLATFORM>
         * Run your app on a device: ionic run <PLATFORM>
         * Package an app using Ionic package service: ionic package <MODE> <PLATFORM>

        For more help use ionic --help or ionic docs

        Visit the Ionic docs: http://ionicframework.com/docs

        New! Add push notifications to your Ionic app with Ionic Push (alpha)!
        https://apps.ionic.io/signup

1. The last thing it does for us is show the latest updates that they have made to ionic.

        +---------------------------------------------------------+
        + New Ionic Updates for May 2016
        +
        + The View App just landed. Preview your apps on any device
        + http://view.ionic.io
        +
        + Invite anyone to preview and test your app
        + ionic share EMAIL
        +
        + Generate splash screens and icons with ionic resource
        + http://ionicframework.com/blog/automating-icons-and-splash-screens/
        +
        +---------------------------------------------------------+

### Section 2.0.3: Mac Cleanup

For OSx, you may need to change the permissions on your app directory for all of the ionic command to work like adding platforms which we will do later.

        $ sudo chmod -R 777 myFirstIonicApp 


## Section 2.1: Install Dependencies

Before we can run the project, we need to install the required dependencies.

    $ cd myFirstApp
    $ npm install
    $ bower install

> the npm install command will take several minutes to run depending on internet speed

## Section 2.2: Testing Project

We are now ready to test our application using Google Chrome.  To do this, the Ionic framework ship with the command, ionic serve.  Ionic serve starts up a node web server on port 8100 and launches your default web browser to [http://localhost:8100](http://localhost:8100).

In your open command prompt (Windows) or terminal (OSx), from your project directory run:

        $ ionic serve

>If you browser is not Google Chrome, please open Chrome and navigate to [http://localhost:8100](http://localhost:8100)

You should see a view similar to this in your browser.

![view in browser]({{"ionic-serve-png.png" | prepend: imagedir}})

This view however does not give you much of an idea how it might look on an actual device.    There are 2 ways to solve that we can emulate a mobile device from within Google Chrome.

### Section 2.2.1: Ionic Lab

The first way is to use the optional ionic-lab web page to see a side-by-side view of iOS and Android within Chrome.  Even if you don't pass the --lab option to the ionic serve command, you can always get to the Ionic lab page at [http://localhost:8100/ionic-lab](http://localhost:8100/ionic-lab)

    $ ionic serve --lab

![Ionic Lab]({{"ionic-serve-lab.png" | prepend: imagedir}})

### Section 2.2.2: Chrome Dev Tools

The second way is to turn on the device emulator within the Chrome Developer Tools.  Chrome has several known devices out of the box or you can add your own custom ones.

1. To open the Chrome Developer Tools go under the Chrome Menu
    * Windows: F21
    * Mac:

    ![Chrome Menu]({{ "menu-icon.png" | prepend: imagedir }})

1. Select More Tools -> Developer Tools

    ![Chrome Menu]({{ "menu-dev-tools.png" | prepend: imagedir }})

1. Click on the Toggle Device Mode icon
    * Windows: Ctrl+Shift+M
    * Mac:

    ![Device Mode Icon]({{ "device-mode-button.png" | prepend: imagedir }})

1. You can now pick the device that you want to emulate

    ![Device Mode Options]({{ "device-mode.png" | prepend: imagedir }})

1. If you don't see the device listed or want to remove emulated devices, click the Edit button under the device dropdown.

    ![Device Mode Edit Dropdown Option]({{ "device-mode-edit.png" | prepend: imagedir }})

## Conclusion

You now have your Ionic project created and working.  Though out this book, we will use this project to create a full application with a master/detail view, pull to refresh, loading spinner, change the theme of the application, create a custom directive, plus much more.  In the next lab we will explore the structure of an Ionic project.

