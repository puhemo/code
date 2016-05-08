---
collection: workshops
title: 'Lab 04: Using Visual Studio Code'
published: true
type: ionic
layout: workshoppost2
order: 4
lab: ionic
length: 20 minutes
todo: |
    * remove debugging section as you can't do device emulation or inspect element since Chrome will crash and exit process.
---

{% assign imagedir = "../images/project-layout/" %}


## Objectives

Visual Studio Code out of the box has good default settings to immediately start using it as an editor.  To make it even more effective to use Visual Studio Code there are a few extensions for angular and ionic that you will want to install.  As well there are a few shortcuts and settings that come in handy.


>**Note**: If you don't already have Visual Studio Code installed see [Lab 01: Ionic Setup](../01-install-ionic/)

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
<h2>Table of Contents</h2>

- [Section 4.0: Shortcuts](#section-40-shortcuts)
- [Section 4.1: My settings](#section-41-my-settings)
- [Section 4.2 Extensions](#section-42-extensions)
- [Wrap-up](#wrap-up)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## Section 4.0: Shortcuts

* hide left sidebar: ctrl+b
* zoom in: ctrl+=
* zoom out: ctrl+-
* Split Editor: ctrl+\
* Switch to Editor Page: ctrl+[pane #]
* Command Palette: F1 or Ctrl + Shift + P
* Start Debugger: F5 (once you have set the target the 1st time)
* Format Code: Shift+Alt+F
* Toggle Breakpoint: F9


## Section 4.1: My settings

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

## Section 4.2 Extensions

Visual Studio Code allows you to extend the built-in functionality with extensions.  To install the extensions press F1, type extension, select Install Extension and then type the name of the extension you want to install.

Below are the extensions that we will be using in this workshop.

**[Angular 1 Javascript and Typescript Snippets](https://marketplace.visualstudio.com/items?itemName=johnpapa.Angular1)**

Written by John Papa and follow his style guide.

    ng1controller // creates an Angular controller
    ng1directive  // creates an Angular directive
    ng1factory    // creates an Angular factory
    ng1module     // creates an Angular module
    ng1service    // creates an Angular service

**[Ionic v1 Snippets](https://marketplace.visualstudio.com/items?itemName=justinjames.ionic1-snippets)**

* Over 200 html/javascript snippets plus 700 ionicons.
* All snippets start with ionic
* All icons snippets start with ionicicon
* See [Full Docs](https://github.com/digitaldrummerj/vscode-ionic1-snippets/blob/master/docs.md) for usage

**[Cordova Tools](https://marketplace.visualstudio.com/items?itemName=vsmobile.cordova-tools)**

* Intellisense for ionic framework and core cordova plugins
* Includes a number of useful Javascript and HTML code Snippets for your project.  Just type ion_ in the editor to see what's available.
* Debug ionic application right in Visual Studio Code


**More Snippets**

 See the [VSCode Market Place](https://marketplace.visualstudio.com/VSCode)


## Wrap-up

Now we are ready to start building our app.  The next lab we will create the master view of the master/detail pages and bind some data from a service to the UI.