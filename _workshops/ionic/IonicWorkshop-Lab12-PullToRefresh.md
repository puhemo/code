---
collection: workshops
title: 'Lab 12: Refreshing Data'
published: true
type: ionic
layout: workshoppost
---


<H1>???? LAB NEEDS SCREENSHOTS UPDATED ????</h1>


Length: 10 minutes

## Objective

* Add the ability to refresh the contacts list with pull down to refresh functionality.

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
<h2>Table of Contents</h2>

- [Git Setup (Optional)](#git-setup-optional)
- [Section 10.0: Add ion-refresher and wiring it up](#section-100-add-ion-refresher-and-wiring-it-up)
- [Section 10.1: Testing it in the browser](#section-101-testing-it-in-the-browser)
- [Wrap-up](#wrap-up)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## Git Setup (Optional)

During this lab, you will be able to follow along using git to checkout the completed version of the steps in each section if you do not want to write all of the code yourself. 

If you intend to use the completed version of the steps, you need to clone the repository for this lab.

    $ git clone https://github.com/IonicWorkshop/Lab10-PullToRefresh.git

This lab builds on Lab 9.  If you did not do or complete this lab, use the command above to checkout Lab 10 and then run the checkout command below to take it to the point of the completed Lab5.

    $ git checkout -f Lab9Completed


## Section 10.0: Add ion-refresher and wiring it up

**Get Completed Steps (optional)**

If you are following along using git, reset your project to Step0.

    $ git checkout -f Step0

**Steps**

1. Add the GetNewContact method below to the contacts service.

        GetNewContact: function(){
            return $http.get(BASE_URL + '?q' + (n++))
                .then(function(response){
                    return response.data.results[0];
                });
        }
        
1. For the contacts controller

    * Add a doRefresh function that the UI can call
    * Within the doRefresh function, call the GetNewContact function and concat the returned contact to the contacts variable.
    * Tell the Ionicframework that the refresh is complete.  
1. Finally, add an ion-refresher to the contacts.html view and wire it up to call the doRefresh function in the contacts controller.  

ion-refresher documentation can be found:
    * [http://ionicframework.com/docs/api/directive/ionRefresher/](http://ionicframework.com/docs/api/directive/ionRefresher/)
    * Running the ionic docs ion-refresh command line.

## Section 10.1: Testing it in the browser

1. If you don't already have ionic serve running, open a command prompt and run the command ionic serve
1. In your web browser, open [http://localhost:8100](http://localhost:8100)
1. To test the pull to refresh in the browser you will need to turn on device emulation.
1. Chrome:
    * Open the Chrome Developer Tools
    
        ![Lab10-OpenDeveloperTools.png](../images/Lab10/Lab10-ChromeOpenDeveloperTools.png)
    
    *  Click on the phone looking icon in the upper left of the Developer tools.
    
        ![Lab10-TurnOnDeviceEmulationChrome.png](../images/Lab10/Lab10-ChromeTurnOnDeviceEmulation.png)
        
    * Click on the &lt;Select Model&gt; drop down and select a model.  
        
        ![Lab10-ChromeDeviceEmulationSelectModel.png](../images/Lab10/Lab10-ChromeDeviceEmulationSelectModelEmpty.png)
        
        ![Lab10-ChromeDeviceEmulationSelectModel.png](../images/Lab10/Lab10-ChromeDeviceEmulationSelectDevice.png)
        
    * Once a model has been selected, you will get a warning message that you might need to reload the page to get it to render properly.  Go ahead and refresh the page.    
        
        ![Lab10-ChromeDeviceEmulationRefreshWarning.png](../images/Lab10/Lab10-ChromeDeviceEmulationRefreshWarning.png)
        
    * After page has been refreshed, it will be the size of the emulated device and your cursor will change to a circle
        
        ![Lab10-ChromeDeviceEmulationRunning.png](../images/Lab10/Lab10-ChromeDeviceEmulationRunning.png)
        
1. Now you can pull the page down with the mouse to start the pull to refresh.
1. Each time you do a pull to refresh it should add 1 person to the contact list
1. To see how it looks for Android vs iOS, change your browser url to [http://localhost:8100/ionic-lab](http://localhost:8100/ionic-lab)

## Wrap-up

Pull to refresh is a standard functionality that users have come to expect.  The Ionic team made it very easy to add this functionality to your application.  In less than 5 minutes you can add pull to refresh to your application.
