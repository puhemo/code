---
title: "Saving Variables with the shelve Module"
date: 2016-10-06
modified: 2016-10-06
published: true
categories:
  - Python
tags:
  - Python
  - Module
excerpt: |
    You can save variables in your Python programs to binary shelf files using the`shelve` module. 
---

You can save variables in your Python programs to binary shelf files using the`shelve` module. This way, your program can **restore data to variables from the hard drive**. The `shelve` module will let you add Save and Open features to your program. For example, if you ran a program and entered some configuration settings, you could save those settings to a shelf file and then have the program load them the next time it is run.


Enter the following into the interactive shell:

```python
>>> import shelve
>>> shelfFile = shelve.open('mydata')
>>> cats = ['Zophie', 'Pooka', 'Simon']
>>> shelfFile['cats'] = cats
>>> shelfFile.close()
```

To read and write data using the `shelve` module, you first import `shelve`. Call `shelve.open()` and pass it a filename, and then store the returned shelf value in a variable. You can make changes to the shelf value as if it were a dictionary. When you’re done, call `close()` on the shelf value. Here, our shelf value is stored in`shelfFile`. We create a list `cats` and write `shelfFile['cats'] = cats` to store the list in`shelfFile` as a value associated with the key `'cats'` (like in a dictionary). Then we call `close()` on `shelfFile`.

After running the previous code on Windows, you will see three new files in the current working directory: *mydata.bak*, *mydata.dat*, and *mydata.dir*. On OS X, only a single *mydata.db* file will be created.

Your programs can use the `shelve` module to later reopen and retrieve the data from these shelf files. **Shelf values don’t have to be opened in read or write mode**—they can do both once opened. Enter the following into the interactive shell:

```python
>>> shelfFile = shelve.open('mydata')
>>> type(shelfFile)
<class 'shelve.DbfilenameShelf'>
>>> shelfFile['cats']
['Zophie', 'Pooka', 'Simon']
>>> shelfFile.close()
```

Just like dictionaries, shelf values have `keys()` and `values()` methods that will return list-like values of the keys and values in the shelf. Since these methods return list-like values instead of true lists, you should pass them to the `list()` function to get them in list form. Enter the following into the interactive shell:

```python
>>> shelfFile = shelve.open('mydata')
>>> list(shelfFile.keys())
['cats']
>>> list(shelfFile.values())
[['Zophie', 'Pooka', 'Simon']]
>>> shelfFile.close()
```

Plaintext is useful for creating files that you’ll read in a text editor such as Notepad or TextEdit, but if you want to save data from your Python programs, use the `shelve`module.

It isn’t ideal because average users don’t feel comfortable changing source code to update their software. Also, every time you modify the source code to a program, you run the risk of accidentally introducing new bugs. By storing the data for a program in a different place than the code, you can make your programs easier for others to use and more resistant to bugs.

## More Info

**[Automate the Boring Stuff with Python](https://automatetheboringstuff.com)**: [Chapter 8 – Reading and Writing Files](https://automatetheboringstuff.com/chapter8/)






