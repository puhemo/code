---
title: "The selenium Module"
date: 2017-01-07
modified: 2017-01-07
published: true
categories:
  - Python
tags:
  - Python
  - Module
excerpt: |
    The selenium module lets Python directly control the browser by programmatically clicking links and filling in login information, almost as though there is a human user interacting with the page.
---

* TOC
{:toc}

The `selenium` module lets Python directly control the browser by programmatically clicking links and filling in login information, almost as though there is a human user interacting with the page. Selenium allows you to interact with web pages in a much more advanced way than Requests and Beautiful Soup; but because it launches a web browser, it is a bit slower and hard to run in the background if, say, you just need to download some files from the Web.

## Starting a Selenium-Controlled Browser

For these examples, you’ll need the Firefox web browser. This will be the browser that you control. If you don’t already have Firefox, you can download it for free from *http://getfirefox.com/*.

Importing the modules for Selenium is slightly tricky. Instead of `import selenium`, you need to run `from selenium import webdriver`.After that, you can launch the Firefox browser with Selenium. Enter the following into the interactive shell:

```python
>>> from selenium import webdriver
>>> browser = webdriver.Firefox()
>>> type(browser)
<class 'selenium.webdriver.firefox.webdriver.WebDriver'>
>>> browser.get('http://inventwithpython.com')
```

You’ll notice when `webdriver.Firefox()` is called, the Firefox web browser starts up. Calling `type()` on the value `webdriver.Firefox()` reveals it’s of the `WebDriver` data type. And calling `browser.get('http://inventwithpython.com')` directs the browser to *http://inventwithpython.com/*. 

## Finding Elements on the Page

`WebDriver` objects have quite a few methods for finding elements on a page. They are divided into the `find_element_*` and `find_elements_*` methods. The `find_element_*` methods return a single `WebElement` object, representing the first element on the page that matches your query. The `find_elements_*` methods return a list of `WebElement_*` objects for *every* matching element on the page.

Table 11-3. Selenium’s `WebDriver` Methods for Finding Elements

| Method name                              | WebElement object/list returned          |
| ---------------------------------------- | ---------------------------------------- |
| `browser.find_element_by_class_name(*name*)` `browser.find_elements_by_class_name(*name*)` | Elements that use the CSS class *name*   |
| `browser.find_element_by_css_selector(*selector*)` `browser.find_elements_by_css_selector(*selector*)` | Elements that match the CSS *selector*   |
| `browser.find_element_by_id(*id*)` `browser.find_elements_by_id(*id*)` | Elements with a matching *id* attribute value |
| `browser.find_element_by_link_text(*text*)` `browser.find_elements_by_link_text(*text*)` | `<a>` elements that completely match the *text* provided |
| `browser.find_element_by_partial_link_text(*text*)` `browser.find_elements_by_partial_link_text(*text*)` | `<a>` elements that contain the *text* provided |
| `browser.find_element_by_name(*name*)` `browser.find_elements_by_name(*name*)` | Elements with a matching *name* attribute value |
| `browser.find_element_by_tag_name(*name*)` `browser.find_elements_by_tag_name(*name*)` | Elements with a matching tag *name* (case insensitive; an `<a>` element is matched by `'a'` and `'A'`) |

> Except for the `*_by_tag_name()` methods, the arguments to all the methods are case sensitive.

If no elements exist on the page that match what the method is looking for, the `selenium` module raises a `NoSuchElement` exception. If you do not want this exception to crash your program, add `try` and `except` statements to your code.

Once you have the `WebElement` object, you can find out more about it by reading the attributes or calling the methods in Table 11-4.

Table 11-4. WebElement Attributes and Methods

| Attribute or method       | Description                              |
| ------------------------- | ---------------------------------------- |
| `tag_name`                | The tag name, such as `'a'` for  an `<a>` element |
| `get_attribute(`*name*`)` | The value for the element’s `name` attribute |
| `text`                    | The text within the element, such as `'hello'` in `<span>hello</span>` |
| `clear()`                 | For text field or text area elements, clears the text typed into it |
| `is_displayed()`          | Returns `True` if the element is visible; otherwise returns `False` |
| `is_enabled()`            | For input elements, returns `True` if the element is enabled; otherwise returns `False` |
| `is_selected()`           | For checkbox or radio button elements, returns `True` if the element is selected; otherwise returns `False` |
| `location`                | A dictionary with keys `'x'` and `'y'` for the position of the element in the page |

For example, open a new file editor and enter the following program:

```python
from selenium import webdriver
browser = webdriver.Firefox()
browser.get('http://inventwithpython.com')
try:
    elem = browser.find_element_by_class_name('bookcover')
    print('Found <%s> element with that class name!' % (elem.tag_name))
except:
    print('Was not able to find an element with that name.')
```

Here we open Firefox and direct it to a URL. On this page, we try to find elements with the class name `'bookcover'`, and if such an element is found, we print its tag name using the `tag_name` attribute. If no such element was found, we print a different message.

This program will output the following:

```
Found <img> element with that class name!
```

We found an element with the class name `'bookcover'` and the tag name `'img'`.

## Clicking the Page

`WebElement` objects returned from the `find_element_*` and `find_elements_*` methods have a `click()` method that simulates a mouse click on that element. This method can be used to follow a link, make a selection on a radio button, click a Submit button, or trigger whatever else might happen when the element is clicked by the mouse. For example, enter the following into the interactive shell:

```python
>>> from selenium import webdriver
>>> browser = webdriver.Firefox()
>>> browser.get('http://inventwithpython.com')
>>> linkElem = browser.find_element_by_link_text('Read It Online')
>>> type(linkElem)
<class 'selenium.webdriver.remote.webelement.WebElement'>
>>> linkElem.click() # follows the "Read It Online" link
```

This opens Firefox to *http://inventwithpython.com/*, gets the `WebElement` object for the `<a>`  element with the text *Read It Online*, and then simulates clicking that `<a>` element. It’s just like if you clicked the link yourself; the browser then follows that link.

## Filling Out and Submitting Forms

Sending keystrokes to text fields on a web page is a matter of finding the `<input>` or `<textarea>` element for that text field and then calling the `send_keys()` method. For example, enter the following into the interactive shell:

```python
>>> from selenium import webdriver
>>> browser = webdriver.Firefox()
>>> browser.get('https://mail.yahoo.com')
>>> emailElem = browser.find_element_by_id('login-username')
>>> emailElem.send_keys('not_my_real_email')
>>> passwordElem = browser.find_element_by_id('login-passwd')
>>> passwordElem.send_keys('12345')
>>> passwordElem.submit()
```

Calling the `submit()` method on any element will have the same result as clicking the Submit button for the form that element is in. (You could have just as easily called `emailElem.submit()`, and the code would have done the same thing.)

## Sending Special Keys

Selenium has a module for keyboard keys that are impossible to type into a string value, which function much like escape characters. These values are stored in attributes in the `selenium.webdriver.common.keys` module. Since that is such a long module name, it’s much easier to run `from selenium.webdriver.common.keys import Keys` at the top of your program; if you do, then you can simply write `Keys` anywhere you’d normally have to write `selenium.webdriver.common.keys`.Table 11-5 lists the commonly used `Keys` variables.

Table 11-5. Commonly Used Variables in the `selenium.webdriver.common.keys` Module

| Attributes                               | Meanings                                 |
| ---------------------------------------- | ---------------------------------------- |
| `Keys.DOWN`, `Keys.UP`, `Keys.LEFT`, `Keys.RIGHT` | The keyboard arrow keys                  |
| `Keys.ENTER`, `Keys.RETURN`              | The ENTER and RETURN keys                |
| `Keys.HOME`, `Keys.END`, `Keys.PAGE_DOWN`, `Keys.PAGE_UP` | The `home`, `end`, `pagedown`, and `pageup` keys |
| `Keys.ESCAPE`, `Keys.BACK_SPACE`, `Keys.DELETE` | The ESC, BACKSPACE, and DELETE keys      |
| `Keys.F1`, `Keys.F2`,..., `Keys.F12`     | The F1 to F12 keys at the top of the keyboard |
| `Keys.TAB`                               | The TAB key                              |

For example, if the cursor is not currently in a text field, pressing the HOME and END keys will scroll the browser to the top and bottom of the page, respectively. Enter the following into the interactive shell, and notice how the `send_keys()` calls scroll the page:

```python
>>> from selenium import webdriver
>>> from selenium.webdriver.common.keys import Keys
>>> browser = webdriver.Firefox()
>>> browser.get('http://nostarch.com')
>>> htmlElem = browser.find_element_by_tag_name('html')
>>> htmlElem.send_keys(Keys.END)     # scrolls to bottom
>>> htmlElem.send_keys(Keys.HOME)    # scrolls to top
```

The `<html>` tag is the base tag in HTML files: The full content of the HTML file is enclosed within the `<html>` and `</html>` tags. Calling `browser.find_element_by_tag_name('html')` is a good place to send keys to the general web page. This would be useful if, for example, new content is loaded once you’ve scrolled to the bottom of the page.

## Clicking Browser Buttons

Selenium can simulate clicks on various browser buttons as well through the following methods:

- **browser.back()**. Clicks the Back button.
- **browser.forward()**. Clicks the Forward button.
- **browser.refresh()**. Clicks the Refresh/Reload button.
- **browser.quit()**. Clicks the Close Window button.

## More Information on Selenium

Selenium can do much more beyond the functions described here. It can modify your browser’s cookies, take screenshots of web pages, and run custom JavaScript. To learn more about these features, you can visit the Selenium documentation at *http://selenium-python.readthedocs.org/*.

## Generalizations

* WebDriver[^1]: `webdriver.Firefox()`
  *  WebElement[^1]: `find_element_*` /  `find_elements_*`[^2]
     *  Filling Out: `WebElement.send_keys()`
        * Sending Special Keys: `selenium.webdriver.common.keys`[^3]
     *  Submitting: `WebElement.submit()`


## More Info

[Chapter 11 – Web Scraping](https://automatetheboringstuff.com/chapter11/)

[^1]: object
[^2]: list
[^3]: it’s much easier to run `from selenium.webdriver.common.keys import Keys`





