---
collection: workshops
title: 'Lab 05: Adding Master View'
published: true
type: ionic
layout: workshoppost2
order: 5
lab: ionic
length:
todo: |
---

{% assign imagedir = "../images/master-view/" %}


## Objectives

* Add a new view into the UI (master view part of master/detail view)
* Create our first service
* Create our first controller
* Bind data to the UI


<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
<h2>Table of Contents</h2>

- [Section 5.0: Adding New Page](#section-50-adding-new-page)
- [Section 5.1: Add Route to New Page](#section-51-add-route-to-new-page)
- [Section 5.2: Creating Your First Service](#section-52-creating-your-first-service)
- [Section 5.4: Creating Your First Controller](#section-54-creating-your-first-controller)
- [Section 5.5: Binding Service Data To UI](#section-55-binding-service-data-to-ui)
- [Minification Safe Code](#minification-safe-code)
- [Wrap-up](#wrap-up)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->


## Section 5.0: Adding New Page

1. under the www folder, create a directory called templates
1. In the www/templates directory, create a file called projects.html
1. Use the snippet ionicview to generate the ion-view code.
    * This will have a few fields to fill out as part of the template.  When you are done filling out each field press tab to go to the next one
    * Values to fill out:
        * view-title: Projects
1. Press Esc to exit the snippet

## Section 5.1: Add Route to New Page

1. In the www/js create a directory called config
1. In the www/js/config directory create a file called app.config.js
1. Open the www/js/config/app.config.js file and add the following code:
        
        angular.module('starter')
          .config(config);

        config.$inject = ['$stateProvider', '$urlRouterProvider'];

        function config ($stateProvider, $urlRouterProvider) {
          $stateProvider
            .state('projects', {
              url: '/projects',
              templateUrl: 'templates/projects.html'
            })

          $urlRouterProvider.otherwise('/projects');
        }
1. Open the index.html file and replace the content in the &lt;body&gt; tag with the following

        <ion-pane>
            <ion-nav-bar class="bar-calm">
                <ion-nav-back-button>
                </ion-nav-back-button>
            </ion-nav-bar>

            <ion-nav-view></ion-nav-view>
        </ion-pane>

1. In the index.html file after the script reference to app.js we need to add a script tag for the js/config/app.config.js file.
1. If you don't already have ionic serve running, open a command prompt and run the command

        $ ionic serve

1. In your web browser, open [http://localhost:8100](http://localhost:8100)
1. You should see the following in your web browser

    ![Projects Blank Page]({{ "projects-initial-view.png" | prepend: imagedir }})

1. We have now add the placeholders for the page.  In the next section we will add the controllers and services to get data.

## Section 5.2: Creating Your First Service

**Section Overview**

In this section, you will be creating your first service to pull data from a remote url.  Initially we will be hard coding our data in a local json and pulling it through $http but in future labs we will be creating a REST api using [Back&](http://backand.com).

**Steps**

1. In the www directory, create a new file called projects.json
1. Add the following information to the file:

        [{
          "name": "Yoveo",
          "created_on": "9/24/2015",
          "created_by": "Ronald Matthews"
        }, {
          "name": "Linkbuzz",
          "created_on": "11/6/2015",
          "created_by": "Brenda Jordan"
        }, {
          "name": "Minyx",
          "created_on": "1/22/2016",
          "created_by": "Ryan Wilson"
        }, {
          "name": "Midel",
          "created_on": "2/17/2016",
          "created_by": "Anna Fisher"
        }, {
          "name": "Topicstorm",
          "created_on": "5/27/2015",
          "created_by": "Chris Johnston"
        }]

1. In the www/js directory, create a new directory called services
1. In the www/js/services directory, create a new javascript file called projects.service.js
1. Using the angular snippet ng1factory to generate a new service snippet.
    * This will have a few fields to fill out as part of the template.  When you are done filling out each field press tab to go to the next one
    * Values to fill out:
        * Module: starter
        * Service: ProjectsService
        * dependency1: $http
        * exposedFn: getProjects
1. Press Esc to exit the snippet
1. Change the getProjects function to look like the following.  This will get the data from the projects.json file.

        function getProjects() {
            return $http.get("/projects.json")
                .then(function (result) {
                    return result.data;
                });
        }

## Section 5.4: Creating Your First Controller

**Section Overview**

In this section, you will be creating your first controller that the html view will use to communicate with the ProjectsService.

**Adding Controller**

1. In the www/js directory, create a new directory called controllers
1. In the www/js/controllers directory, create a new javascript file called projects.controller.js
1. Use the ng1controller snippet to generate the controller code
    * This will have a few fields to fill out as part of the template.  When you are done filling out each field press tab to go to the next one
    * Values to fill out:
        * Module: starter
        * Controller: Projects
        * dependency1: ProjectsService
1. Press Esc to exit the snippet
1. Add the call to the ProjectsServices in the activate function

        function activate() {
              ProjectsService.getProjects().then(function (response) {
                vm.projects = response;
              })
         }

    * This says when the ProjectsService returns the data from getProjects() then store it in vm.projects;


**Updating Route to Add Controller**

Now we need to tell angular that the Projects view uses the ProjectsController.  We do this by modifying the projects route.

We need to add in a controllerAs property for the projects route and set it to ProjectsController.

       controller: 'ProjectsController as vm'

**Add javascript files to index.html**

In order to use the new controller and service that we created we need to add the script reference tags into the index.html page after the app.js file.

      <!-- your app's js -->
      <script src="js/app.js"></script>
      <script src="js/services/projects.service.js"></script>
      <script src="js/controllers/projects.controller.js"></script>

**Updating UI to Show Projects**

Now we are ready to show the project data on our project view.  We will first just output the json view of the data and then we will create the real UI.

1. Open the projects.html template and instead the &lt;ion-content&gt;  add the following to write out the json results:
        {% raw %}
        <pre>{{ vm.projects | json }}</pre>
        {% endraw %}

    * In AngularJS, {{ }} brackets tells Angular to bind what is between the brackets to the UI.  In this case we are taking the vm.projects and showing the raw json for the object.
    * The &lt;pre&gt;&lt;/pre&gt; tags make the json look a little more readable by keeping the break returns

1. Run ionic serve and view the application in the web browser
1. You should see a view similar to this with the json showing.

    ![Projects Raw Json]({{ "projects-raw-json.png" | prepend: imagedir }})
    

## Section 5.5: Binding Service Data To UI

**Section Overview**

So far you have just bound the json output to the UI.  Useful for debugging but not what you want a user to see.  In this section, we will create a nice looking contact list that shows the contact's first name, email address and a picture of them.   The UI should look like the following when done, 

![project list with json included]({{"projects-ion-list-with-json.png" | prepend: imagedir }})

**Steps**

1. Open the www/templates/projects.html
1. Inside of the &lt;ion-content&gt; use the snippet ioniclist to generate a ion-list and item-item component
    * Values:
        * item: project
        * items: vm.projects
1. For the projects list, you want to loop through each contact and bind the following:
    * name
    * created_on

    > If you are unfamiliar with AngularJS, the ng-repeat on the ion-item is the command to loop through a collection

1. Put the name inside an &lt;h2&gt; and the created_on inside a &lt;p&gt;
1. For extra spacing, I also put a &lt;br /&gt; between the name and created_on
1. Your view should now look like the screenshot at the start of this section.
1. Once you get your view looking right, you can remove or comment out the &lt;pre&gt; tag

    ![project list without json included]({{"projects-ion-list-without-json.png" | prepend: imagedir }})

To see the full docs on the &lt;ion-list&gt; documentation, at the command prompt, type ionic docs ion-list or go to [http://ionicframework.com/docs/api/directive/ionList/](http://ionicframework.com/docs/api/directive/ionList/)

## Minification Safe Code

For a web site that you are going to be deploying to a web server vs running locally, it is best practice to minify the code.  However, with creating application that are intended to run locally on a device, there is mixed opinions on if you need to worry about being able to safely minify your code.

All of the code that we will be creating as part of this workshop will be minification safe, however, some of the code that is part of the ionic templates is not minification safe out of the box.  For the blank template the main issue is the app.js run block.  You could easily follow the same pattern as the app.config.js file and rewrite the run function.

Why do we even need to worry about this?  The reason is that Angular uses dependency inject and when the code is minified, values such as $http get changed to variable names like "a".  When the variable becomes "a" then Angular does not know anything about "a" so it just throw an injector error.  By making the code minification safe $http is left as $http so that Angular knows to pass into the function.

Out of the box Ionic does not provide any gulp tasks to minify css, javascript or html code.  It is not difficult to write these task or find one that suits you needs if you deem this a critical requirement.

**example of NOT minification safe code**

    angular.module('starter', ['ionic'])
    .run(function($ionicPlatform) {
    })

In this code $ionicPlatform will be changed to a value that Angular does not understand.

**example of minification safe code**

    angular
      .module('todo')
      .run(runBlock);

    Block.$inject = ['$ionicPlatform'];

    function runBlock($ionicPlatform) {
    }

In this code the run block is written to use the $inject option to tell Angular that the parameter passed to the runBlock function is $ionicPlatform.  This in turn means that you can change the parameter name of the runBlock to anything that you want and Angular will still see  the underlying value as $ionicPlatform.


## Wrap-up

We did a lot in this lab.  You created your first service, first controller, and bound some data to the UI.  This lab sets the foundation for the workflow of creating views in Ionic.  In the next lab, we will enable viewing the tasks associated to a project when you click on the project row.