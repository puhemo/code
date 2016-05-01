---
collection: workshops
title: 'Lab 03: The Project Layout'
published: true
type: ionic
layout: workshoppost
---

??? NEED TO UPDATE FOR VS CODE ????

Length: 10 minutes

**Note**: For this lab, I will be using WebStorm as our editor but you can use any text editor.  If you want to use WebStorm, you can download a 30 day evaluation version at at [http://www.jetbrains.com/webstorm](http://www.jetbrains.com/webstorm).  If you are on Windows and using Chocolatey, run the command: cinst webstorm to install it.

##Objectives

* Understand the folder structure for an Ionic project

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

##Section 3.0: Opening Project in WebStorm

1. Open Visual Studio Code
1. Click Open
    
    ![Lab3-WebStormInitialScreen.png](../images/Lab3/Lab3-WebStormInitialScreen.png)
    
1. Navigate to where you create the myFirstApp folder and click Choose

    ![Lab3-WebStormChooseFolderLocation.png](../images/Lab3/Lab3-WebStormChooseFolderLocation.png)
    
1. Your project should now be opened in Webstorm, similar to this screenshot.

    ![Lab3-WebStormProjectOpened.png](../images/lab3/Lab3-WebStormProjectOpened.png)



##Section 3.1: Exploring Project Layout

1. With the myFirstApp highlighted, click on the arrow next to the project name.

    ![Lab3-WebStormTreeExpandTopLevel.png](../images/Lab3/Lab3-WebStormTreeExpandTopLevel.png)

1. Top level projectused for structure:

    <pre>
    ├── hooks &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;extra commands to run on cordova build
    ├── platforms &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;iOS/Android specific builds will reside here
    ├── plugins &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;where cordova plugins will be installed
    ├── scss &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; SASS code, which will output to www/css/
    ├── www &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;your application code
    ├── bower.json &nbsp; &nbsp; &nbsp; &nbsp; bower dependencies
    ├── config.xml &nbsp; &nbsp; &nbsp; &nbsp; cordova configuration
    ├── gulpfile.js &nbsp; &nbsp; &nbsp; &nbsp;gulp tasks
    ├── ionic.project &nbsp; &nbsp; &nbsp;ionic configuration file
    └── package.json &nbsp; &nbsp; &nbsp; npm & cordova platforms/plugins dependencies
    </pre>

1. Expand the www folder

    ![Lab3-WebStormWWWTreeExpanded.png](../images/Lab3/Lab3-WebStormWWWTreeExpanded.png)
    
1.  www folder structure:

    <pre>
    ├── css &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;your stylesheet files
    ├── img &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;your image files
    ├── js &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; your javascript files
    ├── lib &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;vendor javascript such as Ionic and Angular
    ├── template &nbsp; &nbsp; &nbsp; used to store the view html.
    └── index.html &nbsp; &nbsp; main file. js/css/angular/ionic references
    </pre>


##Wrap-up

Now we are ready to start building our app.  The next lab we will create the master view of the master/detail pages and bind some data from a service to the UI.