---
collection: workshops
title: 'Lab 07: Improving The User Interface'
published: true
type: ionic
layout: workshoppost2
order: 7
lab: ionic
length: 
todo: |
    * item text wrap
     * right arrow on project list
     * checkbox icon for completed on task
     * css styling for completed task
     * update length
     * update objectives
     * update toc
---

{% assign imagedir = "../images/improving-ui/" %}

<div class="fake-h2">Objective</div>

* Understand how easy it is to make a good looking interface
* Fix the text in the project and task list from being truncated
* Make it more obvious if a task is completed or not

<div class="fake-h2">Table of Contents</div>

* TOC
{:toc}



## 7.0: Stop Text From Being Cut Off

In the last lab I don't know if you caught that the text for the tasks was being truncated or not but it was.  In some cases this might be ok, but in our case we need to see all of the details of the task.

![Task List with Truncated Text]({{ "tasks-ion-list-ordered.png" | prepend: imagedir }})

Thankfully ionic has a built-in css class to fix this issue.  We just need to add the class item-text-wrap to the ion-item for the ion-list.  We need to set this class in both the projects and tasks list.

    class="item-text-wrap"

![Task List with Wrapped Text]({{ "tasks-ion-list-text-wrapped.png" | prepend: imagedir }})

## 7.1: Making it Obvious That the Project is Clickable

From a usability perspective it is not obvious at all that the each row in the project list when clicked will take you to a 2nd page.  Looking at the screenshot of the project list you would not know that where is even a 2nd page

![Project List without right arrow]({{ "project-list-no-arrow.png" | prepend: imagedir }})

To remedy this we are going to add a right arrow to each row but the arrow should not draw your attention directly to it since it is just an accessory.  We also want this arrow to always be on the right side of the row and vertically centered.

1. Open the www/templates/projects.html file
1. Inside of the ion-item, use the snippet `ioniciconchevronright` to generate the right arrow icon.  For the icon, we are using the free [ionicons](http://ionicons.com) that come with ionic.
1. Save the file and view the page in the browser.  You will notice that the arrow just got added as a new line to the each row.

    ![Project List Arrow as New Line]({{"project-list-arrow-new-line.png" | prepend: imagedir }})

1. To get the arrow to appear on the right side of the row, we need to add the ionic class `item-icon-right` to each ion-item. You will notice that the arrow is big and dark though so it draws your eyes to it.

    ![Project List Arrow on Right Side but dark]({{"project-list-arrow-right-dark.png" | prepend: imagedir }})

1.  The final step is to add the class 'icon-accessory' to the chevron icon to make the arrow smaller and gray so that it doesn't draw your attention to it.

    ![Project List Arrow on Right Side, small and gray]({{"project-list-arrow-right-accessory.png" | prepend: imagedir }})


## 7.2: Give completed tasks some style

Right now the task list looks all the same regardless of if the task is completed or not.  As well the completed property for each task is a boolean value that can easily be represented with an icon.   In this section we will implement both of these features.

When we are done the task list will look like:

![Task List with Completed Task Grayed Out and Strikethough add]({{"tasks-ion-list-completed-styled.png" | prepend: imagedir }})

The first thing we need to do is replace the completed output and change it to an icon.


1. Open the file www/templates/tasks.html
1. Use the snippet 'ioniciconcheckmarkcircled' to generate the checkmark icon.
1. At this point the icon has been added but it is as a new line in each row.  Just like in the project list we need to use a built-in ionic css to put the icon on the left.  Add the class 'item-icon-left' to the ion-item.

Now that the icon placement is correct we need to tell angular to change the icon based on the value of the task.completed property.  On the ion-checkmark-circled icon we need to add an ng-class attribute.  This attribute allows us to use Angular logic to change the value of the css value that is used.

1. Remove the ion-checkmark-circled from the class attribute on the icon and add the following attribute to the icon

        ng-class="task.completed ? 'ion-checkmark-circled': 'ion-ios-circle-outline'"

    * The above statement says that when the task is completed use the ion-checkmark-circled icon else use the ion-ios-circle-outline icon.

At this point your ion-item code should look like:

{% raw %}
    <ion-item class="item-text-wrap item-icon-left"
        ng-repeat="task in vm.tasks | orderBy: ['completed','name']"
    >
        <h2>{{task.name}}</h2>

        <i class="icon"
            ng-class="task.completed ? 'ion-checkmark-circled': 'ion-ios-circle-outline'">
        </i>
    </ion-item>
{% endraw %}

The task list is starting to take shape and look a little bit better.

![Task List with Checkmark for value display]({{ "tasks-ion-list-checkmark.png" | prepend: imagedir }})

The last thing we are going to change is to make the completed task gray and have a line through the text.

1. On the ion-item we need to add an ng-class so that when the task is completed we add the css class completedTask

       ng-class="{completedTask: task.completed }"

1. Open the www/css/style.css file and add the following css class

        .completed-task {
            text-decoration: line-through;
            color: #A9A9A9;
        }

Now your task list should look like:

![Task List with Completed Task Grayed Out and Strikethough add]({{"tasks-ion-list-completed-styled.png" | prepend: imagedir }})

Your ion-item code should look like:

{%  raw %}
      <ion-item class="item-text-wrap item-icon-left"
        ng-repeat="task in vm.tasks | orderBy: ['completed','name']"
        ng-class="{'completed-task': task.completed }"
      >
        <h2>{{task.name}}</h2>

        <i class="icon"
            ng-class="task.completed ? 'ion-checkmark-circled': 'ion-ios-circle-outline'">
        </i>
      </ion-item>
{% endraw %}

>Pro-Tip: For ng-class, if your CSS class name has a dash in it then you need to encase it in quotes like we did.

## Wrap-up

With just a little bit of built-in ionic css we were able to add a little bit of pizzazz to the project and task list.  Having these built-in css class is one of the powers of using the ionic framework.  Instead of having to spend hours trying to get the css correct to work on every device type for iOS and Android, ionic did the work for you.  Thus allowing you to focus on what really matters and that is delivering a beautiful user interface to your users.

