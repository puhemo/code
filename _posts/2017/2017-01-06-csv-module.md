---
title: "The csv Module"
date: 2017-01-06
modified: 2017-01-06
published: true
categories:
  - Python
tags:
  - Python
  - Module
excerpt: |
    CSV stands for “comma-separated values,” and CSV files are simplified spreadsheets stored as plaintext files. Python’s csv module makes it easy to parse CSV files.
---

Each line in a CSV file represents a row in the spreadsheet, and commas separate the cells in the row. 

4/5/2015 13:34,Apples,73
4/5/2015 3:41,Cherries,85
4/6/2015 12:46,Pears,14
4/8/2015 8:59,Oranges,52
4/10/2015 2:07,Apples,152
4/10/2015 18:10,Bananas,23
4/10/2015 2:40,Strawberries,98

CSV files are simple, lacking many of the features of an Excel spreadsheet. For example, CSV files

- Don’t have types for their values—everything is a string
- Don’t have settings for font size or color
- Don’t have multiple worksheets
- Can’t specify cell widths and heights
- Can’t have merged cells
- Can’t have images or charts embedded in them

The advantage of CSV files is simplicity. CSV files are widely supported by many types of programs, can be viewed in text editors (including IDLE’s file editor), and are a straightforward way to represent spreadsheet data. The CSV format is exactly as advertised: It’s just a text file of comma-separated values.

Since CSV files are just text files, you might be tempted to read them in as a string  For example, since each cell in a CSV file is separated by a comma, maybe you could just call the `split()` method on each line of text to get the values. But not every comma in a CSV file represents the boundary between two cells. CSV files also have their own set of escape characters to allow commas and other characters to be included *as part of the values*. The `split()` method doesn’t handle these escape characters. Because of these potential pitfalls, you should always use the `csv` module for reading and writing CSV files.

## Reader Objects

To read data from a CSV file with the `csv` module, you need to create a `Reader` object. A `Reader` object lets you iterate over lines in the CSV file. Enter the following into the interactive shell, with *example.csv* in the current working directory:

```python
❶ >>> import csv
❷ >>> exampleFile = open('example.csv')
❸ >>> exampleReader = csv.reader(exampleFile)
❹ >>> exampleData = list(exampleReader)
❹ >>> exampleData
   [['4/5/2015 13:34', 'Apples', '73'], ['4/5/2015 3:41', 'Cherries', '85'],
   ['4/6/2015 12:46', 'Pears', '14'], ['4/8/2015 8:59', 'Oranges', '52'],
   ['4/10/2015 2:07', 'Apples', '152'], ['4/10/2015 18:10', 'Bananas', '23'],
   ['4/10/2015 2:40', 'Strawberries', '98']]
```

The `csv` module comes with Python, so we can import it ❶ without having to install it first.

To read a CSV file with the `csv` module, first open it using the `open()` function ❷, just as you would any other text file. But instead of calling the `read()` or `readlines()` method on the `File` object that `open()` returns, pass it to the `csv.reader()` function ❸. This will return a `Reader` object for you to use. 

> Note that you don’t pass a filename string directly to the `csv.reader()` function.

The most direct way to access the values in the `Reader` object is to convert it to a plain Python list by passing it to `list()` ❹. Using `list()` on this `Reader` object returns a list of lists, which you can store in a variable like `exampleData`. Entering `exampleData` in the shell displays the list of lists ❺.

Now that you have the CSV file as a list of lists, you can access the value at a particular row and column with the expression `exampleData[row][col]`, where `row` is the index of one of the lists in `exampleData`, and `col` is the index of the item you want from that list. Enter the following into the interactive shell:

```python
>>> exampleData[0][0]
'4/5/2015 13:34'
>>> exampleData[0][1]
'Apples'
>>> exampleData[0][2]
'73'
>>> exampleData[1][1]
'Cherries'
>>> exampleData[6][1]
'Strawberries'
```

`exampleData[0][0]` goes into the first list and gives us the first string, `exampleData[0][2]` goes into the first list and gives us the third string, and so on.

## Reading Data from Reader Objects in a for Loop

For large CSV files, you’ll want to use the `Reader` object in a `for` loop. This avoids loading the entire file into memory at once. For example, enter the following into the interactive shell:

```python
>>> import csv
>>> exampleFile = open('example.csv')
>>> exampleReader = csv.reader(exampleFile)
>>> for row in exampleReader:
        print('Row #' + str(exampleReader.line_num) + ' ' + str(row))

Row #1 ['4/5/2015 13:34', 'Apples', '73']
Row #2 ['4/5/2015 3:41', 'Cherries', '85']
Row #3 ['4/6/2015 12:46', 'Pears', '14']
Row #4 ['4/8/2015 8:59', 'Oranges', '52']
Row #5 ['4/10/2015 2:07', 'Apples', '152']
Row #6 ['4/10/2015 18:10', 'Bananas', '23']
Row #7 ['4/10/2015 2:40', 'Strawberries', '98']
```

After you import the `csv` module and make a `Reader` object from the CSV file, you can loop through the rows in the `Reader` object. Each row is a list of values, with each value representing a cell.

The `print()` function call prints the number of the current row and the contents of the row. To get the row number, use the `Reader` object’s `line_num` variable, which contains the number of the current line.

> The `Reader` object can be looped over only once. To reread the CSV file, you must call `csv.reader` to create a `Reader` object.

## Writer Objects

A `Writer` object lets you write data to a CSV file. To create a `Writer` object, you use the `csv.writer()` function. Enter the following into the interactive shell:

```python
   >>> import csv
❶ >>> outputFile = open('output.csv', 'w', newline='')
❷ >>> outputWriter = csv.writer(outputFile)
   >>> outputWriter.writerow(['spam', 'eggs', 'bacon', 'ham'])
   21
   >>> outputWriter.writerow(['Hello, world!', 'eggs', 'bacon', 'ham'])
   32
   >>> outputWriter.writerow([1, 2, 3.141592, 4])
   16
   >>> outputFile.close()
```

First, call `open()` and pass it `'w'` to open a file in write mode ❶. This will create the object you can then pass to `csv.writer()` ❷ to create a `Writer` object.

On Windows, you’ll also need to pass a blank string for the `open()` function’s `newline` keyword argument. For technical reasons beyond the scope of this book, if you forget to set the `newline` argument, the rows in *output.csv* will be double-spaced, as shown in [Figure 14-1](https://automatetheboringstuff.com/chapter14/#calibre_link-109).

![If you forget the newline='' keyword argument in open(), the CSV file will be double-spaced.](https://automatetheboringstuff.com/images/000067.png)

Figure 14-1. If you forget the `newline=''` keyword argument in `open()`, the CSV file will be double-spaced.

The `writerow()` method for `Writer` objects takes a list argument. Each value in the list is placed in its own cell in the output CSV file. The return value of `writerow()` is the number of characters written to the file for that row (including newline characters).

This code produces an *output.csv* file that looks like this:

```
spam,eggs,bacon,ham
"Hello, world!",eggs,bacon,ham
1,2,3.141592,4
```

Notice how the `Writer` object automatically escapes the comma in the value `'Hello, world!'` with double quotes in the CSV file. The `csv` module saves you from having to handle these special cases yourself.

## The delimiter and lineterminator Keyword Arguments

Say you want to separate cells with a tab character instead of a comma and you want the rows to be double-spaced. You could enter something like the following into the interactive shell:

```python
   >>> import csv
   >>> csvFile = open('example.tsv', 'w', newline='')
❶ >>> csvWriter = csv.writer(csvFile, delimiter='\t', lineterminator='\n\n')
   >>> csvWriter.writerow(['apples', 'oranges', 'grapes'])
   24
   >>> csvWriter.writerow(['eggs', 'bacon', 'ham'])
   17
   >>> csvWriter.writerow(['spam', 'spam', 'spam', 'spam', 'spam', 'spam'])
   32
   >>> csvFile.close()
```

This changes the delimiter and line terminator characters in your file. The *delimiter* is the character that appears between cells on a row. By default, the delimiter for a CSV file is a comma. The *line terminator* is the character that comes at the end of a row. By default, the line terminator is a newline. You can change characters to different values by using the `delimiter` and `lineterminator` keyword arguments with `csv.writer()`.

Passing `delimeter='\t'` and `lineterminator='\n\n'` ❶ changes the character between cells to a tab and the character between rows to two newlines. We then call `writerow()` three times to give us three rows.

This produces a file named *example.tsv* with the following contents:

```
apples  oranges grapes

eggs    bacon   ham
spam    spam    spam    spam    spam    spam
```

> Now that our cells are separated by tabs, we’re using the file extension *.tsv*, for tab-separated values.

## More Info

[Chapter 14 – Working with CSV Files and JSON Data](https://automatetheboringstuff.com/chapter14/)
