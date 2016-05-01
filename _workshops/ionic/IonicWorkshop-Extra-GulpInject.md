---
collection: workshops
title: 'Auto Add JS/CSS to index.html'
published: true
type: ionicextra
layout: workshoppost
---

Length: 10 minutes

##Objective

* Utilize gulp to automate the adding in of new javascript files to the index.html page

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

##Git Setup (Optional)

This lab builds on Lab 10.  If you did not do or complete this lab, use the command above to checkout Lab 11 and then run the checkout command below to take it to the point of the completed Lab5.

    $ git checkout -f Lab10Completed

    $ git clone https://github.com/IonicWorkshop/Lab12-AutomaticallyInjectFilesOnIndex.git


##Section 12.0: Installing Gulp Inject Package

**Section Overview**

In this section we need will add the gulp-inject module into the package.json file as a dev dependency.  The gulp-inject module is what we will be using to add the javascript and css script tags into the index.html page.

**Get Completed Steps (optional)**

This lab builds on Lab 10.  If you did not do or complete this lab, use the command above to checkout Lab 11 and then run the checkout command below to take it to the point of the completed Lab5.

    $ git checkout -f Lab11Completed

If you are following along using git, reset your project to Step0 and run npm install.

    $ git checkout -f Step0
    $ npm install

**Steps**

1. You need to install gulp-inject from npm

        $ npm install gulp-inject --save-dev
    
This will add gulp-inject to package.json as a development dependency and install it so that you can use it.

##Secton 12.1: Adding Inject Task to gulpfile.js
 
**Section Overview**

In this section you will update the gulpfile.js to include a task to inject the javascript/css files from the www folder into the index.html page and setup gulp to run the inject task when it detects any changes to the javascript/css files.

**Get Completed Steps (optional)**

If you are following along using git, reset your project to Step1. 

    $ git checkout -f Step1

**Steps**

1. Open the gulpfile.js
1. Add gulp-inject as a required module.  Name the variable used inject.  
1. To the paths list add a javascript option

        javascript: ['./www/**/*.js', '!./www/js/app.js', '!./www/lib/**']
        
    * The ! in front of the file/path means to exclude that file/path from being injected
1. Do the same thing with the paths for css files
        
        css: ['./www/**/*.css', '!./www/css/ionic.app*.css', '!./www/lib/**']

1. Next we need to add a new gulptask called index.  You could call it anything you wanted but for this lab it is called index.

        gulp.task('index', function(){
            return gulp.src('./www/index.html')
                .pipe(inject(gulp.src(paths.javascript, {read: false}), {relative: true}))
                .pipe(inject(gulp.src(paths.css, {read: false}), {relative: true}))
                .pipe(gulp.dest('./www'));
        })

1. Next add the index task to the gulp default task
1. Finally, add the javascript and css paths to the gulp watch task and have it call the index task when a change is detected.


##Section 12.2: Adding Inject Task to Ionic Serve Startup

**Section Overview**

In this section you will modify the ionic startup configuration to tell it to run the gulp index task when you run ionic serve.

**Get Completed Steps (optional)**

If you are following along using git, reset your project to Step2.

    $ git checkout -f Step2

**Steps**

1. Open the ionic.project file
2.  Add the gulpStartupTasks section below

         "gulpStartupTasks": [
            "index",
            "watch"
          ]

##Section 12.3: Setting up index.html to Accept Inject

**Get Completed Steps (optional)**

If you are following along using git, reset your project to Step3.

    $ git checkout -f Step3

**Steps**

1. Open the index.html page
1. Replace all of the script tags for your controllers and services with the inject:js comment below.  Leave the app.js script tag.

        <!-- inject:js -->
        <!-- endinject -->

1. Replace the css tag for the style.css with the inject:css command below
        
        <!-- inject:css -->
        <!-- endinject -->
    
##Section 12.4: Testing it out

**Get Completed Steps (optional)**

If you are following along using git, reset your project to Step4.

    $ git checkout -f Step4

**Steps**

1. Run the gulp task index and then look at the index.html page.  You should see all of the javascript and css files added back in.

        gulp index
    
1. Remove the javascript and css tags again.  Then run the ionic serve command.  You should all of the javascript and css files were added back in.
    * Note: If you already have ionic serve running, you will need to stop it and restart it for it to pick up the gulpStartupTasks.
1. With ionic serve running, if you add a new javascript or css file in to the www folder, gulp will automatically add them into the index.html file.

##Section 12.5: Further Reading

There is a lot of different options for the gulp-inject package.  If you want to read about all of the different options and see examples, the documentation is available at [https://www.npmjs.com/package/gulp-inject](https://www.npmjs.com/package/gulp-inject)

##Wrap-up

No longer will you have to wonder why a feature is not working, just to realize that it is because you forgot to include a javascript file.