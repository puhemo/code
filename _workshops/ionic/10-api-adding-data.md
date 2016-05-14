---
collection: workshops
title: 'Lab 10: Adding Data'
published: true
type: ionic
layout: workshoppost2
order: 10
lab: ionic
length:
todo: |
    * Finish lab
    * update length
    * Add $scope and $state to the list of dependencies that are needed
    * Add exposing `ProjectsController.saveNewProject to `vm.`
    * LEFT off at 10.0.2.
---

{% assign imagedir = "../images/adding-data/" %}

{:.fake-h2}
Objective

Up to this point everything for projects and tasks has been read only.  We are going to be implementing the functionality to add data.

Key Concepts:

* Ionic Modal Dialog usage
* Adding icons into the Header
* Updating an ion-list with new items
* Making a REST post call to the Back& API

{:.fake-h2}
Table of Contents


* TOC
{:toc}

## 10.0: New Project Page

To add a new project we are going to use a modal dialog on the projects page to popup the form.  Our form for this lab will consist of a single field for the project name.  The Ionic Framework has a modal dialog directive built into it that we can leverage.

### 10.0.1: Modal Dialog

**Create the modal template file**

1. In the www/templates directory created a new file called projects-modal-add.html
1. In the projects-add.html file, use the `i1_modal_html` snippet to generate the view boilerplate code and set the title to "New Project"
1. Press Esc to exit the snippet

**Wiring up the show and hide for the modal**

1. In the www/templates/projects-modal.add.html file to the `ion-header-bar` we are going to add a button to the header after the title that will close the dialog when it is opened.

            <button class="button button-clear button-positive"  ng-click="vm.closeProjectModal()">Cancel</button>

1. Open up the www/js/projects.controller.js file
1. Inside the `activate` function we need to setup the `ionicModal` with what template to use and set the scoping variable for the modal.

          $ionicModal.fromTemplateUrl('templates/projects-modal-add.html', {
            scope: $scope
          }).then(function (modal) {
            vm.projectModal = modal;
          });

1. Make sure to inject `$scope` and `$ionicModal` into the controller
1. In order to have the modal open and close we need to create the methods to call the vm.projectModal `show()` and `hide()` functions.

        function showProjectModal() {
          vm.projectModal.show();
        }

        function closeProjectModal() {
          vm.projectModal.hide();
        }

1. We need to make sure that these 2 functions are exposed to the view by adding them to the vm variable at the top of the `ProjectController` function

        vm.showProjectModal = showProjectModal;
        vm.closeProjectModal = closeProjectModal;

The last thing before we can test the show and hide functionality is to add a way to launch the modal dialog on the Project page.  We are going to do that by adding an icon into the header that will launch the modal.

1. Open the www/js/templates/projects.html file
1. Between the `<ion-view>` and `<ion-content>` we need to add a `<ion-nav-buttons>` section by using the ionic `i1_navbuttons_right` snippet
    * ng-click: vm.showProjectModal()
    * content: use the `i1_iconplus` snippet
1. To the &lt;button&gt; element add the css class button-icon
1. If you don't already have ionic serve running, open a command prompt and run the command ionic serve
    * On the Projects page you will now see a ![Plus Icon]{{"plus-icon.png" | prepend: imagedir }}).  If you click on the icon the "New Project" modal should open up and if you click the cancel text on the modal it should close it.

Now lets add the actual form to input the "New Project"

1. Open the www/templates/projects-modal-add.html
1. Inside of the `<content>` section add the following form

           <form ng-submit="vm.saveNewProject(vm.project)">
              <div class="list">
                <label class="item item-input item-text-wrap">
                  <input type="text" placeholder="Project Name" ng-model="vm.project.name">
                </label>
              </div>
              <div class="padding">
                <button type="submit" class="button button-block button-positive">Create Project</button>
              </div>
            </form>
1.  When you open up the modal, the form will look like this

    ![New Project Form]({{"new-project-form.png" | prepend: imagedir }})

We are now ready to wire up the form to post data to the API.

### 10.0.2: Posting to our API

In this section we will be adding the functions needed to send data to the API and bind it to the UI for the Project page.

**Creating the Service Add Methods**

1. Open the www/js/services/projects.service.js
1. Add a new method called `addProject` that takes 1 parameter called name.

        function addProject(name) {

        }

1. Don't forget to expose the function by adding it to the service object at the top of the `ProjectsController` function

            var service = {
              getProjects: getProjects,
              addProject: addProject
            };

1. in the `addProject` function we are going to create a JSON object called `project` that has properties called `name` and `created_on`.
    * name: name
    * created_on: new Date()

        var project = {
            "name": name,
            "created_on": new Date()
        }
1. To send data to Back& we need to create a $http post call that calls `Backand.getApiUrl() + '/1/objects/project'` and passed in the `project` json object as a data property.  This will then return a promise that we want to capture and return `result.data`

        return $http({
                method: 'post',
                url: Backand.getApiUrl() + '/1/objects/project',
                data: project,
                params: { returnObject: true }
              }).then(function (result) {
                return result.data;
              });

**Wiring Up the Controller**

1. Open the www/js/controllers/project.controller.js file
1. Create a new function called saveNewProject that takes in an object named project
    * This function will call the `ProjectsService.addNewProject` method and upon successful add will add the project to the UI project list, close the modal and clear out the new project name field

            function saveNewProject(project) {
              var projectName = project.name;
              ProjectsService.addProject(project.name)
                .then(function (result) {
                  vm.projects.push(result);
                  vm.closeProjectModal();
                  project.name = '';
                  $state.go('tasks', { projectId: result.id, projectName: result.name }, { localtion: true });
                });
            }



### 10.0.3: Redirecting to Task Page


## 10.1: New Task Page

### 10.1.1: Modal Dialog

### 10.1.2: Posting to our API

### 10.1.2: Adding new task into list

## Wrap-up