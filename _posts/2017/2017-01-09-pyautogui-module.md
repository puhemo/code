---
title: "The pyautogui Module"
date: 2017-01-09
modified: 2017-01-09
published: true
categories:
  - Python
tags:
  - Python
  - Module
excerpt: |
    The pyautogui module has functions for simulating mouse movements, button clicks, and scrolling the mouse wheel. 
---

* TOC
{:toc}

# Controlling the Keyboard and Mouse with GUI Automation

Think of GUI automation as programming a robotic arm. You can program the robotic arm to type at your keyboard and move your mouse for you. This technique is particularly useful for tasks that involve a lot of mindless clicking or filling out of forms.

The `pyautogui` module has functions for simulating mouse movements, button clicks, and scrolling the mouse wheel. This chapter covers only a subset of PyAutoGUI’s features; you can find the full documentation at *http://pyautogui.readthedocs.org/*.

# Installing the pyautogui Module

The `pyautogui` module can send virtual keypresses and mouse clicks to Windows, OS X, and Linux. Depending on which operating system you’re using, you may have to install some other modules (called *dependencies*) before you can install PyAutoGUI.

- On Windows, there are no other modules to install.
- On OS X, run **sudo pip3 install pyobjc-framework-Quartz**, **sudo pip3 install pyobjc-core**, and then **sudo pip3 install pyobjc**.
- On Linux, run **sudo pip3 install python3-xlib**, **sudo apt-get install scrot**, **sudo apt-get install python3-tk**, and **sudo apt-get install python3-dev**. (Scrot is a screenshot program that PyAutoGUI uses.)

After these dependencies are installed, run **pip install pyautogui** (or **pip3** on OS X and Linux) to install PyAutoGUI.

# Staying on Track

## Shutting Down Everything by Logging Out

Perhaps the simplest way to stop an out-of-control GUI automation program is to log out, which will shut down all running programs. On Windows and Linux, the logout hotkey is CTRL-ALT-DEL. On OS X, it is ![img](https://automatetheboringstuff.com/images/000085.jpg)-SHIFT-OPTION-Q. By logging out, you’ll lose any unsaved work, but at least you won’t have to wait for a full reboot of the computer.

## Pauses and Fail-Safes

You can tell your script to wait after every function call, giving you a short window to take control of the mouse and keyboard if something goes wrong. To do this, set the `pyautogui.PAUSE` variable to the number of seconds you want it to pause. 

PyAutoGUI also has a fail-safe feature. Moving the mouse cursor to the upper-left corner of the screen will cause PyAutoGUI to raise the `pyautogui.FailSafeException` exception. Your program can either handle this exception with `try` and `except` statements or let the exception crash your program. Either way, the fail-safe feature will stop the program if you quickly move the mouse as far up and left as you can. You can disable this feature by setting `pyautogui.FAILSAFE = False`. Enter the following into the interactive shell:

```python
>>> import pyautogui
>>> pyautogui.PAUSE = 1
>>> pyautogui.FAILSAFE = True
```

Here we import `pyautogui` and set `pyautogui.PAUSE` to `1` for a one-second pause after each function call. We set `pyautogui.FAILSAFE` to `True` to enable the fail-safe feature.

# Controlling Mouse Movement

The mouse functions of PyAutoGUI use x- and y-coordinates. Figure 18-1 shows the coordinate system for the computer screen; it’s similar to the coordinate system used for images. 

![The coordinates of a computer screen with 1920×1080 resolution](https://automatetheboringstuff.com/images/000011.jpg)

Figure 18-1. The coordinates of a computer screen with 1920×1080 resolution

The `pyautogui.size()` function returns a two-integer tuple of the screen’s width and height in pixels. Enter the following into the interactive shell:

```python
>>> import pyautogui
>>> pyautogui.size()
(1920, 1080)
>>> width, height = pyautogui.size()
```

## Moving the Mouse

The `pyautogui.moveTo()` function will instantly move the mouse cursor to a specified position on the screen. Integer values for the x- and y-coordinates make up the function’s first and second arguments, respectively. An optional `duration` integer or float keyword argument specifies the number of seconds it should take to move the mouse to the destination. If you leave it out, the default is `0` for instantaneous movement.

> All of the `duration` keyword arguments in PyAutoGUI functions are optional.

Enter the following into the interactive shell:

```python
>>> import pyautogui
>>> for i in range(10):
      pyautogui.moveTo(100, 100, duration=0.25)
      pyautogui.moveTo(200, 100, duration=0.25)
      pyautogui.moveTo(200, 200, duration=0.25)
      pyautogui.moveTo(100, 200, duration=0.25)
```

The `pyautogui.moveRel()` function moves the mouse cursor **relative** to its current position. The following example moves the mouse in the same square pattern, except it begins the square from wherever the mouse happens to be on the screen when the code starts running:

```python
>>> import pyautogui
>>> for i in range(10):
      pyautogui.moveRel(100, 0, duration=0.25)
      pyautogui.moveRel(0, 100, duration=0.25)
      pyautogui.moveRel(-100, 0, duration=0.25)
      pyautogui.moveRel(0, -100, duration=0.25)
```

`pyautogui.moveRel()` also takes three arguments: how many pixels to move horizontally to the right, how many pixels to move vertically downward, and (optionally) how long it should take to complete the movement. A negative integer for the first or second argument will cause the mouse to move left or upward, respectively.

## Getting the Mouse Position

You can determine the mouse’s current position by calling the `pyautogui.position()` function, which will return a tuple of the mouse cursor’s *x* and *y* positions at the time of the function call. Enter the following into the interactive shell, moving the mouse around after each call:

```python
>>> pyautogui.position()
(311, 622)
>>> pyautogui.position()
(377, 481)
>>> pyautogui.position()
(1536, 637)
```

Of course, your return values will vary depending on where your mouse cursor is.

# Controlling Mouse Interaction

Now that you know how to move the mouse and figure out where it is on the screen, you’re ready to start clicking, dragging, and scrolling.

## Clicking the Mouse

To send a virtual mouse click to your computer, call the `pyautogui.click()` method. By default, this click uses the left mouse button and takes place wherever the mouse cursor is currently located. 

If you want to specify which mouse button to use, include the `button` keyword argument, with a value of `'left'`, `'middle'`, or `'right'`. For example, `pyautogui.click(100, 150, button='left')` will click the left mouse button at the coordinates (100, 150), while `pyautogui.click(200, 250, button='right')` will perform a right-click at (200, 250).

Enter the following into the interactive shell:

```python
>>> import pyautogui
>>> pyautogui.click(10, 5)
```

You should see the mouse pointer move to near the top-left corner of your screen and click once. A full “click” is defined as pushing a mouse button down and then releasing it back up without moving the cursor. You can also perform a click by calling `pyautogui.mouseDown()`, which only pushes the mouse button down, and `pyautogui.mouseUp()`, which only releases the button. These functions have the same arguments as `click()`, and in fact, the `click()` function is just a convenient wrapper around these two function calls.

As a further convenience, the `pyautogui.doubleClick()` function will perform two clicks with the left mouse button, while the `pyautogui.rightClick()` and `pyautogui.middleClick()` functions will perform a click with the right and middle mouse buttons, respectively.

## Dragging the Mouse

*Dragging* means moving the mouse while holding down one of the mouse buttons. For example, you can move files between folders by dragging the folder icons, or you can move appointments around in a calendar app.

PyAutoGUI provides the `pyautogui.dragTo()` and `pyautogui.dragRel()` functions to drag the mouse cursor to a new location or a location relative to its current one. The arguments for `dragTo()` and `dragRel()` are the same as `moveTo()` and `moveRel()`: the x-coordinate/horizontal movement, the y-coordinate/vertical movement, and an optional duration of time. (OS X does not drag correctly when the mouse moves too quickly, so passing a `duration` keyword argument is recommended.)

With the mouse cursor over the drawing application’s canvas and the Pencil or Brush tool selected, enter the following into a new file editor window and save it as *spiralDraw.py*:

```python
   import pyautogui, time
❶ time.sleep(5)
❷ pyautogui.click()    # click to put drawing program in focus
   distance = 200
   while distance > 0:
❸     pyautogui.dragRel(distance, 0, duration=0.2)   # move right
❹     distance = distance - 5
❺     pyautogui.dragRel(0, distance, duration=0.2)   # move down
❻     pyautogui.dragRel(-distance, 0, duration=0.2)  # move left
       distance = distance - 5
       pyautogui.dragRel(0, -distance, duration=0.2)  # move up
```

Once the drawing program is in focus, *spiralDraw.py* draws a square spiral pattern like the one in Figure 18-2.

![The results from the pyautogui.dragRel() example](https://automatetheboringstuff.com/images/000015.jpg)

Figure 18-2. The results from the `pyautogui.dragRel()` example

## Scrolling the Mouse

The final PyAutoGUI mouse function is `scroll()`, which you pass an integer argument for how many units you want to scroll the mouse up or down. The size of a unit varies for each operating system and application, so you’ll have to experiment to see exactly how far it scrolls in your particular situation. The scrolling takes place at the mouse cursor’s current position. 

>  Passing a positive integer scrolls up, and passing a negative integer scrolls down.

Run the following in IDLE’s interactive shell while the mouse cursor is over the IDLE window:

```python
>>> pyautogui.scroll(200)
```

You’ll see IDLE briefly scroll upward—and then go back down. The downward scrolling happens because IDLE automatically scrolls down to the bottom after executing an instruction. Enter this code instead:

```python
>>> import pyperclip
>>> numbers = ''
>>> for i in range(200):
      numbers = numbers + str(i) + '\n'

>>> pyperclip.copy(numbers)
```

This imports `pyperclip` and sets up an empty string, `numbers`. The code then loops through 200 numbers and adds each number to `numbers`, along with a newline. After `pyperclip.copy(numbers)`, the clipboard will be loaded with 200 lines of numbers. Open a new file editor window and paste the text into it. This will give you a large text window to try scrolling in. Enter the following code into the interactive shell:

```python
>>> import time, pyautogui
>>> time.sleep(5); pyautogui.scroll(100)
```

On the second line, you enter two commands separated by a semicolon, which tells Python to run the commands as if they were on separate lines. The only difference is that the interactive shell won’t prompt you for input between the two instructions. This is important for this example because we want to the call to `pyautogui.scroll()` to happen automatically after the wait. 

> Note that while putting two commands on one line can be useful in the interactive shell, you should still have each instruction on a separate line in your programs.

After pressing ENTER to run the code, you will have five seconds to click the file editor window to put it in focus. Once the pause is over, the `pyautogui.scroll()` call will cause the file editor window to scroll up after the five-second delay.

# Working with the Screen

Your GUI automation programs don’t have to click and type blindly. PyAutoGUI has screenshot features that can create an image file based on the current contents of the screen. These functions can also return a Pillow `Image` object of the current screen’s appearance. 

On Linux computers, the `scrot` program needs to be installed to use the screenshot functions in PyAutoGUI. In a Terminal window, run **sudo apt-get install scrot** to install this program. If you’re on Windows or OS X, skip this step and continue with the section.

## Getting a Screenshot

To take screenshots in Python, call the `pyautogui.screenshot()` function. Enter the following into the interactive shell:

```python
>>> import pyautogui
>>> im = pyautogui.screenshot()
```

The `im` variable will contain the `Image` object of the screenshot. You can now call methods on the `Image` object in the `im` variable, just like any other `Image` object. Enter the following into the interactive shell:

```python
>>> im.getpixel((0, 0))
(176, 176, 175)
>>> im.getpixel((50, 200))
(130, 135, 144)
```

Pass `getpixel()` a tuple of coordinates, like (0, 0) or (50, 200), and it’ll tell you the color of the pixel at those coordinates in your image. 

## Analyzing the Screenshot

Say that one of the steps in your GUI automation program is to click a gray button. Before calling the `click()` method, you could take a screenshot and look at the pixel where the script is about to click. If it’s not the same gray as the gray button, then your program knows something is wrong. 

PyAutoGUI’s `pixelMatchesColor()` function will return `True` if the pixel at the given x- and y-coordinates on the screen matches the given color. The first and second arguments are integers for the x- and y-coordinates, and the third argument is a tuple of three integers for the RGB color the screen pixel must match. Enter the following into the interactive shell:

```python
   >>> import pyautogui
   >>> im = pyautogui.screenshot()
❶ >>> im.getpixel((50, 200))
   (130, 135, 144)
❷ >>> pyautogui.pixelMatchesColor(50, 200, (130, 135, 144))
   True
❸ >>> pyautogui.pixelMatchesColor(50, 200, (255, 135, 144))
   False
```

After taking a screenshot and using `getpixel()` to get an RGB tuple for the color of a pixel at specific coordinates ❶, pass the same coordinates and RGB tuple to `pixelMatchesColor()` ❷, which should return `True`. Then change a value in the RGB tuple and call `pixelMatchesColor()` again for the same coordinates ❸. This should return `false`. This method can be useful to call whenever your GUI automation programs are about to call `click()`. 

# Image Recognition

But what if you do not know beforehand where PyAutoGUI should click? You can use image recognition instead. Give PyAutoGUI an image of what you want to click and let it figure out the coordinates.

For example, if you have previously taken a screenshot to capture the image of a Submit button in *submit.png*, the `locateOnScreen()` function will return the coordinates where that image is found. To see how `locateOnScreen()` works, try taking a screenshot of a small area on your screen; then save the image and enter the following into the interactive shell, replacing `'submit. png'` with the filename of your screenshot:

```python
>>> import pyautogui
>>> pyautogui.locateOnScreen('submit.png')
(643, 745, 70, 29)
```

The four-integer tuple that `locateOnScreen()` returns has the x-coordinate of the left edge, the y-coordinate of the top edge, the width, and the height for the first place on the screen the image was found. If you’re trying this on your computer with your own screenshot, your return value will be different from the one shown here.

If the image cannot be found on the screen, `locateOnScreen()` will return `None`. Note that the image on the screen must match the provided image perfectly in order to be recognized. If the image is even a pixel off, `locateOnScreen()` will return `None`.

If the image can be found in several places on the screen, `locateAllOnScreen()` will return a `Generator` object, which can be passed to `list()` to return a list of four-integer tuples. There will be one four-integer tuple for each location where the image is found on the screen. Continue the interactive shell example by entering the following (and replacing `'submit.png'` with your own image filename):

```python
>>> list(pyautogui.locateAllOnScreen('submit.png'))
[(643, 745, 70, 29), (1007, 801, 70, 29)]
```

Each of the four-integer tuples represents an area on the screen. If your image is only found in one area, then using `list()` and `locateAllOnScreen()` just returns a list containing one tuple.

Once you have the four-integer tuple for the area on the screen where your image was found, you can click the center of this area by passing the tuple to the `center()` function to return x- and y-coordinates of the area’s center. Enter the following into the interactive shell, replacing the arguments with your own filename, four-integer tuple, and coordinate pair:

```python
>>> pyautogui.locateOnScreen('submit.png')
(643, 745, 70, 29)
>>> pyautogui.center((643, 745, 70, 29))
(678, 759)
>>> pyautogui.click((678, 759))
```

Once you have center coordinates from `center()`, passing the coordinates to `click()` should click the center of the area on the screen that matches the image you passed to `locateOnScreen()`.

# Controlling the Keyboard

PyAutoGUI also has functions for sending virtual keypresses to your computer, which enables you to fill out forms or enter text into applications.

## Sending a String from the Keyboard

The `pyautogui.typewrite()` function sends virtual keypresses to the computer. What these keypresses do depends on what window and text field have focus. You may want to first send a mouse click to the text field you want in order to ensure that it has focus.

By default, the `typewrite()` function will type the full string instantly. However, you can pass an optional second argument to add a short pause between each character. This second argument is an integer or float value of the number of seconds to pause. For example, `pyautogui.typewrite('Hello world!', 0.25)` will wait a quarter-second after typing *H*, another quarter-second after *e*, and so on. This gradual typewriter effect may be useful for slower applications that can’t process keystrokes fast enough to keep up with PyAutoGUI.

For characters such as *A* or *!*, PyAutoGUI will automatically simulate holding down the SHIFT key as well.

## Key Names

Not all keys are easy to represent with single text characters. For example, how do you represent SHIFT or the left arrow key as a single character? In PyAutoGUI, these keyboard keys are represented by short string values instead: `'esc'` for the ESC key or `'enter'` for the ENTER key.

Instead of a single string argument, a list of these keyboard key strings can be passed to `typewrite()`. For example, the following call presses the A key, then the B key, then the left arrow key twice, and finally the X and Y keys:

```python
>>> pyautogui.typewrite(['a', 'b', 'left', 'left', 'X', 'Y'])
```

Because pressing the left arrow key moves the keyboard cursor, this will output *XYab*. Table 18-1 lists the PyAutoGUI keyboard key strings that you can pass to `typewrite()` to simulate pressing any combination of keys.

You can also examine the `pyautogui.KEYBOARD_KEYS` list to see all possible keyboard key strings that PyAutoGUI will accept. The `'shift'` string refers to the left SHIFT key and is equivalent to `'shiftleft'`. The same applies for `'ctrl'`, `'alt'`, and `'win'` strings; they all refer to the left-side key.

Table 18-1. `PyKeyboard` Attributes

| Keyboard key string                      | Meaning                                  |
| ---------------------------------------- | ---------------------------------------- |
| `'a'`, `'b'`, `'c'`, `'A'`, `'B'`, `'C'`, `'1'`, `'2'`, `'3'`, `'!'`, `'@'`, `'#'`, and so on | The keys for single characters           |
| `'enter'` (or `'return'` or `'\n'`)      | The ENTER key                            |
| `'esc'`                                  | The ESC key                              |
| `'shiftleft'`, `'shiftright'`            | The left and right SHIFT keys            |
| `'altleft'`, `'altright'`                | The left and right ALT keys              |
| `'ctrlleft'`, `'ctrlright'`              | The left and right CTRL keys             |
| `'tab'` (or `'\t'`)                      | The TAB key                              |
| `'backspace'`, `'delete'`                | The BACKSPACE and DELETE keys            |
| `'pageup'`, `'pagedown'`                 | The PAGE UP and PAGE DOWN keys           |
| `'home'`, `'end'`                        | The HOME and END keys                    |
| `'up'`, `'down'`, `'left'`, `'right'`    | The up, down, left, and right arrow keys |
| `'f1'`, `'f2'`, `'f3'`, and so on        | The F1 to F12 keys                       |
| `'volumemute'`, `'volumedown'`, `'volumeup'` | The mute, volume down, and volume up keys (some keyboards do not have these keys, but your operating system will still be able to understand these simulated keypresses) |
| `'pause'`                                | The PAUSE key                            |
| `'capslock'`, `'numlock'`, `'scrolllock'` | The CAPS LOCK, NUM LOCK, and SCROLL LOCK keys |
| `'insert'`                               | The INS or INSERT key                    |
| `'printscreen'`                          | The PRTSC or PRINT SCREEN key            |
| `'winleft'`, `'winright'`                | The left and right WIN keys (on Windows) |
| `'command'`                              | The Command (![img](https://automatetheboringstuff.com/images/000085.jpg)) key (on OS X) `'option'` The OPTION key (on OS X) |

## Pressing and Releasing the Keyboard

Much like the `mouseDown()` and `mouseUp()` functions, `pyautogui.keyDown()` and `pyautogui.keyUp()` will send virtual keypresses and releases to the computer. They are passed a keyboard key string (see [able 18-1) for their argument. For convenience, PyAutoGUI provides the `pyautogui.press()` function, which calls both of these functions to simulate a complete keypress.

Run the following code, which will type a dollar sign character (obtained by holding the SHIFT key and pressing 4):

```python
>>> pyautogui.keyDown('shift'); pyautogui.press('4'); pyautogui.keyUp('shift')
```

This line presses down SHIFT, presses (and releases) 4, and then releases SHIFT. If you need to type a string into a text field, the `typewrite()` function is more suitable. But for applications that take single-key commands, the `press()` function is the simpler approach.

## Hotkey Combinations

A *hotkey* or *shortcut* is a combination of keypresses to invoke some application function. The common hotkey for copying a selection is CTRL-C (on Windows and Linux) or ⌘-C (on OS X). The user presses and holds the CTRL key, then presses the C key, and then releases the C and CTRL keys. To do this with PyAutoGUI’s `keyDown()` and `keyUp()` functions, you would have to enter the following:

```python
pyautogui.keyDown('ctrl')
pyautogui.keyDown('c')
pyautogui.keyUp('c')
pyautogui.keyUp('ctrl')
```

This is rather complicated. Instead, use the `pyautogui.hotkey()` function, which takes multiple keyboard key string arguments, presses them in order, and releases them in the reverse order. For the CTRL-C example, the code would simply be as follows:

```python
pyautogui.hotkey('ctrl', 'c')
```

This function is especially useful for larger hotkey combinations. In Word, the CTRL-ALT-SHIFT-S hotkey combination displays the Style pane. Instead of making eight different function calls (four `keyDown()` calls and four `keyUp()` calls), you can just call `hotkey('ctrl', 'alt', 'shift', 's')`.

With a new IDLE file editor window in the upper-left corner of your screen, enter the following into the interactive shell (in OS X, replace `'alt'` with `'ctrl'`):

```python
   >>> import pyautogui, time
   >>> def commentAfterDelay():
❶       pyautogui.click(100, 100)
❷       pyautogui.typewrite('In IDLE, Alt-3 comments out a line.')
         time.sleep(2)
❸       pyautogui.hotkey('alt', '3')

   >>> commentAfterDelay()
```

This defines a function `commentAfterDelay()` that, when called, will click the file editor window to bring it into focus ❶, type *In IDLE, Atl-3 comments out a line* ❷, pause for 2 seconds, and then simulate pressing the ALT-3 hotkey (or CTRL-3 on OS X) ❸. This keyboard shortcut adds two *#* characters to the current line, commenting it out. (This is a useful trick to know when writing your own code in IDLE.)

# Review of the PyAutoGUI Functions

Since this chapter covered many different functions, here is a quick summary reference:

- **moveTo(x, y)**. Moves the mouse cursor to the given *x* and *y* coordinates.
- **moveRel(xOffset, yOffset)**. Moves the mouse cursor relative to its current position.
- **dragTo(x, y)**. Moves the mouse cursor while the left button is held down.
- **dragRel(xOffset, yOffset)**. Moves the mouse cursor relative to its current position while the left button is held down.
- **click(x, y, button)**. Simulates a click (left button by default).
- **rightClick()**. Simulates a right-button click.
- **middleClick()**. Simulates a middle-button click.
- **doubleClick()**. Simulates a double left-button click.
- **mouseDown(x, y, button)**. Simulates pressing down the given button at the position *x*, *y*.
- **mouseUp(x, y, button)**. Simulates releasing the given button at the position *x*, *y*.
- **scroll(units)**. Simulates the scroll wheel. A positive argument scrolls up; a negative argument scrolls down.
- **typewrite(message)**. Types the characters in the given message string.
- **typewrite([key1, key2, key3])**. Types the given keyboard key strings.
- **press(key)**. Presses the given keyboard key string.
- **keyDown(key)**. Simulates pressing down the given keyboard key.
- **keyUp(key)**. Simulates releasing the given keyboard key.
- **hotkey([key1, key2, key3])**. Simulates pressing the given keyboard key strings down in order and then releasing them in reverse order.
- **screenshot()**. Returns a screenshot as an `Image` object. 

# Generalizations

* `pyautogui`
  * Break: 
    * Logging Out
    * Pause: `pyautogui.PAUSE = time`
    * Fail-Safe: `pyautogui.FAILSAFE = True`[^1]
  * Mouse:
    * Move: 
      * Absolute: `pyautogui.moveTo(coordinates, duration=time)`[^2]
      * Relative: `pyautogui.moveRel()`
    * Position: `pyautogui.position()`
    * Click: `pyautogui.click(coordinates, button='right'/'left'/'middle')`
      * mouseDown: `pyautogui.mouseDown()`
      * mouseUp: `pyautogui.mouseUp()`
      * doubleClick: `pyautogui.doubleClick()`
      * rightClick: `pyautogui.rightClick()`
      * middleClick: `pyautogui.middleClick()`
    * Drag: 
      * Absolute: `pyautogui.dragTo(coordinates, duration=time)`
      * Relative: `pyautogui.dragRel()` 
    * Scroll: `pyautogui.scroll(integer)`[^3]
  * Screen:
    * Image[^4]: `pyautogui.screenshot()`
    * Analyze: `pyautogui.pixelMatchesColor(coordinates, (RGB))`[^5]
    * imageRecognition: `pyautogui.locateOnScreen('submit.png')`[^6]
      * Center: `pyautogui.center((643, 745, 70, 29))`
  * Keyboard:
    * Input:  `pyautogui.typewrite(string, time)`[^7]
      * keyboardKeyStrings: `pyautogui.typewrite([keyboardKeyStrings])`
    * Click: 
      * Press: `pyautogui.press()`
      * keyDown: `pyautogui.keyDown()`
      * keyUp: `pyautogui.keyUp()`
      * hotKey: `pyautogui.hotkey()`

# More Info

[Chapter 18 – Controlling the Keyboard and Mouse with GUI Automation](https://automatetheboringstuff.com/chapter18/)    
[PyAutoGUI’s documentation](http://pyautogui.readthedocs.io/en/latest/index.html


[^1]: Moving the mouse cursor to the upper-left corner of the screen will cause PyAutoGUI to raise the `pyautogui.FailSafeException` exception.
[^2]: By default, this click uses the left mouse button and takes place wherever the mouse cursor is currently located.
[^3]: Passing a positive integer scrolls up, and passing a negative integer scrolls down.
[^4]: object
[^5]: Return True or False.
[^6]: If the image cannot be found on the screen, `locateOnScreen()` will return `None`.
[^7]: Time is optional argument.
