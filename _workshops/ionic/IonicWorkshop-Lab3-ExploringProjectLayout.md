---
collection: workshops
title: 'Lab 03: The Project Layout'
published: true
type: ionic
layout: workshoppost2
order: 3
lab: ionic
---

<div id="todo">
    <ul>
        <li>Update screenshots to use Visual Studio code</li>
        <li>Reference John Papa's Style Guide in section 3.3</li>
        <li>Add shortcut for VS Code hide folder structure</li>
        <li>Give quick Visual Studio Code overview of usage.  Open multiple panes. Git usage. see open files close all open files</li>
        <li>Add common VS Code settings that I have</li>

    </ul>
</div>

Length: 10 minutes

**Note**: For this lab, I will be using Visual Studio Code as our editor but you can use any text editor.  The install steps for Visual Studio Code are in [Lab 01: Ionic Setup](../IonicWorkshop-Lab1-InstallingIonic/)

## Objectives

Understand the folder structure for an Ionic project and where to place files.

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
<h2>Table of Contents</h2>

- [Section 3.0: Opening Project in WebStorm](#section-30-opening-project-in-webstorm)
- [Section 3.1: Exploring Project Layout](#section-31-exploring-project-layout)
- [Wrap-up](#wrap-up)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## Section 3.0: Opening Project in Visual Studio Code

1. Open Visual Studio Code
1. Click Open
    
    ![Lab3-WebStormInitialScreen.png](../images/Lab3/Lab3-WebStormInitialScreen.png)
    
1. Navigate to where you create the myFirstApp folder and click Choose

    ![Lab3-WebStormChooseFolderLocation.png](../images/Lab3/Lab3-WebStormChooseFolderLocation.png)
    
1. Your project should now be opened in Visual Stuod Code, similar to this screenshot.

    ![Lab3-WebStormProjectOpened.png](../images/lab3/Lab3-WebStormProjectOpened.png)



## Section 3.1: Exploring Project Layout

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

## Section 3.2: Suggested Structure

There are two train of thoughts on how to structure your project depending on the size of the project.  The first option is by type and the second option is by page.

### Structure By Type

In this structure you create directories to hold controllers, services, directives, etc. and all of the files of that type for the project are stored in the directory.

This structure works great when your project is small.  However, as the project grows it can quickly become unwieldy to find the file that you are looking for.  I can typically handle 8-10 files in a single directory before it becomes annoying to me to find a file.

For this workshop, we are going to use this structure.

If later on you decide to change the structure to [Structure By Page](#structure-by-page), luckily it is just directory reorganizations and updating the index.html with the javascript reference.  This becomes even easier if you go through the extra lab, [Auto Add JS/CSS to index.html](../IonicWorkshop-Extra-GulpInject/) where I walk you through adding a gulp task to automate the updating of the javascript and css references in the index.html.

**example layout**

<pre>
├── js &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; javascript files files
&nbsp; &nbsp; ├── controllers &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  &nbsp;  &nbsp; &nbsp; all of the controllers
&nbsp; &nbsp; &nbsp; &nbsp; ├── projects.controller.js &nbsp; &nbsp; &nbsp;controller for projects page
&nbsp; &nbsp; &nbsp; &nbsp; ├── tasks.controller.js &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;controller for projects page
&nbsp; &nbsp; ├── services &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  &nbsp;  &nbsp;  &nbsp; all of the services/factories
&nbsp; &nbsp; &nbsp; &nbsp; ├── projects.services.js &nbsp; &nbsp; &nbsp; &nbsp;services for projects page
&nbsp; &nbsp; &nbsp; &nbsp; ├── tasks.services.js  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;services for projects page
&nbsp; &nbsp; ├── directives  &nbsp;  &nbsp;  &nbsp;  &nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;custom directives
&nbsp; &nbsp; &nbsp; &nbsp; ├── projects.directives.js &nbsp;&nbsp; &nbsp; directories for project page
&nbsp; &nbsp; &nbsp; &nbsp; ├── tasks.directives.js &nbsp; &nbsp;&nbsp;&nbsp; &nbsp; directories for project page
&nbsp; &nbsp; ├── config &nbsp;  &nbsp;  &nbsp;  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; configurations, constants, etc
</pre>

### Structure By Page

In this structure you create a directory for each page and that directory contains all of the page specific files for controller, services, directives, etc.

This structure works great for large parts that have lots of files.  You can use it even on smaller projects but it is a bit of overkill.  With this structure though you don't have to worry about the number of files in a single directory becoming too much as each page typically have less than 5 files.

**example layout**

<pre>
├── js &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; javascript files files
&nbsp; &nbsp; ├── projects&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp;all of the controllers
&nbsp; &nbsp; &nbsp; &nbsp; ├── projects.controller.js &nbsp; &nbsp; &nbsp;controller for projects page
&nbsp; &nbsp; &nbsp; &nbsp; ├── projects.services.js &nbsp; &nbsp; &nbsp; &nbsp;services for projects page
&nbsp; &nbsp; &nbsp; &nbsp; ├── projects.directives.js &nbsp;&nbsp; &nbsp; directories for project page
&nbsp; &nbsp; ├── tasks&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; all of the controllers
&nbsp; &nbsp; &nbsp; &nbsp; ├── tasks.controller.js &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;controller for projects page
&nbsp; &nbsp; &nbsp; &nbsp; ├── tasks.services.js  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;services for projects page
&nbsp; &nbsp; &nbsp; &nbsp; ├── tasks.directives.js &nbsp; &nbsp;&nbsp;&nbsp; &nbsp; directories for project page
&nbsp; &nbsp; ├── services &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;global services/factories
&nbsp; &nbsp; &nbsp; &nbsp; ├── user.service.js &nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp;reusable service for users
&nbsp; &nbsp; ├── directives &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;global directives
&nbsp; &nbsp; ├── config &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;global configurations
</pre>

## Section 3.3 Coding Style

Reference John Papa's Style Guide

## Wrap-up

Now we are ready to start building our app.  The next lab we will create the master view of the master/detail pages and bind some data from a service to the UI.