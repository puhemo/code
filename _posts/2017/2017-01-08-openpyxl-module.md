---
title: "The openpyxl Module"
date: 2017-01-08
modified: 2017-01-08
published: true
categories:
  - Python
tags:
  - Python
  - Module
excerpt: |
    Excel is a popular and powerful spreadsheet application for Windows. The openpyxl module allows your Python programs to read and modify Excel spreadsheet files. 
---

* TOC
{:toc}
Excel is a popular and powerful spreadsheet application for Windows. The `openpyxl` module allows your Python programs to read and modify Excel spreadsheet files. 

Although Excel is proprietary software from Microsoft, there are free alternatives that run on Windows, OS X, and Linux. Both LibreOffice Calc and OpenOffice Calc work with Excel’s *.xlsx* file format for spreadsheets, which means the `openpyxl` module can work on spreadsheets from these applications as well. 

# Reading Excel Documents

![The tabs for a workbook’s sheets are in the lower-left corner of Excel.](https://automatetheboringstuff.com/images/000024.jpg)

Figure 12-1. The tabs for a workbook’s sheets are in the lower-left corner of Excel.

Sheet 1 in the example file should look like Table 12-1.

Table 12-1. The *example.xlsx* Spreadsheet

|       | A                    | B            | C    |
| ----- | -------------------- | ------------ | ---- |
| **1** | 4/5/2015 1:34:02 PM  | Apples       | 73   |
| **2** | 4/5/2015 3:41:23 AM  | Cherries     | 85   |
| **3** | 4/6/2015 12:46:51 PM | Pears        | 14   |
| **4** | 4/8/2015 8:59:43 AM  | Oranges      | 52   |
| **5** | 4/10/2015 2:07:00 AM | Apples       | 152  |
| **6** | 4/10/2015 6:10:37 PM | Bananas      | 23   |
| **7** | 4/10/2015 2:40:46 AM | Strawberries | 98   |

Now that we have our example spreadsheet, let’s see how we can manipulate it with the `openpyxl` module.

## Opening Excel Documents with OpenPyXL

Once you’ve imported the `openpyxl` module, you’ll be able to use the `openpyxl.load_workbook()` function. Enter the following into the interactive shell:

```python
>>> import openpyxl
>>> wb = openpyxl.load_workbook('example.xlsx')
>>> type(wb)
<class 'openpyxl.workbook.workbook.Workbook'>
```

The `openpyxl.load_workbook()` function takes in the filename and returns a value of the `workbook` data type. This `Workbook` object represents the Excel file, a bit like how a `File` object represents an opened text file.

## Getting Sheets from the Workbook

You can get a list of all the sheet names in the workbook by calling the `get_sheet_names()` method. Enter the following into the interactive shell:

```python
>>> import openpyxl
>>> wb = openpyxl.load_workbook('example.xlsx')
>>> wb.get_sheet_names()
['Sheet1', 'Sheet2', 'Sheet3']
>>> sheet = wb.get_sheet_by_name('Sheet3')
>>> sheet
<Worksheet "Sheet3">
>>> type(sheet) <class 'openpyxl.worksheet.worksheet.Worksheet'>
>>> sheet.title
'Sheet3'
>>> anotherSheet = wb.active
>>> anotherSheet
<Worksheet "Sheet1">
```

Each sheet is represented by a `Worksheet` object, which you can obtain by passing the sheet name string to the `get_sheet_by_name()` workbook method. Finally, you can read the `active` member variable of a `Workbook` object to get the workbook’s active sheet. The active sheet is the sheet that’s on top when the workbook is opened in Excel. Once you have the `Worksheet` object, you can get its name from the `title` attribute.

## Getting Cells from the Sheets

Once you have a `Worksheet` object, you can access a `Cell` object by its name. Enter the following into the interactive shell:

```python
>>> import openpyxl
>>> wb = openpyxl.load_workbook('example.xlsx')
>>> sheet = wb.get_sheet_by_name('Sheet1')
>>> sheet['A1']
<Cell Sheet1.A1>
>>> sheet['A1'].value
datetime.datetime(2015, 4, 5, 13, 34, 2)
>>> c = sheet['B1']
>>> c.value
'Apples'
>>> 'Row ' + str(c.row) + ', Column ' + c.column + ' is ' + c.value
'Row 1, Column B is Apples'
>>> 'Cell ' + c.coordinate + ' is ' + c.value
'Cell B1 is Apples'
>>> sheet['C1'].value
73
```

The `Cell` object has a `value` attribute that contains, unsurprisingly, the value stored in that cell. `Cell` objects also have `row`, `column`, and `coordinate` attributes that provide location information for the cell.

> OpenPyXL will automatically interpret the dates in column A and return them as `datetime` values rather than strings. 

Specifying a column by letter can be tricky to program, especially because after column Z, the columns start by using two letters: AA, AB, AC, and so on. As an alternative, you can also get a cell using the sheet’s `cell()` method and passing integers for its `row` and `column` keyword arguments. 

> The first row or column integer is `1`, not `0`. 

Continue the interactive shell example by entering the following:

```python
>>> sheet.cell(row=1, column=2)
<Cell Sheet1.B1>
>>> sheet.cell(row=1, column=2).value
'Apples'
>>> for i in range(1, 8, 2):
        print(i, sheet.cell(row=i, column=2).value)

1 Apples
3 Pears
5 Apples
7 Strawberries
```

As you can see, using the sheet’s `cell()` method and passing it `row=1` and `column=2` gets you a `Cell` object for cell `B1`, just like specifying `sheet['B1']` did. Then, using the `cell()` method and its keyword arguments, you can write a `for` loop to print the values of a series of cells.

You can determine the size of the sheet with the `Worksheet` object’s `max_row` and `max_column` member variables. Enter the following into the interactive shell:

```python
>>> import openpyxl
>>> wb = openpyxl.load_workbook('example.xlsx')
>>> sheet = wb.get_sheet_by_name('Sheet1')
>>> sheet.max_row
7
>>> sheet.max_column
3
```

> Note that the `max_column` method returns an integer rather than the letter that appears in Excel.

## Converting Between Column Letters and Numbers

To convert from letters to numbers, call the `openpyxl.cell.column_index_from_string()` function. To convert from numbers to letters, call the `openpyxl.cell.get_column_letter()` function. Enter the following into the interactive shell:

```python
>>> import openpyxl
>>> from openpyxl.cell import get_column_letter, column_index_from_string
>>> get_column_letter(1)
'A'
>>> get_column_letter(2)
'B'
>>> get_column_letter(27)
'AA'
>>> get_column_letter(900)
'AHP'
>>> wb = openpyxl.load_workbook('example.xlsx')
>>> sheet = wb.get_sheet_by_name('Sheet1')
>>> get_column_letter(sheet.max_column)
'C'
>>> column_index_from_string('A')
1
>>> column_index_from_string('AA')
27
```

## Getting Rows and Columns from the Sheets

You can slice `Worksheet` objects to get all the `Cell` objects in a row, column, or rectangular area of the spreadsheet. Then you can loop over all the cells in the slice. Enter the following into the interactive shell:

```python
   >>> import openpyxl
   >>> wb = openpyxl.load_workbook('example.xlsx')
   >>> sheet = wb.get_sheet_by_name('Sheet1')
   >>> tuple(sheet['A1':'C3'])
   ((<Cell Sheet1.A1>, <Cell Sheet1.B1>, <Cell Sheet1.C1>), (<Cell Sheet1.A2>,
   <Cell Sheet1.B2>, <Cell Sheet1.C2>), (<Cell Sheet1.A3>, <Cell Sheet1.B3>,
   <Cell Sheet1.C3>))
❶ >>> for rowOfCellObjects in sheet['A1':'C3']:
❷         for cellObj in rowOfCellObjects:
               print(cellObj.coordinate, cellObj.value)
           print('--- END OF ROW ---')
   A1 2015-04-05 13:34:02
   B1 Apples
   C1 73
   --- END OF ROW ---
   A2 2015-04-05 03:41:23
   B2 Cherries
   C2 85
   --- END OF ROW ---
   A3 2015-04-06 12:46:51
   B3 Pears
   C3 14
   --- END OF ROW ---
```

Here, we specify that we want the `Cell` objects in the rectangular area from A1 to C3, and we get **a `Generator` object containing the `Cell` objects in that area**. To help us visualize this `Generator` object, we can use `tuple()` on it to display its `Cell` objects in a tuple.

To print the values of each cell in the area, we use two `for` loops. The outer `for` loop goes over each row in the slice ❶. Then, for each row, the nested `for` loop goes through each cell in that row ❷.

To access the values of cells in a particular row or column, you can also use a `Worksheet` object’s `rows` and `columns` attribute. Enter the following into the interactive shell:

```python
>>> import openpyxl
>>> wb = openpyxl.load_workbook('example.xlsx')
>>> sheet = wb.active
>>> sheet.columns[1]
(<Cell Sheet1.B1>, <Cell Sheet1.B2>, <Cell Sheet1.B3>, <Cell Sheet1.B4>,
<Cell Sheet1.B5>, <Cell Sheet1.B6>, <Cell Sheet1.B7>)
>>> for cellObj in sheet.columns[1]:
        print(cellObj.value)

Apples
Cherries
Pears
Oranges
Apples
Bananas
Strawberries
```

Using the `rows` attribute on a `Worksheet` object will give you a tuple of tuples. Each of these inner tuples represents a row, and contains the `Cell` objects in that row. The `columns` attribute also gives you a tuple of tuples, with each of the inner tuples containing the `Cell` objects in a particular column.

## Workbooks, Sheets, Cells

As a quick review, here’s a rundown of all the functions, methods, and data types involved in reading a cell out of a spreadsheet file:

1. Import the `openpyxl` module.
2. Call the `openpyxl.load_workbook()` function.
3. Get a `Workbook` object.
4. Read the `active` member variable or call the `get_sheet_by_name()` workbook method.
5. Get a `Worksheet` object.
6. Use indexing or the `cell()` sheet method with `row` and `column` keyword arguments.
7. Get a `Cell` object.
8. Read the `Cell` object’s `value` attribute.

# Writing Excel Documents

OpenPyXL also provides ways of writing data, meaning that your programs can create and edit spreadsheet files. With Python, it’s simple to create spreadsheets with thousands of rows of data.

## Creating and Saving Excel Documents

Call the `openpyxl.Workbook()` function to create a new, blank `Workbook` object. Enter the following into the interactive shell:

```python
>>> import openpyxl
>>> wb = openpyxl.Workbook()
>>> wb.get_sheet_names()
['Sheet']
>>> sheet = wb.active
>>> sheet.title
'Sheet'
>>> sheet.title = 'Spam Bacon Eggs Sheet'
>>> wb.get_sheet_names()
['Spam Bacon Eggs Sheet']
```

The workbook will start off with a single sheet named *Sheet*. You can change the name of the sheet by storing a new string in its `title` attribute.

Any time you modify the `Workbook` object or its sheets and cells, the spreadsheet file will not be saved until you call the `save()` workbook method. Enter the following into the interactive shell (with *example.xlsx* in the current working directory):

```python
>>> import openpyxl
>>> wb = openpyxl.load_workbook('example.xlsx')
>>> sheet = wb.active
>>> sheet.title = 'Spam Spam Spam'
>>> wb.save('example_copy.xlsx')
```

Whenever you edit a spreadsheet you’ve loaded from a file, you should always save the new, edited spreadsheet to a different filename than the original. That way, you’ll still have the original spreadsheet file to work with in case a bug in your code caused the new, saved file to have incorrect or corrupt data.

## Creating and Removing Sheets

Sheets can be added to and removed from a workbook with the `create_sheet()` and `remove_sheet()` methods. Enter the following into the interactive shell:

```python
>>> import openpyxl
>>> wb = openpyxl.Workbook()
>>> wb.get_sheet_names()
['Sheet']
>>> wb.create_sheet()
<Worksheet "Sheet1">
>>> wb.get_sheet_names()
['Sheet', 'Sheet1']
>>> wb.create_sheet(index=0, title='First Sheet')
<Worksheet "First Sheet">
>>> wb.get_sheet_names()
['First Sheet', 'Sheet', 'Sheet1']
>>> wb.create_sheet(index=2, title='Middle Sheet')
<Worksheet "Middle Sheet">
>>> wb.get_sheet_names()
['First Sheet', 'Sheet', 'Middle Sheet', 'Sheet1']
```

The `create_sheet()` method returns a new `Worksheet` object named `Sheet`*X*, which by default is set to be the last sheet in the workbook. Optionally, the index and name of the new sheet can be specified with the `index` and `title` keyword arguments.

Continue the previous example by entering the following:

```python
>>> wb.get_sheet_names()
['First Sheet', 'Sheet', 'Middle Sheet', 'Sheet1']
>>> wb.remove_sheet(wb.get_sheet_by_name('Middle Sheet'))
>>> wb.remove_sheet(wb.get_sheet_by_name('Sheet1'))
>>> wb.get_sheet_names()
['First Sheet', 'Sheet']
```

The `remove_sheet()` method takes a `Worksheet` object, not a string of the sheet name, as its argument. If you know only the name of a sheet you want to remove, call `get_sheet_by_name()` and pass its return value into `remove_sheet()`.

Remember to call the `save()` method to save the changes after adding sheets to or removing sheets from the workbook.

## Writing Values to Cells

Writing values to cells is much like writing values to keys in a dictionary. Enter this into the interactive shell:

```python
>>> import openpyxl
>>> wb = openpyxl.Workbook()
>>> sheet = wb.get_sheet_by_name('Sheet')
>>> sheet['A1'] = 'Hello world!'
>>> sheet['A1'].value
'Hello world!'
```

If you have the cell’s coordinate as a string, you can use it just like a dictionary key on the `Worksheet` object to specify which cell to write to.

# Setting the Font Style of Cells

Styling certain cells, rows, or columns can help you emphasize important areas in your spreadsheet. 

To customize font styles in cells, important, import the `Font()` function from the `openpyxl.styles` module.

```python
from openpyxl.styles import Font
```

This allows you to type `Font()` instead of `openpyxl.styles.Font()`.

Here’s an example that creates a new workbook and sets cell A1 to have a 24-point, italicized font. Enter the following into the interactive shell:

```python
   >>> import openpyxl
   >>> from openpyxl.styles import Font
   >>> wb = openpyxl.Workbook()
   >>> sheet = wb.get_sheet_by_name('Sheet')
❶ >>> italic24Font = Font(size=24, italic=True)
❷ >>> sheet['A1'].font = italic24Font
   >>> sheet['A1'] = 'Hello world!'
   >>> wb.save('styled.xlsx')
```

A cell’s style can be set by assigning the `Font` object to the `style` attribute.

In this example, `Font(size=24, italic=True)` returns a `Font` object, which is stored in `italic24Font` ❶. The keyword arguments to `Font()`, `size` and `italic`, configure the `Font` object. And when `fontObj` is assigned to the cell’s `font` attribute ❷, all that font styling information gets applied to cell A1.

# Font Objects

To set font style attributes, you pass keyword arguments to `Font()`. Table 12-2 shows the possible keyword arguments for the `Font()` function.

Table 12-2. Keyword Arguments for Font `style` Attributes

| Keyword argument | Data type | Description                              |
| ---------------- | --------- | ---------------------------------------- |
| `name`           | String    | The font name, such as `'Calibri'` or `'Times New Roman'` |
| `size`           | Integer   | The point size                           |
| `bold`           | Boolean   | `True`, for bold font                    |
| `italic`         | Boolean   | `True`, for italic font                  |

You can call `Font()` to create a `Font` object and store that `Font` object in a variable. You then pass that to `Style()`, store the resulting `Style` object in a variable, and assign that variable to a `Cell` object’s `style` attribute. For example, this code creates various font styles:

```python
>>> import openpyxl
>>> from openpyxl.styles import Font
>>> wb = openpyxl.Workbook()
>>> sheet = wb.get_sheet_by_name('Sheet')

>>> fontObj1 = Font(name='Times New Roman', bold=True)
>>> sheet['A1'].font = fontObj1
>>> sheet['A1'] = 'Bold Times New Roman'

>>> fontObj2 = Font(size=24, italic=True)
>>> sheet['B3'].font = fontObj2
>>> sheet['B3'] = '24 pt Italic'

>>> wb.save('styles.xlsx')
```

# Formulas

Formulas, which begin with an equal sign, can configure cells to contain values calculated from other cells. In this section, you’ll use the `openpyxl` module to programmatically add formulas to cells, just like any normal value. For example:

```python
>>> sheet['B9'] = '=SUM(B1:B8)'
```

This will store *=SUM(B1:B8)* as the value in cell B9. This sets the B9 cell to a formula that calculates the sum of values in cells B1 to B8. You can see this in action in Figure 12-5.

![Cell B9 contains the formula =SUM(B1:B8), which adds the cells B1 to B8.](https://automatetheboringstuff.com/images/000012.jpg)

Figure 12-5. Cell B9 contains the formula *=SUM(B1:B8)*, which adds the cells B1 to B8.

A formula is set just like any other text value in a cell. Enter the following into the interactive shell:

```python
>>> import openpyxl
>>> wb = openpyxl.Workbook()
>>> sheet = wb.active
>>> sheet['A1'] = 200
>>> sheet['A2'] = 300
>>> sheet['A3'] = '=SUM(A1:A2)'
>>> wb.save('writeFormula.xlsx')
```

Excel formulas offer a level of programmability for spreadsheets but can quickly become unmanageable for complicated tasks.  Python code is much more readable.

# Adjusting Rows and Columns

In Excel, adjusting the sizes of rows and columns is as easy as clicking and dragging the edges of a row or column header. But if you need to set a row or column’s size based on its cells’ contents or if you want to set sizes in a large number of spreadsheet files, it will be much quicker to write a Python program to do it.

Rows and columns can also be hidden entirely from view. Or they can be “frozen” in place so that they are always visible on the screen and appear on every page when the spreadsheet is printed (which is handy for headers).

## Setting Row Height and Column Width

`Worksheet` objects have `row_dimensions` and `column_dimensions` attributes that control row heights and column widths. Enter this into the interactive shell:

```python
>>> import openpyxl
>>> wb = openpyxl.Workbook()
>>> sheet = wb.active
>>> sheet['A1'] = 'Tall row'
>>> sheet['B2'] = 'Wide column'
>>> sheet.row_dimensions[1].height = 70
>>> sheet.column_dimensions['B'].width = 20
>>> wb.save('dimensions.xlsx')
```

A sheet’s `row_dimensions` and `column_dimensions` are dictionary-like values; `row_dimensions` contains `RowDimension` objects and `column_dimensions` contains `ColumnDimension` objects. In `row_dimensions`, you can access one of the objects using the number of the row (in this case, 1 or 2). In `column_dimensions`, you can access one of the objects using the letter of the column (in this case, A or B).

The *dimensions.xlsx* spreadsheet looks like Figure 12-6.

![Row 1 and column B set to larger heights and widths](https://automatetheboringstuff.com/images/000098.jpg)

Figure 12-6. Row 1 and column B set to larger heights and widths

The row height can be set to an integer or float value between `0` and `409`. This value represents the height measured in *points*, where one point equals 1/72 of an inch. The default row height is 12.75. The column width can be set to an integer or float value between `0` and `255`. This value represents the number of characters at the default font size (11 point) that can be displayed in the cell. The default column width is 8.43 characters. 

> Columns with widths of `0` or rows with heights of `0` are hidden from the user.

## Merging and Unmerging Cells

A rectangular area of cells can be merged into a single cell with the `merge_cells()` sheet method. Enter the following into the interactive shell:

```python
>>> import openpyxl
>>> wb = openpyxl.Workbook()
>>> sheet = wb.active
>>> sheet.merge_cells('A1:D3')
>>> sheet['A1'] = 'Twelve cells merged together.'
>>> sheet.merge_cells('C5:D5')
>>> sheet['C5'] = 'Two merged cells.'
>>> wb.save('merged.xlsx')
```

The argument to `merge_cells()` is a single string of the top-left and bottom-right cells of the rectangular area to be merged: `'A1:D3'` merges 12 cells into a single cell. To set the value of these merged cells, simply set the value of the top-left cell of the merged group.

When you run this code, *merged.xlsx* will look like Figure 12-7.

![Merged cells in a spreadsheet](https://automatetheboringstuff.com/images/000040.png)

Figure 12-7. Merged cells in a spreadsheet

To unmerge cells, call the `unmerge_cells()` sheet method. Enter this into the interactive shell.

```python
>>> import openpyxl
>>> wb = openpyxl.load_workbook('merged.xlsx')
>>> sheet = wb.active
>>> sheet.unmerge_cells('A1:D3')
>>> sheet.unmerge_cells('C5:D5')
>>> wb.save('merged.xlsx')
```

If you save your changes and then take a look at the spreadsheet, you’ll see that the merged cells have gone back to being individual cells.

## Freeze Panes

For spreadsheets too large to be displayed all at once, it’s helpful to “freeze” a few of the top rows or leftmost columns onscreen. Frozen column or row headers, for example, are always visible to the user even as they scroll through the spreadsheet. These are known as *freeze panes*. In OpenPyXL, each `Worksheet` object has a `freeze_panes` attribute that can be set to a `Cell` object or a string of a cell’s coordinates. 

> Note that all rows above and all columns to the left of this cell will be frozen, but the row and column of the cell itself will not be frozen.

To unfreeze all panes, set `freeze_panes` to `None` or `'A1'`. Table 12-3 shows which rows and columns will be frozen for some example settings of `freeze_panes`.

Table 12-3. Frozen Pane Examples

| `freeze_panes` setting                   | Rows and columns frozen   |
| ---------------------------------------- | ------------------------- |
| `sheet.freeze_panes = 'A2'`              | Row 1                     |
| `sheet.freeze_panes = 'B1'`              | Column A                  |
| `sheet.freeze_panes = 'C1'`              | Columns A and B           |
| `sheet.freeze_panes = 'C2'`              | Row 1 and columns A and B |
| `sheet.freeze_panes = 'A1'` or `sheet.freeze_panes = None` | No frozen panes           |



```python
>>> import openpyxl
>>> wb = openpyxl.load_workbook('produceSales.xlsx')
>>> sheet = wb.active
>>> sheet.freeze_panes = 'A2'
>>> wb.save('freezeExample.xlsx')
```

If you set the `freeze_panes` attribute to `'A2'`, row 1 will always be viewable, no matter where the user scrolls in the spreadsheet. You can see this in Figure 12-8.

![With freeze_panes set to 'A2', row 1 is always visible even as the user scrolls down.](https://automatetheboringstuff.com/images/000044.jpg)

Figure 12-8. With `freeze_panes` set to `'A2'`, row 1 is always visible even as the user scrolls down.

# Charts

OpenPyXL supports creating bar, line, scatter, and pie charts using the data in a sheet’s cells. To make a chart, you need to do the following:

1. Create a `Reference` object from a rectangular selection of cells.
2. Create a `Series` object by passing in the `Reference` object.
3. Create a `Chart` object.
4. Append the `Series` object to the `Chart` object.
5. Add the `Chart` object to the `Worksheet` object, optionally specifying which cell the top left corner of the chart should be positioned..

The `Reference` object requires some explaining. `Reference` objects are created by calling the `openpyxl.chart.Reference()` function and passing three arguments:

1. The `Worksheet` object containing your chart data.
2. A tuple of two integers, representing the top-left cell of the rectangular selection of cells containing your chart data: The first integer in the tuple is the row, and the second is the column. Note that `1` is the first row, not `0`.
3. A tuple of two integers, representing the bottom-right cell of the rectangular selection of cells containing your chart data: The first integer in the tuple is the row, and the second is the column.

Figure 12-9 shows some sample coordinate arguments.

![From left to right: (1, 1), (10, 1); (3, 2), (6, 4); (5, 3), (5, 3)](https://automatetheboringstuff.com/images/000047.jpg)

Figure 12-9. From left to right: `(1, 1), (10, 1)`; `(3, 2), (6, 4)`; `(5, 3), (5, 3)`

Enter this interactive shell example to create a bar chart and add it to the spreadsheet:

```python
>>> import openpyxl
>>> wb = openpyxl.Workbook()
>>> sheet = wb.active
>>> for i in range(1, 11):         # create some data in column A
        sheet['A' + str(i)] = i

>>> refObj = openpyxl.chart.Reference(sheet, min_col=1, min_row=1, max_col=1, max_row=10)

>>> seriesObj = openpyxl.chart.Series(refObj, title='First series')

>>> chartObj = openpyxl.chart.BarChart()
>>> chartObj.title = 'My Chart'
>>> chartObj.append(seriesObj)
>>> sheet.add_chart(chartObj, 'C5')
>>> wb.save('sampleChart.xlsx')
```

This produces a spreadsheet that looks like Figure 12-10.

![A spreadsheet with a chart added](https://automatetheboringstuff.com/images/000028.jpg)

Figure 12-10. A spreadsheet with a chart added

We’ve created a bar chart by calling `openpyxl.chart.BarChart()`. You can also create line charts, scatter charts, and pie charts by calling `openpyxl.chart.LineChart()`, `openpyxl.chart.ScatterChart()`, and `openpyxl.chart.PieChart()`.

Unfortunately, in the current version of OpenPyXL (2.3.3), the `load_workbook()` function does not load charts in Excel files. Even if the Excel file has charts, the loaded `Workbook` object will not include them. If you load a `Workbook` object and immediately save it to the same *.xlsx* filename, you will effectively remove the charts from it.

## Generalizations

* Workbook[^1]: `openpyxl.load_workbook()`
  * Attributes:
    * Activesheet: `Workbook.active`
    * SheetName: `Workbook.get_sheet_names()`
    * createSheet: 
      * `Workbook.create_sheet()`[^4]
      * `Workbook.create_sheet(index= , title='')`[^5]
    * removeSheet: `Workbook.remove_sheet(Worksheet)`[^6]
    * save: `Workbook.save()`
  * Worksheet[^1]: `Workbook.get_shett_by_name()`
    * Cell[^1]: `Worksheet[coordinate]`/`Worksheet.cell(row= , colum= )`
      * Attributes:
        * value: `Cell.value`
        * colum: `Cell.colum`
        * row: `Cell.row`
        * coordinate: `Cell.coordinate`
      * Font[^1]: Font(name='', bold=True, size= , italic=True)
        * Import: `from openpyxl.styles import Font`
        * Assign: `Cell.font = Font`
      * Formula: 'Cell = Formula'[^7]
    * Cells[^2]: `Worksheet['A1':'C3']`
      * display: `tuple(Cells)`
    * RowDimension[^1]: `Worksheet.row_dimensions`
      * rowHeight: `RowDimension[rowNumber].height = `
    * ColumnDimension[^1]: `Worksheet.column_dimensions`
      * columnWidth: `ColumnDimension[columnLetter].width = `
    * Chart[^1]: `openpyxl.chart.BarChart()`/`openpyxl.chart.LineChart()`/`openpyxl.chart.ScatterChart()`/`openpyxl.chart.PieChart()`  
      * Reference[^1]: `openpyxl.chart.Reference(Worksheet, min_col=1, min_row=1, max_col=1, max_row=10)`
      * Series[^1]: `openpyxl.chart.Series(Reference, title='First series')`
      * Attributes:
        * Title: `Chart,title = ''`
        * Append: `Chart.append(Series)`
    * Attributes:
      * max_row: `Worksheet.max_row`
      * max_column: `Worksheet.max_column`
      * rows: `Worksheet.rows`[^3]
      * colums: `Worksheet.colums`[^3]
      * SheetTitle: `Worksheet.title`
      * mergeCells: `Worksheet.merge_cells(argument)`
      * unmergeCells: `Worksheet.unmerge_cells(argument)`
      * freezePanes:  `Worksheet.freeze_panes = cellName `[^9]
      * addChart: `Worksheet.add_chart(Chart, cellName)`

## More Info

[Chapter 12 – Working with Excel Spreadsheets](https://automatetheboringstuff.com/chapter12/)


[^1]: object
[^2]: A `Generator` object containing the `Cell` objects in that area
[^3]: A tuple of tuples
[^4]: Return a new `Worksheet` object named `SheetX`, which is set to be the last sheet in the workbook.
[^5]: Specify the index and name of the new sheet.
[^6]: Take a `Worksheet` object, not a string of the sheet name.
[^7]: For example: `sheet['B9'] = '=SUM(B1:B8)'`
[^8]: A single string of the top-left and bottom-right cells of the rectangular area.
[^9]: All rows above and all columns to the left of this cell will be frozen, but the row and column of the cell itself will not be frozen.

