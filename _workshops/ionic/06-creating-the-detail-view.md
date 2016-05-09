---
collection: workshops
title: 'Lab 06: Adding Details Page'
published: true
type: ionic
layout: workshoppost2
length:
order: 6
lab: ionic
todo: |
    * **LEFT ON 6.1**
    * Update objectives
    * done - remove git section
    * updating styling section
    * update screenshots
    * change api to be hard coded
    * update length
    * update section numbers
---

## Objective

* Create the detail view part of the master detail view
* Link from the master view to the detail view
* Setup routing for a view and pass in a parameter
* Use the Ionic css classes to style the UI

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
<h2>Table of Contents</h2>

- [Section 6.0: Adding the Contact Details Page](#section-60-adding-the-contact-details-page)
- [Section 6.3: Giving the UI a Little Class](#section-63-giving-the-ui-a-little-class)
- [Wrap-up](#wrap-up)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## Section 6.0: Adding the Contact Details Page

**Steps**

1. In the www/templates directory, create a file called tasks.html
1. You the ionicview snippet and set the view-title to "Tasks"
1. Open the www/js/config/app.config.js file and in the config function, add the following route after the projects state that we added in the previous lab.

        .state('tasks', {
            url: '/tasks/:index',
            templateUrl: 'templates/tasks.html'
          });

1. In the www/templates/projects.html file, on the ion-item element add an ng-href attribute to make each row link to the tasks page.  Each row can be referenced by the index number in the projects array by using {{ $index }}.
    * Hint: To get Angular to trigger the router path, start the ng-href url with a #/.
1. If you don't already have ionic serve running, open a command prompt and run the command ionic serve
1. In your web browser, open [http://localhost:8100](http://localhost:8100)
1. Now when you click on a row in the project list, it should go to the task list page and give you navigation to go back to the contact list

    ![Blank Tasks View](../images/detail-view/detail-view-blank.png)
    
## Section 6.1: Creating the Contact Controller

**Steps**
        
1. In the www/js/controllers directory, create a new javascript file called tasks.controller.js
1. Add the tasks.controller.js file to the index.html file.
1. Add the following code to the tasks.controller.js file.

        angular.module('starter')
            .controller('ContactDetailsCtrl', function ($scope, $stateParams, ContactsService) {
            });

1. To get the index of the user we want to view, use the $stateParams.  The variable name will be the same as the one we put into the router.  
1. Create a method in the ContactsService that returns the contact from the contacts array.
1. In the ContactDetailsCtrl, you need to call the newly created method for the ContactsService and set the returned output to a variable that is able to be seen by the UI. 
1. Open the contact.html and output the json for your contact variable.
1. In the app.js, don't forget to tell the router about the ContactDetailsCtrl controller.
1. Now when you run ionic serve and click on a contact in the contacts list, you should have a view such as the following:

    ![Lab4-ContactDetailsJson.png](../images/Lab5/Lab5-ContactDetailsJson.png)
    
## Section 6.2: Making a Pretty UI

**Section Overview**

Now that everything is functional, lets design the contact details UI.  When we are done with the UI it should like this: 

![Lab4-ContactDetailsPrettyUI.png](../images/Lab5/Lab5-ContactDetailsPrettyUI.png)

**Steps**

To make this UI, we are going to use a an Ionic feature called Cards.  The documentation for the Cards is available at [http://ionicframework.com/docs/components/#cards](http://ionicframework.com/docs/components/#cards)

The icons I used are:

* ion-home
* ion-email
* ion-ios-telephone
* ion-iphone

You can experiment with different icons.  You can search for other icons at [http://iconicons.com](http://ionicons.com).  All of these icons are free and included with the Ionic Framework.

Once you get it the way that you want it to, remove the json text output that is being displayed.

## Section 6.3: Giving the UI a Little Class

**Section Overview**

The UI right now is functional but not very pretty.  We are going to modify it to look like the following:

![Lab4-ContactsCompletedExample.png](../images/Lab4/Lab4-ContactsCompletedExample.png)

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

We now have a fully functional Master/Detail style page.  You could easily reuse the setup that we did for the Master/Detail in your application if you need similar functionality.  In the next lab, we are going to upload this application to a device using the Ionic View application.  