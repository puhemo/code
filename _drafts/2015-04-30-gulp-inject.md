---
published: true
layout: post
title: 'Automatically Add Javascript and Css to Your Web Page'
categories: ['how-to', 'ionic', 'gulp']
date: 2015-04-30
---

As you work on AngularJS based project or for that matter any web projects that have javascript or css file, you will at some point forget to add your new javascript or css file to the page and wonder why the page is broken.  This is really annoying when it happens as many times you spend a bit of time troubleshooting time before you realize that you just forgot to add the script or css tag.  You can fix this problem using gulp and the gulp inject module to automatically add the script and css tags onto the page.

##Installing NodeJs
Before you can start using gulp, you need to install NodeJs from [http://nodejs.org](http://nodejs.org).

##Installing Gulp

Once you get NodeJS installed, you will need to install Gulp.

1. Open command prompt
1. On Windows, run the command:

        $npm install gulp -g

1. On OSx, run the command:

        $sudo npm install gulp -g


##Installing Gulp-Inject

1. If you do not already have a package.json file, you will need to create one.
1. The package.json file need to be a valid json file.  Below is a basic file.

        {
          "dependencies": {
            "gulp": "^3.5.6"
          }
        }

1. Once you have the package.json file is installed, you need to install the gulp-inject module and add it to the package.json.

        $ npm install gulp-inject --save-dev

The --save-dev will add gulp-inject as a development dependency in the package.json file.

##Creating the gulpfile.js


##Adding Inject Task to gulpfile.js

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


##Setting up index.html to Accept Inject

1. Open the index.html page
1. Replace all of the script tags for your controllers and services with the inject:js comment below.  Leave the app.js script tag.

        <!-- inject:js -->
        <!-- endinject -->

1. Replace the css tag for the style.css with the inject:css command below

        <!-- inject:css -->
        <!-- endinject -->

##Section 12.4: Testing it out

1. Run the gulp task index and then look at the index.html page.  You should see all of the javascript and css files added back in.

        gulp index

1. Remove the javascript and css tags again.  Then run the ionic serve command.  You should all of the javascript and css files were added back in.

##Section 12.5: Further Reading

There is a lot of different options for the gulp-inject package.  If you want to read about all of the different options and see examples, the documentation is available at [https://www.npmjs.com/package/gulp-inject](https://www.npmjs.com/package/gulp-inject)

##Wrap-up

No longer will you have to wonder why a feature is not working, just to realize that it is because you forgot to include a javascript file.

????FINISH????