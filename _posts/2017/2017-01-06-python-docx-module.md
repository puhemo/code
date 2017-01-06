---
title: "The python-docx Module"
date: 2017-01-06
modified: 2017-01-06
published: true
categories:
  - Python
tags:
  - Python
  - Module
excerpt: |
    Python can create and modify Word documents, which have the .docx file extension, with the python-docx module.
---

Python can create and modify Word documents, which have the *.docx* file extension, with the `python-docx` module. You can install the module by running `pip install python-docx`. 

> *When using pip to first install Python-Docx, be sure to install python-docx, not docx. The installation name docx is for a different module t. However, when you are going to import the python-docx module, you’ll need to run import docx, not import python-docx.*

Compared to plaintext, *.docx* files have a lot of structure. This structure is represented by three different data types in Python-Docx. At the highest level, a `Document` object represents the entire document. The `Document` object contains a list of `Paragraph` objects for the paragraphs in the document. (A new paragraph begins whenever the user presses ENTER or RETURN while typing in a Word document.) Each of these `Paragraph` objects contains a list of one or more `Run` objects. The single-sentence paragraph in [Figure 13-4](https://automatetheboringstuff.com/chapter13/#calibre_link-113) has four runs.

![The Run objects identified in a Paragraph object](https://automatetheboringstuff.com/images/000017.png)

Figure 13-4. The `Run` objects identified in a `Paragraph` object

The text in a Word document is more than just a string. It has font, size, color, and other styling information associated with it. A *style* in Word is a collection of these attributes. A `Run` object is a contiguous run of text with the same style. A new `Run` object is needed whenever the text style changes.

## Reading Word Documents

Let’s experiment with the `python-docx` module. 

```python
   >>> import docx
❶ >>> doc = docx.Document('demo.docx')
❷ >>> len(doc.paragraphs)
   7
❸ >>> doc.paragraphs[0].text
   'Document Title'
❹ >>> doc.paragraphs[1].text
   'A plain paragraph with some bold and some italic'
❺ >>> len(doc.paragraphs[1].runs)
   4
❻ >>> doc.paragraphs[1].runs[0].text
   'A plain paragraph with some '
❼ >>> doc.paragraphs[1].runs[1].text
   'bold'
❽ >>> doc.paragraphs[1].runs[2].text
   ' and some '
➒ >>> doc.paragraphs[1].runs[3].text
   'italic'
```

At ❶, we open a *.docx* file in Python, call `docx.Document()`, and pass the filename *demo.docx*. This will return a `Document` object, which has a `paragraphs` attribute that is a list of `Paragraph` objects. When we call `len()` on `doc.paragraphs`, it returns `7`, which tells us that there are seven `Paragraph` objects in this document ❷. Each of these `Paragraph` objects has a `text` attribute that contains a string of the text in that paragraph (without the style information). Here, the first `text` attribute contains `'DocumentTitle'` ❸, and the second contains `'A plain paragraph with some bold and some italic'` ❹.

Each `Paragraph` object also has a `runs` attribute that is a list of `Run` objects. `Run` objects also have a `text` attribute, containing just the text in that particular run. Let’s look at the `text` attributes in the second `Paragraph` object, `'A plain paragraph with some bold and some italic'`. Calling `len()` on this `Paragraph` object tells us that there are four `Run` objects ❺. The first run object contains `'A plain paragraph with some '` ❻. Then, the text change to a bold style, so `'bold'` starts a new `Run` object ❼. The text returns to an unbolded style after that, which results in a third `Run` object, `' and some '` ❽. Finally, the fourth and last `Run` object contains `'italic'` in an italic style ➒.

With Python-Docx, your Python programs will now be able to read the text from a *.docx* file and use it just like any other string value.

## Getting the Full Text from a .docx File

If you care only about the text, not the styling information, in the Word document, you can use the `getText()` function. It accepts a filename of a *.docx* file and returns a single string value of its text. Open a new file editor window and enter the following code, saving it as *readDocx.py*:

```python
#! python3

import docx

def getText(filename):
    doc = docx.Document(filename)
    fullText = []
    for para in doc.paragraphs:
        fullText.append(para.text)
    return '\n'.join(fullText)
```

The `getText()` function opens the Word document, loops over all the `Paragraph` objects in the `paragraphs` list, and then appends their text to the list in `fullText`. After the loop, the strings in `fullText` are joined together with newline characters.

The *readDocx.py* program can be imported like any other module. Now if you just need the text from a Word document, you can enter the following:

```python
>>> import readDocx
>>> print(readDocx.getText('demo.docx'))
Document Title
A plain paragraph with some bold and some italic
Heading, level 1
Intense quote
first item in unordered list
first item in ordered list
```

You can also adjust `getText()` to modify the string before returning it. For example, to indent each paragraph, replace the `append()` call in *readDocx.py* with this:

```python
fullText.append(' ' + para.text)
```

To add a double space in between paragraphs, change the `join()` call code to this:

```python
return '\n\n'.join(fullText)
```

As you can see, it takes only a few lines of code to write functions that will read a *.docx* file and return a string of its content to your liking.

## Styling Paragraph and Run Objects

In Word for Windows, you can see the styles by pressing CTRL-ALT-SHIFT-S to display the Styles pane, which looks like [Figure 13-5](https://automatetheboringstuff.com/chapter13/#calibre_link-114). On OS X, you can view the Styles pane by clicking the **View**▸**Styles** menu item.

![Display the Styles pane by pressing CTRL-ALT-SHIFT-S on Windows.](https://automatetheboringstuff.com/images/000035.jpg)

Figure 13-5. Display the Styles pane by pressing `CTRL-ALT-SHIFT`-S on Windows.

Word and other word processors use styles to keep the visual presentation of similar types of text consistent and easy to change. For example, perhaps you want to set body paragraphs in 11-point, Times New Roman, left-justified, ragged-right text. You can create a style with these settings and assign it to all body paragraphs. Then, if you later want to change the presentation of all body paragraphs in the document, you can just change the style, and all those paragraphs will be automatically updated.

For Word documents, there are three types of styles: *Paragraph styles* can be applied to `Paragraph` objects, *character styles* can be applied to `Run` objects, and *linked styles* can be applied to both kinds of objects. You can give both `Paragraph` and `Run` objects styles by setting their `style` attribute to a string. This string should be the name of a style. If `style` is set to `None`, then there will be no style associated with the `Paragraph` or `Run` object.

The string values for the default Word styles are as follows:

| `'Normal'`    | `'Heading5'`     | `'ListBullet'`    | `'ListParagraph'` |
| ------------- | ---------------- | ----------------- | ----------------- |
| `'BodyText'`  | `'Heading6'`     | `'ListBullet2'`   | `'MacroText'`     |
| `'BodyText2'` | `'Heading7'`     | `'ListBullet3'`   | `'NoSpacing'`     |
| `'BodyText3'` | `'Heading8'`     | `'ListContinue'`  | `'Quote'`         |
| `'Caption'`   | `'Heading9'`     | `'ListContinue2'` | `'Subtitle'`      |
| `'Heading1'`  | `'IntenseQuote'` | `'ListContinue3'` | `'TOCHeading'`    |
| `'Heading2'`  | `'List'`         | `'ListNumber'`    | `'Title'`         |
| `'Heading3'`  | `'List2'`        | `'ListNumber2'`   |                   |
| `'Heading4'`  | `'List3'`        | `'ListNumber3'`   |                   |

When setting the `style` attribute, do not use spaces in the style name. For example, while the style name may be Subtle Emphasis, you should set the `style` attribute to the string value `'SubtleEmphasis'` instead of `'Subtle Emphasis'`. Including spaces will cause Word to misread the style name and not apply it.

When using a linked style for a `Run` object, you will need to add `'Char'` to the end of its name. For example, to set the Quote linked style for a `Paragraph` object, you would use `paragraphObj.style = 'Quote'`, but for a `Run` object, you would use `runObj.style = 'QuoteChar'`.

In the current version of Python-Docx (0.7.4), the only styles that can be used are the default Word styles and the styles in the opened *.docx*. New styles cannot be created—though this may change in future versions of Python-Docx.

## Creating Word Documents with Nondefault Styles

If you want to create Word documents that use styles beyond the default ones, you will need to open Word to a blank Word document and create the styles yourself by clicking the **New Style** button at the bottom of the Styles pane ([Figure 13-6](https://automatetheboringstuff.com/chapter13/#calibre_link-115) shows this on Windows).

This will open the Create New Style from Formatting dialog, where you can enter the new style. Then, go back into the interactive shell and open this blank Word document with `docx.Document()`, using it as the base for your Word document. The name you gave this style will now be available to use with Python-Docx.

![The New Style button (left) and the Create New Style from Formatting dialog (right)](https://automatetheboringstuff.com/images/000048.jpg)

Figure 13-6. The New Style button (left) and the Create New Style from Formatting dialog (right)

## Run Attributes

Runs can be further styled using `text` attributes. Each attribute can be set to one of three values: `True` (the attribute is always enabled, no matter what other styles are applied to the run), `False` (the attribute is always disabled), or `None` (defaults to whatever the run’s style is set to).

[Table 13-1](https://automatetheboringstuff.com/chapter13/#calibre_link-116) lists the `text` attributes that can be set on `Run` objects.

Table 13-1. `Run` Object `text` Attributes

| Attribute       | Description                              |
| --------------- | ---------------------------------------- |
| `bold`          | The text appears in bold.                |
| `italic`        | The text appears in italic.              |
| `underline`     | The text is underlined.                  |
| `strike`        | The text appears with strikethrough.     |
| `double_strike` | The text appears with double strikethrough. |
| `all_caps`      | The text appears in capital letters.     |
| `small_caps`    | The text appears in capital letters, with lowercase letters two points smaller. |
| `shadow`        | The text appears with a shadow.          |
| `outline`       | The text appears outlined rather than solid. |
| `rtl`           | The text is written right-to-left.       |
| `imprint`       | The text appears pressed into the page.  |
| **emboss**      | The text appears raised off the page in relief. |

For example, to change the styles of *demo.docx*, enter the following into the interactive shell:

```python
>>> doc = docx.Document('demo.docx')
>>> doc.paragraphs[0].text
'Document Title'
>>> doc.paragraphs[0].style
'Title'
>>> doc.paragraphs[0].style = 'Normal'
>>> doc.paragraphs[1].text
'A plain paragraph with some bold and some italic'
>>> (doc.paragraphs[1].runs[0].text, doc.paragraphs[1].runs[1].text, doc.
paragraphs[1].runs[2].text, doc.paragraphs[1].runs[3].text)
('A plain paragraph with some ', 'bold', ' and some ', 'italic')
>>> doc.paragraphs[1].runs[0].style = 'QuoteChar'
>>> doc.paragraphs[1].runs[1].underline = True
>>> doc.paragraphs[1].runs[3].underline = True
>>> doc.save('restyled.docx')
```

Here, we use the `text` and `style` attributes to easily see what’s in the paragraphs in our document. We can see that it’s simple to divide a paragraph into runs and access each run individiaully. So we get the first, second, and fourth runs in the second paragraph, style each run, and save the results to a new document.

The words *Document Title* at the top of *restyled.docx* will have the Normal style instead of the Title style, the `Run` object for the text *A plain paragraph with some* will have the QuoteChar style, and the two `Run` objects for the words *bold* and *italic* will have their `underline` attributes set to `True`. [Figure 13-7](https://automatetheboringstuff.com/chapter13/#calibre_link-117) shows how the styles of paragraphs and runs look in *restyled.docx*.

![The restyled.docx file](https://automatetheboringstuff.com/images/000086.jpg)

Figure 13-7. The *restyled.docx* file

You can find more complete documentation on Python-Docx’s use of styles at *https://python-docx.readthedocs.org/en/latest/user/styles.html*.

## Writing Word Documents

Enter the following into the interactive shell:

```python
>>> import docx
>>> doc = docx.Document()
>>> doc.add_paragraph('Hello world!')
<docx.text.Paragraph object at 0x0000000003B56F60>
>>> doc.save('helloworld.docx')
```

To create your own *.docx* file, call `docx.Document()` to return a new, blank Word `Document` object. The `add_paragraph()` document method adds a new paragraph of text to the document and returns a reference to the `Paragraph` object that was added. When you’re done adding text, pass a filename string to the `save()` document method to save the `Document` object to a file.

This will create a file named *helloworld.docx* in the current working directory that, when opened, looks like [Figure 13-8](https://automatetheboringstuff.com/chapter13/#calibre_link-118).

![The Word document created using add_paragraph('Hello world!')](https://automatetheboringstuff.com/images/000038.jpg)

Figure 13-8. The Word document created using `add_paragraph('Hello world!')`

You can add paragraphs by calling the `add_paragraph()` method again with the new paragraph’s text. Or to add text to the end of an existing paragraph, you can call the paragraph’s `add_run()` method and pass it a string. Enter the following into the interactive shell:

```python
>>> import docx
>>> doc = docx.Document()
>>> doc.add_paragraph('Hello world!')
<docx.text.Paragraph object at 0x000000000366AD30>
>>> paraObj1 = doc.add_paragraph('This is a second paragraph.')
>>> paraObj2 = doc.add_paragraph('This is a yet another paragraph.')
>>> paraObj1.add_run(' This text is being added to the second paragraph.')
<docx.text.Run object at 0x0000000003A2C860>
>>> doc.save('multipleParagraphs.docx')
```

The resulting document will look like [Figure 13-9](https://automatetheboringstuff.com/chapter13/#calibre_link-119). Note that the text *This text is being added to the second paragraph.* was added to the `Paragraph` object in `paraObj1`, which was the second paragraph added to `doc`. The `add_paragraph()` and `add_run()` functions return paragraph and `Run` objects, respectively, to save you the trouble of extracting them as a separate step.

Keep in mind that as of Python-Docx version 0.5.3, new `Paragraph` objects can be added only to the end of the document, and new `Run` objects can be added only to the end of a `Paragraph` object.

The `save()` method can be called again to save the additional changes you’ve made.

![The document with multiple Paragraph and Run objects added](https://automatetheboringstuff.com/images/000045.jpg)

Figure 13-9. The document with multiple `Paragraph` and `Run` objects added

Both `add_paragraph()` and `add_run()` accept an optional second argument that is a string of the `Paragraph` or `Run` object’s style. For example:

```python
>>> doc.add_paragraph('Hello world!', 'Title')
```

This line adds a paragraph with the text *Hello world!* in the Title style.

## Adding Headings

Calling `add_heading()` adds a paragraph with one of the heading styles. Enter the following into the interactive shell:

```python
>>> doc = docx.Document()
>>> doc.add_heading('Header 0', 0)
<docx.text.Paragraph object at 0x00000000036CB3C8>
>>> doc.add_heading('Header 1', 1)
<docx.text.Paragraph object at 0x00000000036CB630>
>>> doc.add_heading('Header 2', 2)
<docx.text.Paragraph object at 0x00000000036CB828>
>>> doc.add_heading('Header 3', 3)
<docx.text.Paragraph object at 0x00000000036CB2E8>
>>> doc.add_heading('Header 4', 4)
<docx.text.Paragraph object at 0x00000000036CB3C8>
>>> doc.save('headings.docx')
```

The arguments to `add_heading()` are a string of the heading text and an integer from `0` to `4`. The integer `0` makes the heading the Title style, which is used for the top of the document. Integers `1` to `4` are for various heading levels, with `1` being the main heading and `4` the lowest subheading. The `add_heading()` function returns a `Paragraph` object to save you the step of extracting it from the `Document` object as a separate step.

The resulting *headings.docx* file will look like [Figure 13-10](https://automatetheboringstuff.com/chapter13/#calibre_link-120).

![The headings.docx document with headings 0 to 4](https://automatetheboringstuff.com/images/000050.jpg)

Figure 13-10. The *headings.docx* document with headings 0 to 4

## Adding Line and Page Breaks

To add a line break (rather than starting a whole new paragraph), you can call the `add_break()` method on the `Run` object you want to have the break appear after. If you want to add a page break instead, you need to pass the value `docx.text.WD_BREAK.PAGE` as a lone argument to `add_break()`, as is done in the middle of the following example:

```python
   >>> doc = docx.Document()
   >>> doc.add_paragraph('This is on the first page!')
   <docx.text.Paragraph object at 0x0000000003785518>
❶ >>> doc.paragraphs[0].runs[0].add_break(docx.text.WD_BREAK.PAGE)
   >>> doc.add_paragraph('This is on the second page!')
   <docx.text.Paragraph object at 0x00000000037855F8>
   >>> doc.save('twoPage.docx')
```

This creates a two-page Word document with *This is on the first page!* on the first page and *This is on the second page!* on the second. Even though there was still plenty of space on the first page after the text *This is on the first page!*, we forced the next paragraph to begin on a new page by inserting a page break after the first run of the first paragraph ❶.

## Adding Pictures

`Document` objects have an `add_picture()` method that will let you add an image to the end of the document. Say you have a file *zophie.png* in the current working directory. You can add *zophie.png* to the end of your document with a width of 1 inch and height of 4 centimeters (Word can use both imperial and metric units) by entering the following:

```python
>>> doc.add_picture('zophie.png', width=docx.shared.Inches(1),
height=docx.shared.Cm(4))
<docx.shape.InlineShape object at 0x00000000036C7D30>
```

The first argument is a string of the image’s filename. The optional `width` and `height` keyword arguments will set the width and height of the image in the document. If left out, the width and height will default to the normal size of the image.

You’ll probably prefer to specify an image’s height and width in familiar units such as inches and centimeters, so you can use the `docx.shared.Inches()` and `docx.shared.Cm()` functions when you’re specifying the `width` and `height` keyword arguments.

## More Info

[Chapter 13 – Working with PDF and Word Documents](https://automatetheboringstuff.com/chapter13/)
