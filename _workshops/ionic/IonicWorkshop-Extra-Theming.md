---
collection: workshops
title: 'Styling the Application'
published: true
type: ionicextra
layout: workshoppost2
lab: ionic
---

Length: 10 minutes

## Objective

* Learn how to setup your Ionic project to use a SASS file
* Learn how to style and theme the application using a SASS file.

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
<h2>Table of Contents</h2>

- [Git Setup (Optional)](#git-setup-optional)
- [Section 7.0: What is SASS?](#section-70-what-is-sass)
- [Section 7.1: Setting up SASS](#section-71-setting-up-sass)
- [Wrap-up](#wrap-up)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## Git Setup (Optional)

During this lab, you will be able to follow along using git to checkout the completed version of the steps in each section if you do not want to write all of the code yourself. 

If you intend to use the completed version of the steps, you need to clone the repository for this lab.

    $ git clone https://github.com/IonicWorkshop/Lab7-StylingWithSASS.git


## Section 7.0: What is SASS?

Sass is an extension of CSS that adds power and elegance to the basic language. It allows you to use variables, nested rules, mixins, inline imports, and more, all with a fully CSS-compatible syntax. Sass helps keep large stylesheets well-organized, and get small stylesheets up and running quickly, particularly with the help of the Compass style library.

The Ionic framework uses variables for all of the style information which enable you to easily override any of the colors of the application with your own.  

## Section 7.1: Setting up SASS


**Get Completed Steps (optional)**

This lab builds on Lab 5.  If you did not do or complete this lab, use the command above to checkout Lab 7 and then run the checkout command below to take it to the point of the completed Lab5.

    $ git checkout -f Lab5Completed

If you are following along using git, reset your project to Step1.

    $ git checkout -f Step1

**Steps**

1. First step it to tell ionic that you want to use SASS

        $ ionic setup sass

1. The ionic setup sass command will:
    * Download the required npm and gulp packages 
    * Update index.html to reference the output css from the gulp sass task
    * setup the gulp watch task for the sass file so that it will recompile on changes
    * setup the ionic serve command to start the gulp watch task
    
        
## Section 7.2: Modifying the Look of the Contacts List

**Get Completed Steps (optional)**

If you are following along using git, reset your project to Step2.

    $ git checkout -f Step2

**Steps**

1. If you don't already have ionic serve running, open a command prompt and run the command ionic serve
1. You should also see a gulp task message about the starting the 'sass' task

    ![Lab7-GulpSassCompile.png](images/Lab7/Lab7-GulpSassCompile.png)
    
1. In your web browser, open [http://localhost:8100](http://localhost:8100)

1. In the root of your project in the scss folder, open the ionic.app.scss
1. You will notice at the top of the file is a commented out section with a sample list of variables. To see all of the possible variables open up the www/lib/ionic/scss/_variables.scss file.
1. To demonstate the SASS capabilities we are going to change the $stable variable to a different color such as pink.  This variable is used for the background color of the list header.  
1. Once you save the file, you will notice in your command prompt that the sass task detected a change and ran
1. Go back to your web browser and now your contact list header should be pink

    ![Lab7-ContactPinkHeader.png](images/Lab7/Lab7-ContactPinkHeader.png)
    

## Wrap-up

With the few simple steps above you were able to easily to style your application.  Even though we only just touched on using SASS to style your application, it is obvious how easy it makes styling your application. 