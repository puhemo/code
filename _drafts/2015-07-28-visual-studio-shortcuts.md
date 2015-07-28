---
published: true
layout: post
title: 'Favorite Windows Programs'
categories: ['productivity', 'programming', 'visual studio']
date: 2015-07-28 06:00
---

Here is a list of  Visual Studio Community Edition shortcuts that I use.  

##Building Solution

* Build Solution: Ctrl+Shift+B
* Run Code Analysis on Solution: Alt+F11

##Building Current Project

There is no default shortcut for building the current project or running code analysis on it.  You can go  under the Build menu and select to build just the current project but this is a manual step that requires you to navigate through the menus.  

To build the current project, I set the keyboard shortcut Ctrl + \ for Build.BuildSelection.  To set this up navigate to the Keyboard options in Visual Studio (Tools -> Options -> Keyboard or Ctrl + Q, type Keyboard, and hit Enter) and set the shortcut for Build.BuildSelection.  This will build the project that the currently open file belongs to.

To run code analysis on the current project, I set the keyboard shortcut Ctrl+Alt+\ for Build.RunCodeAnalysisonSelection.  To set this up navigate to the Keyboard options in Visual Studio (Tools -> Options -> Keyboard or Ctrl + Q, type Keyboard, and hit Enter) and set the shortcut for Build.RunCodeAnalysisonSelection.  This will run the code analysis for the project that the currently open file belongs to.

###Debugging

* Start Debugging: F5
* Start without Debugging: Ctrl+F5
* Toggle Breakpoint On/Off for line: F9
* Run to Cursor and then stop like there is a breakpoint on that line: Ctrl+F10
* Step Through the Code Line by Line: F11
* Modify the Watch Text display:  [http://tinyurl.com/vsdebugattrib](http://tinyurl.com/vsdebugattrib)

###Searching

* Quick Search: Ctrl+Q
* Find in Files: Ctrl+Shift+F
* Next Search Result Line from Find in Files Results: F8
* Previous Search Result Line from Find in Files Results: Shift+F8
 
###Navigation

* Go To Definition: F12.  If you have the [Productivity Power Tools](http://tinyurl.com/vsprodpower) extension, you can Ctrl+Click
* Close All Documents: Alt+W,L

###Visual Studio Windows Layout

In Visual Studio 2015, you can now save the Windows Layout and change them with a shortcut key.  

1. To Save:  In Visual Studio 2015, under the Windows menu, click the Save Windows Layout
1. To Apply Layout: In Visual Studio 2015, under the Windows menu, select the Apply Windows layout popout and pick the layout to apply.  There is also a shortcut key for each of the saved Windows layouts.  By default it is Ctrl+Alt+# (e.g. Ctrl+Alt+1 for the 1st saved layout)

If you have Visual Studio 2013 and below, you can use use the Visual Studio extension, [Layouts O Rama](http://tinyurl.com/vslayout)

###Resharper Searching/Navigation

If you have Resharper there are several additional options that you get for searching.

Note: Assumes Visual Studio keyboard layout for Resharper

* Go to Everything - Ctrl + T
* Go to File - Ctrl + Shift + T
* Go to Member in File - Alt + \
* Find Current File In Solution Explorer: Alt + Shift + L


###Format Document

* Format Document: Ctrl+K,D
* Resharper Format Document: Ctrl+E,F (assumes Visual Studio keyboard layout for Resharper)


###Additional Shortcuts

There are a lot more shortcuts that are set in Visual Studio.  I have only covered the ones that I use the most.  To see the full list, visit [http://visualstudioshortcuts.com](http://visualstudioshortcuts.com).