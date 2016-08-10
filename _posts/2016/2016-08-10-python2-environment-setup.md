---
title: "Python 2 - Environment Setup"
date: 2016-08-10
modified: 2016-08-10
published: true
categories:
  - Python
tags:
  - Python
excerpt: |
     It is simply the exercise you complete to get your computer to run Python.
---

## Windows

1. Go to [http://notepad-plus-plus.org/](http://notepad-plus-plus.org/) with your browser, get the **Notepad++** text editor, and install it. You do not need to be the administrator to do this.

2. Make sure you can get to **Notepad++** easily by putting it on your desktop and/or in Quick Launch. Both options are available during setup.

3. Run **PowerShell** from the Start menu.  Search for it and you can just press Enter to run it.

4. Make a shortcut to it on your desktop and/or Quick Launch for your convenience.

5. Run your **PowerShell** program (which I will call **Terminal** later).  It won't look like much.

6. In your **PowerShell** (Terminal) program, run `python`.  You run things in Terminal by just typing the name and pressing Enter.

   1. If you run python and it's not there (python is not recognized..).  Install it from [http://python.org/download](http://python.org/download).

   2. *Make sure you install Python 2, not Python 3.*

   3. You may be better off with ActiveState Python especially when you do not have Administrative rights

   4. If after you install it python still isn't recognized then in PowerShell enter this:

      ```powershell
      [Environment]::SetEnvironmentVariable("Path", "$env:Path;C:\Python27", "User")
      ```

   5. Close **PowerShell** and then start it again to make sure Python now runs.  If it doesn't, restart may be required.

7. Type `quit()` and press Enter to exit python.


> WARNING: Sometimes you install Python on Windows and it doesn't configure the path correctly.  Make sure you enter `[Environment]::SetEnvironmentVariable("Path", "$env:Path;C:\Python27", "User")` in PowerShell to configure it correctly.  You also have to either restart PowerShell or your whole computer to get it to really be fixed.

## Reference

[Exercise 0: The Setup](http://learnpythonthehardway.org/book/ex0.html): Learn Python the Hard Way

