---
title: "The json Module"
date: 2017-01-07
modified: 2017-01-07
published: true
categories:
  - Python
tags:
  - Python
  - Module
excerpt: |
    Python’s json module handles all the details of translating between a string with JSON data and Python values for the json.loads() and json.dumps() functions. 
---

* TOC
{:toc}

Python’s `json` module handles all the details of translating between a string with JSON data and Python values for the `json.loads()` and `json.dumps()` functions. JSON can’t store *every* kind of Python value. It can contain values of only the following data types: **strings, integers, floats, Booleans, lists, dictionaries, and `NoneType`.** JSON can not represent Python-specific objects, such as `File` objects, CSV `Reader` or `Writer` objects, `Regex` objects, or Selenium `WebElement` objects.

## Reading JSON with the loads() Function

To translate a string containing JSON data into a Python value, pass it to the `json.loads()` function. (The name means “load string,” not “loads.”) Enter the following into the interactive shell:

```python
>>> stringOfJsonData = '{"name": "Zophie", "isCat": true, "miceCaught": 0,
"felineIQ": null}'
>>> import json
>>> jsonDataAsPythonValue = json.loads(stringOfJsonData)
>>> jsonDataAsPythonValue
{'isCat': True, 'miceCaught': 0, 'name': 'Zophie', 'felineIQ': None}
```

After you import the `json` module, you can call `loads()` and pass it a string of JSON data. 

> Note that JSON strings always use double quotes. 

It will return that data as a Python dictionary. Python dictionaries are not ordered, so the key-value pairs may appear in a different order when you print `jsonDataAsPythonValue`.

## Writing JSON with the dumps() Function

The `json.dumps()` function (which means “dump string,” not “dumps”) will translate a Python value into a string of JSON-formatted data. Enter the following into the interactive shell:

```python
>>> pythonValue = {'isCat': True, 'miceCaught': 0, 'name': 'Zophie',
'felineIQ': None}
>>> import json
>>> stringOfJsonData = json.dumps(pythonValue)
>>> stringOfJsonData
'{"isCat": true, "felineIQ": null, "miceCaught": 0, "name": "Zophie" }'
```

The value can only be one of the following basic Python data types: **dictionary, list, integer, float, string, Boolean, or `None`.**

## More Info

[Chapter 14 – Working with CSV Files and JSON Data](https://automatetheboringstuff.com/chapter14/)
