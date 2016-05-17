---
collection: workshops
title: 'Lab 17: Adding Tabs'
published: true
type: ionic
layout: workshoppost2
order: 17
lab: ionic
length:
date: 2016-05-16
todo: |
    * update objectives
    * update wrap up
    * update length
    * write lab
    * {:done}update imagedir
---

{% assign imagedir = "../images/adding-tabs/" %}

{:.fake-h2}
Objective

Key Concepts:

* Add Tabs to existing UI

{:.fake-h2}
Table of Contents

* TOC
{:toc}


## Section 17.0:SectionTitle 


**tabs.html**

    <!--
    Create tabs with an icon and label, using the tabs-positive style.
    Each tab's child <ion-nav-view> directive will have its own
    navigation history that also transitions its views in and out.
    -->
    <ion-tabs class="tabs-icon-top tabs-color-active-positive" enable-menu-with-back-views="true">
      <ion-tab title="Projects" icon="ion-document" href="#/tab/projects">
        <ion-nav-view name="tab-projects"></ion-nav-view>
      </ion-tab>
      <ion-tab title="Profile" icon="ion-ios-person" href="#/tab/profile">
            <ion-nav-view name="tab-profile"></ion-nav-view>
        </ion-tab>
      <ion-tab title="About" icon="ion-at" href="#/tab/about">
        <ion-nav-view name="tab-about"></ion-nav-view>
      </ion-tab>
    </ion-tabs>

**app.config.js**

    $stateProvider
        .state('tab', {
          url: '/tab',
          abstract: true,
          templateUrl: 'templates/tabs.html'
        })
        .state('tab.projects', {
          url: '/projects',
          views: {
            'tab-projects': {
              templateUrl: 'templates/tab-projects.html',
              controller: 'ProjectsController as vm',
              resolve: {
                /* @ngInject */
                projects: function (ProjectService) {
                  // pageNumber: 1, pageSize: 10
                  return ProjectService.getProjects(1, 10);
                }
              }
            }
          }
        })
        .state('tab.tasks', {
          url: '/tasks/:projectId',
          params: {
            projectName: ""
          },
          views: {
            'tab-projects': {
              templateUrl: 'templates/tab-project-tasks.html',
              controller: 'TasksController as vm',
              resolve: {
                /* @ngInject */
                tasks: function ($stateParams, TaskService) {
                  return TaskService.getTasks({ id: $stateParams.projectId });
                }
              }
            }
          }
        })
        .state('tab.profile', {
          url: '/profile',
          views: {
            'tab-profile': {
              templateUrl: 'templates/tab-profile.html',
              controller: 'ProfileController as vm'
            }
          }
        })
        .state('tab.about', {
          url: '/about',
          views: {
            'tab-about': {
              templateUrl: 'templates/tab-about.html'
            }
          }
        })

## Wrap-up