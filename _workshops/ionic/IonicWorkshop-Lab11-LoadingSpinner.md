---
collection: workshops
title: 'Lab 11: Adding a Loading Spinner'
published: true
type: ionic
layout: workshoppost2
order: 11
lab: ionic
length:
todo: |
    * Finish lab
    * update length
---

## Objective

* Add a loading spinner to the contact list on initial page load.

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
<h2>Table of Contents</h2>

- [Git Setup (Optional)](#git-setup-optional)
- [Section 11.0: Add ionicLoading and Wiring It Up](#section-110-add-ionicloading-and-wiring-it-up)
- [Section 11.2: Testing it in the browser](#section-112-testing-it-in-the-browser)
- [Wrap-up](#wrap-up)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## Git Setup (Optional)

During this lab, you will be able to follow along using git to checkout the completed version of the steps in each section if you do not want to write all of the code yourself. 

If you intend to use the completed version of the steps, you need to clone the repository for this lab.

    $ git clone https://github.com/IonicWorkshop/Lab11-AddingALoadingSpinner.git


## Section 11.0: Add ionicLoading and Wiring It Up

**Get Completed Steps (optional)**

This lab builds on Lab 10.  If you did not do or complete this lab, use the command above to checkout Lab 11 and then run the checkout command below to take it to the point of the completed Lab5.

    $ git checkout -f Lab10Completed

If you are following along using git, reset your project to Step0.

    $ git checkout -f Step0

**Steps**

1. In the contacts controller, you will need to add an ionicLoading show that has an ion-spinner in the template. 

        <ion-spinner icon="spiral"></ion-spinner>

1. In the contacts controller you will want to hide the ionicLoading once the GetContacts function promise has returned.  
    * Make sure to use a finally to ensure it always hides even if the GetContacts fails.

The ionicLoading documentation can be found 

* By running the command line command: ionic docs ionicLoading 
* [http://ionicframework.com/docs/api/service/%24ionicLoading/](http://ionicframework.com/docs/api/service/%24ionicLoading/)

## Section 11.2: Testing it in the browser

1. If you don't already have ionic serve running, open a command prompt and run the command ionic serve
1. In your web browser, open [http://localhost:8100](http://localhost:8100)
1. To see how it looks for Android vs iOS, change your browser url to [http://localhost:8100/ionic-lab](http://localhost:8100/ionic-lab)
1. As the page is loading, you should see the spinner and then once the contacts list has been returned it will be hidden.  

    ![Lab10-IonicLoadingSpinner.png](images/Lab11/Lab11-IonicLoadingSpinner.png)

1. If you do not see the spinner, make sure that you are injecting it into your controller.  

## Wrap-up

It is always a good idea from a user experience standpoint to let users know when there is a long running process happening.  With the ion-spinner you can quickly add this functionality.  
