---
title: "Copying and Pasting Strings with the pyperclip Module"
date: 2016-10-06
modified: 2016-10-06
published: true
categories:
  - Python
tags:
  - Python
  - Module
excerpt: |
    The pyperclip 1module has copy() and paste() functions that can send text to and receive text from your computer’s clipboard. 
---

The `pyperclip` [^1]module has `copy()` and `paste()` functions that can send text to and receive text from your computer’s **clipboard**. Sending the output of your program to the clipboard will make it easy to paste it to an email, word processor, or some other software.

```python
>>> import pyperclip
>>> pyperclip.copy('Hello world!')
>>> pyperclip.paste()
'Hello world!'
```

Of course, if something outside of your program changes the clipboard contents, the `paste()` function will return it. For example, if I copied this sentence to the clipboard and then called `paste()`, it would look like this:

```python
>>> pyperclip.paste()
'For example, if I copied this sentence to the clipboard and then called
paste(), it would look like this:'
```

## More Info

**[Automate the Boring Stuff with Python](https://automatetheboringstuff.com)**: [Chapter 6 – Manipulating Strings](https://automatetheboringstuff.com/chapter6/)

[^1]: [A cross-platform clipboard module for Python. (only handles plain text for now)](https://pypi.python.org/pypi/pyperclip)
