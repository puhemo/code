---
collection: workshops
title: 'Lab 15: Paging Data'
published: true
type: ionic
layout: workshoppost2
order: 15
lab: ionic
length: 
todo: |
    * update objectivs
    * update wrap up
    * update length
    * update imagedir
    * check data length on project add to see if there is more data to load
    * check data length on page refresh to see if there is more data to load
    *
---

{% assign imagedir = "../images/paging-data" %}

{:.fake-h2}
Objective

As your data grows in size you may not want to always pull down all of the data and instead only pull down only a few records at a time.  The Back& service that we are using supports paging and the UI component from Ionic for paging to called infinite scroll.  Infinite scroll is pretty easily to implement but it does have some quirks that can be baffling to get working correctly if you have not done it before.  This lab will guide you through implement infinite scroll and working through the quirks of it.

Key Concepts:

* ionic infinite scroll component
* angular ng-if
* true paging with Back&


{:.fake-h2}
Table of Contents

* TOC
{:toc}


## 15.0:  Paging in Back&

The first thing we need to do is implement paging in the Back& service call for getting projects.  This functionality is supported out of the box.  We just have to tell Back& which page to start on and how many records to pull.

1. Open the www/js/services/projects.service.js file
1. To the `getProjects` function add 2 parameters called `pageNumber` and `pageSize`

        function getProjects(pageNumber, pageSize){
            .....
        }

1.  Now we need to add the `pageNumber` and `pageSize` parameters to the params objects.  The code below sets default values for pageSize and pageNumber if nothing is passed into the function.

         return $http({
                method: 'GET',
                url: Backand.getApiUrl() + '/1/objects/project',

                params: {
                  sort: '[{ "fieldName": "name", "order": "asc" }]',
                  pageSize: pageSize || 10,
                  pageNumber: pageNumber || 1
                }
              }).then(function (result) {
                return result.data.data;
              });


## 15.1 Paging in the Project Controller

Now that the Projects service supports paging, we need to update the `ProjectsController` to support paging.

1. Open the www/js/controllers/projects.controller.js
1. We need to add variables to track the page number and page size.  We will also set them the default values that we want to use which is a page size of 10 and page number set to 0 (we will increment to 1 in the first call).

        vm.pageNumber = 0;
        vm.pageSize = 10;


1.  Create a function called `getMoreProjects`.  This function will get any additional data from the Back& API, check to see if we have more paging of data to get, append the results to the existing data and tell the infinite scroll that it has completed.


        function getMoreProjects() {
          vm.pageNumber = vm.pageNumber + 1;
          ProjectsService.getProjects(vm.pageNumber, vm.pageSize)
            .then(function (result) {
              var rowNum = result.length ;
              if (rowNum === 0 || rowNum < vm.pageSize) {
                vm.moreDataCanBeLoaded = false;
              }

              if (rowNum > 0) {
                vm.projects = vm.projects.concat(result);
              }
            })
            .finally(function () {
              $scope.$broadcast('scroll.infiniteScrollComplete')
            });
        }

1. Don't forget to expose the `getMoreProjects` function to the view

              vm.getMoreProjects = getMoreProjects;

1. We also need add the flag to the controller that set in the `getMoreProjects` function that sets if more data can be loaded.

        vm.moreDataCanBeLoaded = true;

We are technically done with the implementation of the infinite scroll in the controller.  However, one of the quirks that I ran into is that the `ion-refresher` was causing the infinite scroll to trigger.  To stop it from doing this, I added a refreshing flag to the `getProjects` function that tells the view that we are refreshing so that we can let the infinite scroll know not to trigger right now.  The flag is called `vm.refreshing` set to true on entering the function and in the finally block set to false so that the infinite scroll can be turned back on.

         function getProjects() {
            vm.refreshing = true;
            ProjectsService.getProjects().then(function (response) {
                vm.projects = response;
            })
            .finally(function () {
                $scope.$broadcast('scroll.refreshComplete');
                vm.refreshing = false;
            });
         }

1. We need to modify the `getProjects` call to the ProjectsService to pass in the pageNumber of 1 and pageSize.  Since the `getProjects` is used for both getting initial data as well as refreshing data, we need to do a little bit of math to determine how many records to pull in since the infinite scroll could have pull in more than 1 page of data.  The formula for records to pull is `pageSize * pageNumber`

        function getProjects() {
            vm.refreshing = true;
            ProjectsService.getProjects(1, vm.pageSize*vm.pageNumber).then(function (response) {
                vm.projects = response;
            })
            .finally(function () {
                $scope.$broadcast('scroll.refreshComplete');
                vm.refreshing = false;
            });
         }

1. The infinite scroll will initially be called so we do not need to call the `getProjects` in the `activate` function but need to initialize the `vm.projects` array at the top the `ProjectsController` function

          function ProjectsController(ProjectsService, $ionicModal, $scope, $state, $ionicPopup, $ionicListDelegate) {
            var vm = this;
            ......
            vm.projects = [];
            activate();
            ......
          }

## 51.2 Paging in the View

We are now ready to add the `ion-infinite-scroll` to the view and test out the paging functionality.

1. Open the www/templates/projects.html
1. After the `ion-list`, use the `i1_infinitescroll` snippet to get the `<ion-infinite-scroll>`
    * on-infinite: vm.getMoreProjects()
    * distance: 1%
1. By default the infinite scroll will immediately check if there is more data.  We want to turn this off by setting the `immediate-check` attribute to false

          <ion-infinite-scroll
              on-infinite="vm.getMoreProjects()"
              distance="1%"
              immediate-check="false" >
          </ion-infinite-scroll>

1. The last thing we need to implement is the check on the `ion-infinite-scroll` to see if more data can be loaded and that the refresher is not running.  To do this we are going to use an Angular ng-if statement on the `ion-infinite-scroll`.

        <ion-infinite-scroll
              on-infinite="vm.getMoreProjects()"
              distance="1%"
              ng-if="vm.moreDataCanBeLoaded && !vm.refreshing"
              >
        </ion-infinite-scroll>

1. If you don't already have ionic serve running, open a command prompt and run the command ionic serve
1. In your web browser, open [http://localhost:8100](http://localhost:8100).  As long as you have enough projects listed, once you get near the bottom of the viewable list of projects, it will trigger the infinite scroll to pull in more projects.


## Wrap-up