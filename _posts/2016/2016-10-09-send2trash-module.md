---
title: "Safe Deletes with the send2trash Module"
date: 2016-10-09
modified: 2016-10-09
published: true
categories:
  - Python
tags:
  - Python
  - Module
excerpt: |
    Using `send2trash` is much safer than Python’s regular delete functions, because it will send folders and files to your computer’s trash or recycle bin instead of permanently deleting them. 
---

Since Python’s built-in `shutil.rmtree()` function irreversibly deletes files and folders, it can be dangerous to use. A much better way to delete files and folders is with the third-party `send2trash` module. You can install this module by running `pip install send2trash` from a Terminal window.

Using `send2trash` is much safer than Python’s regular delete functions, because it will send folders and files to your computer’s trash or recycle bin instead of permanently deleting them. If a bug in your program deletes something with`send2trash` you didn’t intend to delete, you can later restore it from the recycle bin.

After you have installed `send2trash`, enter the following into the interactive shell:

```python
>>> import send2trash
>>> baconFile = open('bacon.txt', 'a') # creates the file
>>> baconFile.write('Bacon is not a vegetable.')
25
>>> baconFile.close()
>>> send2trash.send2trash('bacon.txt')
```

In general, you should always use the `send2trash.send2trash()` function to delete files and folders. But while sending files to the recycle bin lets you recover them later, it will not free up disk space like permanently deleting them does. If you want your program to free up disk space, use the `os` and `shutil` functions for deleting files and folders. Note that the `send2trash()` function can only send files to the recycle bin; it cannot pull files out of it.

## More Info

**[Automate the Boring Stuff with Python](https://automatetheboringstuff.com)**: [Chapter 9 – Organizing Files](https://automatetheboringstuff.com/chapter9/)
