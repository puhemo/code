---
collection: workshops
title: 'Lab 04: Using Visual Studio Code'
published: true
type: ionic
layout: workshoppost2
order: 4
lab: ionic
todo: |
---

{% assign imagedir = "../images/project-layout/" %}
Length: 10 minutes

## Objectives

Visual Studio Code out of the box has good default settings to immediately start using it as an editor.  To make it even more effective to use Visual Studio Code there are a few extensions for angular and ionic that you will want to install.  As well there are a few shortcuts and settings that come in handy.


>**Note**: If you don't already have Visual Studio Code installed see [Lab 01: Ionic Setup](../01-install-ionic/)

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
<h2>Table of Contents</h2>

- [4.0: Helpful Visual Studio Code Hints](#40-helpful-visual-studio-code-hints)
- [4.4.1: Shortcuts](#441-shortcuts)
  - [4.4.2: My settings](#442-my-settings)
  - [4.4.3 Extensions](#443-extensions)
  - [3.4.4: Debugging Using Visual Studio Code](#344-debugging-using-visual-studio-code)
  - [3.4.5: Intellisense](#345-intellisense)
- [Wrap-up](#wrap-up)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## 4.0: Helpful Visual Studio Code Hints


## 4.4.1: Shortcuts

* hide left sidebar: ctrl+b
* zoom in: ctrl+=
* zoom out: ctrl+-
* Split Editor: ctrl+\
* Switch to Editor Page: ctrl+[pane #]
* Command Palette: F1 or Ctrl + Shift + P
* Start Debugger: F5 (once you have set the target the 1st time)
* Format Code: Shift+Alt+F
* Toggle Breakpoint: F9


### 4.4.2: My settings

Here are my settings that I use for Visual Studio Code.  You can edit these by going under File -> Preferences -> User Settings

    {
        "editor.tabSize": 5,
        "editor.wrappingColumn": 0,
        "editor.autoClosingBrackets": true,
        "editor.formatOnType": true,
        "editor.detectIndentation": true,
        "editor.wrappingIndent": "indent",
        "files.exclude": {
             "**/.git": true,
            "**/.DS_Store": true,
            "**/node_modules": true,
            "**/_site": true
        },
        "editor.folding": true
    }

### 4.4.3 Extensions

Visual Studio Code allows you to extend the built-in functionality with extensions.  To install the extensions press F1, type extension, select Install Extension and then type the name of the extension you want to install.

Below are the extensions that we will be using in this workshop.

**[Angular 1 Javascript and Typescript Snippets](https://marketplace.visualstudio.com/items?itemName=johnpapa.Angular1)**

Written by John Papa and follow his style guide.

    ng1controller // creates an Angular controller
    ng1directive  // creates an Angular directive
    ng1factory    // creates an Angular factory
    ng1module     // creates an Angular module
    ng1service    // creates an Angular service

**[Ionic v1 Snippet
s](https://marketplace.visualstudio.com/items?itemName=justinjames.ionic1-snippets)**

* Over 200 html/javascript snippets plus 700 ionicons.
* All snippets start with ionic
* All icons snippets start with ionicicon
* See [Full Docs](https://github.com/digitaldrummerj/vscode-ionic1-snippets/blob/master/docs.md) for usage

**[Cordova Tools](https://marketplace.visualstudio.com/items?itemName=vsmobile.cordova-tools)**

* Intellisense for ionic framework and core cordova plugins
* Includes a number of useful Javascript and HTML code Snippets for your project.  Just type ion_ in th e editor to see what's available.
* Debug ionic application right in Visual Studio Code


Find other extensions at the [VSCode Market Place](https://marketplace.visualstudio.com/VSCode)


### 3.4.4: Debugging Using Visual Studio Code

Once you have the [Cordova Tools](https://marketplace.visualstudio.com/items?itemName=vsmobile.cordova-tools) extensions installed you can launch your ionic application and debug it using Visual Studio Code.

**Setup the Debug Environment**

Before you can launch your ionic application in Visual Studio Code, we need to tell Visual Studio Code that we are using a cordova environment.

1. Click on the debug icon ![debug icon]({{ "debug-icon.png" | prepend: imagedir }})
1. Click on the configure gear icon ![configure gear icon]({{ "configure-gear-icon.png" | prepend: imagedir }})
1. Select the cordova environment from the list

![Setup Debug Steps Picture]({{ "debug-environment.png" | prepend: imagedir }})

**Launch the Application**

To start the debugger, choose a target from the target drop-down list, and then either click the start button ![start icon]({{ "start-icon.png" | prepend: imagedir }}) or press F5.

![Debug Targets]({{ "debug-targets.png" | prepend: imagedir }})

You can debug your app on an Android emulator, iOS simulator, a device or in the browser. If you have your app running in one already, you can attach the debugger to it. The debugger uses the application ID of your project to locate the running instance.

You can set breakpoints in Visual Studio Code by clicking in the left margin on the line you want to set a breakpoint for or pressing F9.


### 3.4.5: Intellisense

While the Cordova tools extensions provides IntelliSense Ionic and Angular, these frameworks use a dependency injection model for built-in services that VSCode's language service cannot understand by default.

To properly enable IntelliSense for your code, you will need to use []JSDoc headers](http://usejsdoc.org/about-getting-started.html).

The Cordova tools extension will provide the ionic and angular typings for you, so all you have to do is create the JSDoc headers above the functions you wish to receive IntelliSense for.

For Ionic services, the service type will be in the following format: ionic.[service].Ionic[Service]Service, where [service] and [Service] should be replaced with the service's name, without the $ionic prefix. For example:

    @param {ionic.popup.IonicPopupService} $ionicPopup - The $ionicPopup service
    @param {ionic.modal.IonicModalService} $ionicModal - The $ionicModal service

For Angular services, the service type will be in the following format: angular.I[Service]Service, where [Service] should be replaced with the capitalized service's name, without the $ prefix. For example:

    @param {angular.ITimeoutService} $timeout - The Angular $timeout service
    @param {angular.IHttpService} $http - The Angular $http service

For a list of supported services for IntelliSense, see the angular.d.ts and ionic.d.ts typing files, that this extension places by default under .vscode/typings in your project.


## Wrap-up

Now we are ready to start building our app.  The next lab we will create the master view of the master/detail pages and bind some data from a service to the UI.