---
published: true
layout: post
title: 'Running Gulp Task in Visual Studio'
categories: ['visual studio', 'gulp']
date: 2015-11-17
excerpt: | 


---
{% assign imagedir = "/images/GulpInVisualStudio/" | prepend: site.baseurl | prepend: site.url %}

When I am working in an code editor such as Visual Studio, I do not want to have to have to leave the editor to run command line programs such as Gulp task.  I want to be able to run the gulp task right from instead the editor.  Starting with Visual Studio 2013, you could do this with the [Task Runner Explorer extension](https://visualstudiogallery.msdn.microsoft.com/8e1b4368-4afb-467a-bc13-9650572db708).  Microsoft then integrated the Task Runner Explorer into Visual Studio 2015 so you no longer have to install an extension.   

In addition to being able to run task with the Task Runner Explorer, Visual Studio 2015, includes intellisense for gulp which makes it easier to create new Gulp task.  

##Code for this tutorial

The sample code for this tutorial is available at [https://github.com/digitaldrummerj/pluralsight-audition](https://github.com/digitaldrummerj/pluralsight-audition).


##Pulling up the Task Runner Explorer 

You can get to the task runner explorer, by going under the View Menu, selecting Other Windows, and then selecting the Task Runner Explorer.  
![Open Task Runner Explorer]({{"TaskRunnerExplorer_FindInMenu.png" | prepend: imagedir}}) 


When the Task Runner Explorer opens it will pull up all of the task from gulpfile.js that is in the root directory of the project.

![Task Runner Explorer Initial View]({{"TaskRunnerExplorer.png" | prepend: imagedir}})

In this case it shows the 5 task that are available in the gulpfile.js

* default
* clean
* inject
* release
* watch

##Running a Task

After the task is opened up, to run a task, right-click on it and select the run option.  
 
![Running a Task]({{"TaskRunnerExplorer_TaskRun_RightClickMenu.png" | prepend: imagedir}})

When a task it run, it will open up a tab in the Task Runner explorer and show the results of the gulp task

For the demo, we have right-clicked on the default task and selected the run option. 

![Results of Task Run]({{"TaskRunnerExplorer_TaskRun.png" | prepend: imagedir}})

##Integrating Running of Task into Visual Studio Build Process

Manually running a task is nice but it is even better if you can integrate it into the Visual Studio build process.  Luckily the Task Runner Explorer, give you just that option.  If you right-click on a task and select Bindings, you can see the options.  

![Task Build Options]({{"TaskRunnerExplorer_BuildBindings.png" | prepend: imagedir}})

There are 4 bindings options:

* Before Build - task will run before the Visual Studio build.
* After Build - task will run after the Visual Studio Build.
* Clean - task will run when the project is cleaned.
* Project Open - task will run when the project is opened.

For this example, we are going to set the "Before Build" binding for the default task.  

When you set the binding, 2 things will happen in the Task Runner Explorer.  1st - the default task will show up in the Binding tab under the Before Build secton.  2nd - if you right-click on the default task and select binding there will be a checkmark next to the "Before Build"

![Before Build Binding]({{"TaskRunnerExplorer_BindingSetForBeforeBuild.png"  | prepend: imagedir}})


Also, if you open up the gulpfile.js, you will notice that the first line now has a comment with the bindings in it.

![Gulpfile with BeforeBuild set]({{"TaskRunnerExplorer_GulpfileWithBeforeBuildSet.png" | prepend: imagedir}})

##Notes:

## Why
* No dropping to the command line
* Integrate with the Visual Studio Build process
* Intellisense for creating new task

##How

* Pull up Task Runner Explorer
* If task don't show, look at the output windows to see error
* Right-click to run task
* New tab opens when task is run with the results

##Integrating into Build Process
*    Right-click on task to see options to integration into build process
*    Options:
    *        Before Buid
    *    After Build
    *    Project Open
    *    Clean Project
        
##Creating New Task
* After save, shows up in the task runner explorer to run
* Create new task to show it

##Getting the Code
* Give github url location
        