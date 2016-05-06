---
collection: workshops
title: 'Lab 05: Adding Details Page'
published: true
type: ionic
layout: workshoppost2
order: 5
lab: ionic
---


Length: 30 minutes

## Objective

* Create the detail view part of the master detail view
* Link from the master view to the detail view
* Setup routing for a view and pass in a parameter

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
<h2>Table of Contents</h2>

- [Git Setup (Optional)](#git-setup-optional)
- [Section 5.0: Adding the Contact Details Page](#section-50-adding-the-contact-details-page)
- [Wrap-up](#wrap-up)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## Git Setup (Optional)

During this lab, you will be able to follow along using git to checkout the completed version of the steps in each section if you do not want to write all of the code yourself. 

If you intend to use the completed version of the steps, you need to clone the repository for this lab.

    $ git clone https://github.com/IonicWorkshop/Lab5-CreatingADetailView.git


This lab also builds on the previous lab.  If you did not do or complete the previous lab, use the command above to checkout the Lab5 completed version and then run the checkout command below to take it to the point of the completed Lab4.

    $ git checkout -f Lab4Completed


## Section 5.0: Adding the Contact Details Page

**Get Completed Steps (optional)**

To download the completed steps for this section, run the following git command: 

    $ git checkout -f Step0

**Steps**

1. In the www/templates directory, create a file called contactdetails.html
1. Replace the contents of the contactdetails.html with the following:

        <ion-view title="Contact Details">
            <ion-content>
                    Nothing to See Here
            </ion-content>
        </ion-view>
1. Open the js/app.js file and in the .config function, add the following route after the contacts state that we added in the previous lab.

        .state('contactdetails', {
            url: '/contactdetails/:index',
            templateUrl: 'templates/contactdetails.html'
        });

1. On the contacts.html, on the ion-item element add the ng-href attribute below to make each row link to the contact page.  Each row can be referenced by the index number in the contacts array by using {{ $index }}.  
    * Hint: To get Angular to trigger the router path, start the ng-href url with a #/.
1. If you don't already have ionic serve running, open a command prompt and run the command ionic serve
1. In your web browser, open [http://localhost:8100](http://localhost:8100)
1. Now when you click on a row in the contact list, it should go to the contact details page and give you navigation to go back to the contact list

    ![Lab4-ContactDetailsPlaceholder.png](../images/Lab5/Lab5-ContactDetailsPlaceholder.png)
    
## Section 5.1: Creating the Contact Controller

**Get Completed Steps (optional)**

If you are following along using git, reset your project to Step1.

    $ git checkout -f Step1

**Steps**
        
1. In the www/js directory, create a new javascript file called ContactDetailsCtrl.js
1. Add the ControlDetailCtrl to the index.html file.
1. Add the following code to the ContactsCtrl.js file.

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
    
## Section 5.2: Making a Pretty UI

**Section Overview**

Now that everything is functional, lets design the contact details UI.  When we are done with the UI it should like this: 

![Lab4-ContactDetailsPrettyUI.png](../images/Lab5/Lab5-ContactDetailsPrettyUI.png)

**Get Completed Steps (optional)**

If you are following along using git, reset your project to Step2.

    $ git checkout -f Step2

**Steps**

To make this UI, we are going to use a an Ionic feature called Cards.  The documentation for the Cards is available at [http://ionicframework.com/docs/components/#cards](http://ionicframework.com/docs/components/#cards)

The icons I used are:

* ion-home
* ion-email
* ion-ios-telephone
* ion-iphone

You can experiment with different icons.  You can search for other icons at [http://iconicons.com](http://ionicons.com).  All of these icons are free and included with the Ionic Framework.

Once you get it the way that you want it to, remove the json text output that is being displayed.

## Wrap-up

We now have a fully functional Master/Detail style page.  You could easily reuse the setup that we did for the Master/Detail in your application if you need similar functionality.  In the next lab, we are going to upload this application to a device using the Ionic View application.  