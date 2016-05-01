---
collection: workshops
title: 'Lab 2: Creating Your First Project'
published: true
type: ionic
layout: workshoppost
---

Length: 5-10 minutes (depending on internet connection)

## Objectives

* Create your first Ionic project.
* View the project in a web browser.

## Section 2.0: Creating A Project

1. Open a command prompt (Windows) or terminal (OSx)
1. Navigate to where you typically store your project files/code.  For myself, here is where I store my project files: 
    * Windows: c:\projects
    * OSx: ~/Documents/projects
1. Run the command:
    
        $ ionic start myFirstApp blank --appname "Ionic WS"

    * --appname : Human readable name for the app
    
1. For OSx, you may need to change the permissons on your app directory for all of the ionic command to work like adding platforms which we will do later.

        $ sudo chmod -R 777 myFirstApp 


## Section 2.1: Testing Project

The easiest way to test that your Ionic project is working correctly is to use Google Chrome.  To do this, the Ionic framework ship with the command, ionic serve.  Ionic serve starts up a node web server on port 8100 and launches your default web browser to http://localhost:8100.

1. In your open command prompt (Windows) or terminal (OSx), change the directory to the myFirstApp folder that was created by the ionic start command.

        $ cd myFirstApp

1. To start the web server and launch your default browser to http://localhost:8100, run the command:

        $ ionic serve --lab

You should see a view similar to this in your browser.

![view in browser](../images/lab2/IonicLabInitialView.png)



**--lab**

This parameter is optional.  When used the --lab option opens up the web browser to a view of the application with iOS and Android views side by side.  Even if you don't pass the --lab option to the ionic serve command, you can always get to the Ionic lab page using the URL, [http://localhost:8100/ionic-lab](http://localhost:8100/ionic-lab)


## Conclusion

You now have your Ionic project created and working.  Though out this book, we will use this project to create a full application with a master/detail view, pull to refresh, loading spinner, change the theme of the application, create a custom directive, plus much more.  In the next lab we will explore the structure of an Ionic project.

