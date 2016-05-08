---
collection: workshops
title: 'Lab 04: Adding Master View'
published: true
type: ionic
layout: workshoppost2
order: 4
lab: ionic
todo: |
    * Update objectives
    * Add adding routes
    * Update for Projects page instead of Contacts.html
    * Make first service pull data from json file
    * explain minification safe options
    * explain why you may not care about minification
    * Show how to output the json version of projects
---
Length: 30 minutes

## Objectives

* Add a new view into the UI (master view part of master/detail view)
* Create our first service
* Bind data to the UI
* Use the Ionic css classes to style the UI

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
<h2>Table of Contents</h2>

- [Git Setup (Optional)](#git-setup-optional)
- [Section 4.0: Adding New Page](#section-40-adding-new-page)
- [Section 4.1: Creating Your First Service](#section-41-creating-your-first-service)
- [Section 4.2: Binding Service Data To UI](#section-42-binding-service-data-to-ui)
- [Section 4.3: Giving the UI a Little Class](#section-43-giving-the-ui-a-little-class)
- [Wrap-up](#wrap-up)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## Git Setup (Optional)

During this lab, you will be able to follow along using git to checkout the completed version of the steps in each section if you do not want to write all of the code yourself. 

If you intend to use the completed version of the steps, you need to clone the repository for this lab.

    $ git clone https://github.com/IonicWorkshop/Lab4-AddingAView.git

## Section 4.0: Adding New Page

**Get Completed Steps (optional)**

To download the completed steps for this section, run the following git command: 

    $ git checkout -f Step0

**Steps** 

1. under the www folder, create a directory called templates
1. In the templates directory, create a file called contacts.html
1. Replace the contents of the contacts.html with the following:

        <ion-view title="Contacts">
            <ion-content>
                <ion-list>
                    Nothing to See Here
                </ion-list>
            </ion-content>
        </ion-view>

1. Open the js/app.js file and add the following to the bottom of the file so that the application routes to the contacts.html file.
        
        .config(function ($stateProvider, $urlRouterProvider) {
            $stateProvider
                .state('contacts', {
                    url: '/contacts',
                    templateUrl: 'templates/contacts.html'
                    })

            $urlRouterProvider.otherwise('/contacts');
        });

1. Open the index.html file and replace the content in the &lt;body&gt; tag with the following

        <ion-nav-bar class="bar-stable">
            <ion-nav-back-button>
            </ion-nav-back-button>
        </ion-nav-bar>
        
        <ion-nav-view></ion-nav-view>

1. If you don't already have ionic serve running, open a command prompt and run the command ionic serve
1. In your web browser, open [http://localhost:8100](http://localhost:8100)
1. You should see the following in your web browser

    ![Contacts Blank Page](../images/Lab4/Lab4-ContactsBlankPage.png)

1. We have now add the placeholders for the page.  In the next section we will add the controllers and services to get data.

## Section 4.1: Creating Your First Service

**Section Overview**

In this section, you will be creating your first service to pull data from a remote url.  You will be using the api, http://api.randomuser.me which returns random user data in json format that we can consume in our application.  Since the focus of this lab is not on creating Angular services but instead on creating a UI view, I will be giving you the code for the service.  You can view the documentation for the randomuser.me api at [https://randomuser.me/documentation](https://randomuser.me/documentation).

**Get Completed Steps (optional)**

To download the completed steps for this section, run the following git command: 

    $ git checkout -f Step1

**Steps**

1. In the www/js directory, create a new javascript file called ContactsService.js
1. Add the following code to the file

        angular.module('starter')
        .factory('ContactsService', function($http){
            var BASE_URL = "http://api.randomuser.me/";
            var numberOfContactsToFetch = 5;

            var items = [];
            var n = 0;
            return {
                GetContacts: function(){
                    return $http.get(BASE_URL+'?results=' + numberOfContactsToFetch).then(function(response){
                       items = response.data.results;
                        return items;
                    });
                }
            }
        });
1. In the js directory, create a new javascript file called ContactsCtrl.js
1. Add the following code to the ContactsCtrl.js file.  

        angular.module('starter')
            .controller('ContactsCtrl', function ($scope, ContactsService) {
        });

1. Within the controller above
    * Write the code to get the contacts from the ContactsService 
    
        * hint: ContactsService.GetContacts()
    
    * Store the data returns from the ContactsService in an array variable called contacts that is in scope for the UI.
    * You will want to use a promise.
    
        * hint: ContactsService.GetContacts().then(function (contacts) { });
        
1. Open the contacts.html template and replace the contents inside of the &lt;ion-list&gt; add the following to write out the json results:

        <pre>{{ contacts | json }}</pre>
        
    * In AngularJS, {{ }} brackets tells Angular to bind what is between the brackets to the UI.  In this case we are taking the $scope.contacts and showing the raw json for the object.
    * The &lt;pre&gt;&lt;/pre&gt; tags make the json look a little more readable by keeping the break returns
1. Open the index.html and add a script tag both the ContactService.js and ContactCtrl.js below the app.js script tag.
1. Open the app.js file and tell the router that the contacts state has a controller called ContactsCtrl
1. Run ionic serve and view the application in the web browser
1. You should see a view similar to this with the json showing.

    ![Contacts Raw Json](../images/Lab4/Lab4-ContactsRawJson.png)
    

## Section 4.2: Binding Service Data To UI

**Section Overview**

So far you have just bound the json output to the UI.  Useful for debugging but not what you want a user to see.  In this section, we will create a nice looking contact list that shows the contact's first name, email address and a picture of them.   The UI should look like the following when done, 

![Lab4-ContactBindNoStyles.png](../images/Lab4/Lab4-ContactBindNoStyles.png)

**Get Completed Steps (optional)**

To download the completed steps for this section, run the following git command: 

    $ git checkout -f Step2
    
**Steps**

1. Open the templates/contacts.html
1. Inside the &lt;ion-list&gt; tag we are going to add an &lt;ion-item&gt;&lt;/ion-item&gt; tag for each contact in the json results.
1. For the contacts list, you want to loop through each contact and bind the following:
    * First Name
    * Email Address
    * Picture
1. You will need to look at the json output to find the properties for the different values to bind
1. If you are unfamiliar with AngularJS, ng-repeat is the command to loop through a collection
1. To get to the &lt;ion-list&gt; documentation, at the command prompt, type ionic docs ion-list or go to [http://ionicframework.com/docs/api/directive/ionList/](http://ionicframework.com/docs/api/directive/ionList/)


## Section 4.3: Giving the UI a Little Class

**Section Overview**

The UI right now is functional but not very pretty.  We are going to modify it to look like the following: 

![Lab4-ContactsCompletedExample.png](../images/Lab4/Lab4-ContactsCompletedExample.png)

**Get Completed Steps (optional)**

To download the completed steps for this section, run the following git command: 

    $ git checkout -f Step3

**Steps**

1. To get it styled correctly, you need to add the correct css classes to the ion-item element.  
1. For the profile picture, you want to turn it into an avatar. Refer to the documentation for the CSS styles of a list
    * [http://ionicframework.com/docs/components/#list](http://ionicframework.com/docs/components/#list)
1. To add the right arrow icon to refer to the Icons documentation 
    * [http://ionicframework.com/docs/components/#icons](http://ionicframework.com/docs/components/#icons).  
    * The icon I used was ion-chevron-right.
1. View the application in the web browser and take a look at the layout and icon.
1.  You will notice two things about the icon
    * First is that the arrow is bold looking and fairly big
    * Second is that the &gt; arrow did not automatically right align and instead is inline with the rest of the text
1. To fix the arrow color, add the class icon-accessory to the icon. 
1. To fix the layout, take a look at the List icon documentation to find the class to use.  
    * [http://ionicframework.com/docs/components/#item-icons](http://ionicframework.com/docs/components/#item-icons) 
1. View the application in the web browser.  You should see that the layout is correct and the arrow is the right color.

    ![Lab4-ContactsCompletedExample.png](images/Lab4/Lab4-ContactsCompletedExample.png)

1.  Finally, remove the json output from the UI

## Wrap-up

We did a lot in this lab.  You created your first service, bound some data to the UI, and styled it.  This lab sets the foundation for the workflow of creating views in Ionic.  In the next lab, we will enable viewing of a contact's details when you click on them.