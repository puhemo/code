---
collection: workshops
title: 'Custom Directive to Change Icon'
published: true
type: ionicextra
layout: workshoppost2
---

Length: 20 minutes

## Objectives

* Change an icon based on the OS the application is running.

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
<h2>Table of Contents</h2>

- [Git Setup (Optional)](#git-setup-optional)
- [Section 9.0: Creating a Directive](#section-90-creating-a-directive)
- [Wrap-up](#wrap-up)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## Git Setup (Optional)

During this lab, you will be able to follow along using git to checkout the completed version of the steps in each section if you do not want to write all of the code yourself. 

If you intend to use the completed version of the steps, you need to clone the repository for this lab.

    $ git clone https://github.com/IonicWorkshop/Lab9-ChangingIconsBasedOnPlatform.git

This lab builds on Lab 5.  If you did not do or complete this lab, use the command above to checkout Lab 9 and then run the checkout command below to take it to the point of the completed Lab5.

    $ git checkout -f Lab5Completed

## Section 9.0: Creating a Directive

**Get Completed Steps (optional)**

If you are following along using git, reset your project to Step0.

    $ git checkout -f Step0

**Steps**

There are many items in the Ionic Framework that change based on the OS of the mobile device.  However the icons are not one of those items.  In order to change the icons based on the platform, you need to create an Angular directive.

1. In the www/js directory, create a file called StarterDirectives.js
1. Paste the code below into 

            angular.module('starter.directives', [])
            .directive('phoneicon', [function () {
                return {
                    restrict: 'E',
                    replace: true,
                    scope: false,
                    template: '<i class="icon"></i>',
                    compile: function (element, attrs) {                    
                    }
                };
            }])
        
1. Now that the directive is setup, you will need to modify the compile function to set the correct class on the template.
1. Using the information gathered from [http://ionicframework.com/docs/api/utility/ionic.Platform/](http://ionicframework.com/docs/api/utility/ionic.Platform/), set the icons to the following: 
    * **Default Icon**: ion-ios-telephone
    * **Android Icon**: ion-android-call
    * **iOS Icon**: ion-ios-telephone
    * **Browser Icon**: ion-ios-telephone

1. After you have figured out the correct class name, you can set it in the compile function with the following code:

        angular.element(element[0]).addClass(YOUR_CLASS_NAME);
        
## Section 9.1: Using the Directive

**Get Completed Steps (optional)**

If you are following along using git, reset your project to Step1.

    $ git checkout -f Step1

**Steps**

1. In order to use the directive, you need to add the directive javascript file to the index.html page
1. Then you need to tell the angular module to inject the starter.directives module
1. Finally, replace the phone icon in the contactdetails.html file with &lt;phoneicon&gt;&lt;/phoneicon&gt;
1. View your application in the browser, [http://localhost:8100/ionic-lab](http://localhost:8100/ionic-lab)
    * iOS is on the left and Android is on the right
    
    ![Lab8-IconDirectiveView.png](images/Lab9/Lab9-IconDirectiveView.png)
    
1. You can do the same thing for the other icons if there are different icons that you want to use based on the platform.

## Wrap-up

With a simple directive you were able to change the UI to have different icons based on the platform.  This is a very usefulto your end users so that they get the expected look and feel for their devices platform.