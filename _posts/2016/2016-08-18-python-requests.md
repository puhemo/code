---
title: "Python Modules -- Requests"
date: 2016-08-18
modified: 2016-08-18
published: true
categories:
  - Python
tags:
  - Python
  - Module
excerpt: |
    Requests allows you to send organic, grass-fed HTTP/1.1 requests, without the need for manual labor. There's no need to manually add query strings to your URLs, or to form-encode your POST data. Keep-alive and HTTP connection pooling are 100% automatic, powered by urllib3, which is embedded within Requests.
---

* TOC
{:toc}
This article is modified from [Requests: HTTP for Humans](http://docs.python-requests.org/en/master/) provided by [Kenneth Reitz](https://twitter.com/kennethreitz) and only for personal notes. 

The `requests` module lets you easily download files from the Web without having to worry about complicated issues such as network errors, connection problems, and data compression.

The `requests` module was written because Python’s `urllib2` module is too complicated to use. In fact, take a permanent marker and black out this entire paragraph. Forget I ever mentioned `urllib2`. If you need to download things from the Web, just use the `requests` module.

## Installation

To install Requests, simply run this simple command in your terminal of choice:

```powershell
$ pip install requests
```

If you don't have [pip](https://pip.pypa.io) installed, this [Python installation guide](http://docs.python-guide.org/en/latest/starting/installation/) can guide you through the process.

## Make a Request

Making a request with Requests is very simple.

Begin by importing the Requests module:

```python
>>> import requests
>>> r = requests.get('https://api.github.com/events')
```

Now, we have a [`Response`](http://docs.python-requests.org/en/master/api/#requests.Response) object called `r`. We can get all the information we need from this object.

Requests' simple API means that all forms of HTTP request are as obvious. For example, this is how you make an HTTP `POST` request:

```python
>>> r = requests.post('http://httpbin.org/post', data = {'key':'value'})
```

Nice, right? What about the other HTTP request types: `PUT`, `DELETE`, `HEAD` and `OPTIONS`? These are all just as simple:

```python
>>> r = requests.put('http://httpbin.org/put', data = {'key':'value'})
>>> r = requests.delete('http://httpbin.org/delete')
>>> r = requests.head('http://httpbin.org/get')
>>> r = requests.options('http://httpbin.org/get')
```

### The requests.get() Function

The `requests.get()` function takes a string of a URL to download. By calling `type()` on `requests.get()`’s return value, you can see that it returns a `Response` object, which contains the response that the web server gave for your request.

```
   >>> import requests
   >>> res = requests.get('https://automatetheboringstuff.com/files/rj.txt')
   >>> type(res)
   <class 'requests.models.Response'>
   >>> res.status_code == requests.codes.ok
   True
   >>> len(res.text)
   178981
   >>> print(res.text[:250])
   The Project Gutenberg EBook of Romeo and Juliet, by William Shakespeare

   This eBook is for the use of anyone anywhere at no cost and with
   almost no restrictions whatsoever. You may copy it, give it away or
   re-use it under the terms of the Proje
```

You can tell that the request for this web page succeeded by checking the `status_code` attribute of the `Response` object. If it is equal to the value of `requests.codes.ok`, then everything went fine.

If the request succeeded, the downloaded web page is stored as a string in the `Response` object’s `text` variable. This variable holds a large string of the entire play; the call to `len(res.text)` shows you that it is more than 178,000 characters long. Finally, calling `print(res.text[:250])` displays only the first 250 characters.

### Checking for Errors

As you’ve seen, the `Response` object has a `status_code` attribute that can be checked against `requests.codes.ok` to see whether the download succeeded. A simpler way to check for success is to call the `raise_for_status()` method on the `Response` object. This will raise an exception if there was an error downloading the file and will do nothing if the download succeeded. Enter the following into the interactive shell:

```
>>> res = requests.get('http://inventwithpython.com/page_that_does_not_exist')
>>> res.raise_for_status()
Traceback (most recent call last):
  File "<pyshell#138>", line 1, in <module>
    res.raise_for_status()
  File "C:\Python34\lib\site-packages\requests\models.py", line 773, in raise_for_status
    raise HTTPError(http_error_msg, response=self)
requests.exceptions.HTTPError: 404 Client Error: Not Found
```

The `raise_for_status()` method is a good way to ensure that a program halts if a bad download occurs. This is a good thing: You want your program to stop as soon as some unexpected error happens. If a failed download *isn’t* a deal breaker for your program, you can wrap the `raise_for_status()` line with `try` and `except` statements to handle this error case without crashing.

```python
import requests
res = requests.get('http://inventwithpython.com/page_that_does_not_exist')
try:
    res.raise_for_status()
except Exception as exc:
    print('There was a problem: %s' % (exc))
```

This `raise_for_status()` method call causes the program to output the following:

```
There was a problem: 404 Client Error: Not Found
```

**Always call `raise_for_status()` after calling `requests.get()`.** You want to be sure that the download has actually worked before your program continues.

### Saving Downloaded Files to the Hard Drive

From here, you can save the web page to a file on your hard drive with the standard `open()` function and `write()` method. There are some slight differences, though. First, you must open the file in *write binary* mode by passing the string `'wb'` as the second argument to `open()`. Even if the page is in plaintext (such as the *Romeo and Juliet* text you downloaded earlier), you need to write binary data instead of text data in order to maintain the *Unicode encoding* of the text.

To write the web page to a file, you can use a `for` loop with the `Response` object’s `iter_content()` method.

```
>>> import requests
>>> res = requests.get('https://automatetheboringstuff.com/files/rj.txt')
>>> res.raise_for_status()
>>> playFile = open('RomeoAndJuliet.txt', 'wb')
>>> for chunk in res.iter_content(100000):
        playFile.write(chunk)

100000
78981
>>> playFile.close()
```

**The `iter_content()` method returns “chunks” of the content on each iteration through the loop**. Each chunk is of the *bytes* data type, and you get to specify how many bytes each chunk will contain. One hundred thousand bytes is generally a good size, so pass `100000` as the argument to `iter_content()`.

The `write()` method returns the number of bytes written to the file. In the previous example, there were 100,000 bytes in the first chunk, and the remaining part of the file needed only 78,981 bytes.

To review, here’s the complete process for downloading and saving a file:

1. Call `requests.get()` to download the file.
2. Call `open()` with `'wb'` to create a new file in write binary mode.
3. Loop over the `Response` object’s `iter_content()` method.
4. Call `write()` on each iteration to write the content to the file.
5. Call `close()` to close the file.

That’s all there is to the `requests` module! The `for` loop and `iter_content()` stuff may seem complicated compared to the `open()`/`write()`/`close()` workflow you’ve been using to write text files, but it’s to ensure that the `requests` module doesn’t eat up too much memory even if you download massive files. You can learn about the `requests` module’s other features from *http://requests.readthedocs.org/*.

## Passing Parameters In URLs

You often want to send some sort of data in the URL's query string. If you were constructing the URL by hand, this data would be given as key/value pairs in the URL after a question mark, e.g. `httpbin.org/get?key=val`.Requests allows you to provide these arguments as a dictionary, using the `params` keyword argument. As an example, if you wanted to pass`key1=value1` and `key2=value2` to `httpbin.org/get`, you would use thefollowing code:

```python
>>> payload = {'key1': 'value1', 'key2': 'value2'}
>>> r = requests.get('http://httpbin.org/get', params=payload)
```

You can see that the URL has been correctly encoded by printing the URL:

```python
>>> print(r.url)
http://httpbin.org/get?key2=value2&key1=value1
```

Note that any dictionary key whose value is `None` will not be added to the URL's query string.

You can also pass a list of items as a value:

```python
>>> payload = {'key1': 'value1', 'key2': ['value2', 'value3']}

>>> r = requests.get('http://httpbin.org/get', params=payload)
>>> print(r.url)
http://httpbin.org/get?key1=value1&key2=value2&key2=value3
```

## Response Content

We can read the content of the server's response. Consider the GitHub timeline again:

```python
>>> import requests

>>> r = requests.get('https://api.github.com/events')
>>> r.text
u'[{"repository":{"open_issues":0,"url":"https://github.com/...
```

Requests will automatically decode content from the server. Most unicode charsets are seamlessly decoded.

## Binary Response Content

You can also access the response body as bytes, for non-text requests:

```python
>>> r.content
b'[{"repository":{"open_issues":0,"url":"https://github.com/...
```

The `gzip` and `deflate` transfer-encodings are automatically decoded for you.

For example, to create an image from binary data returned by a request, you can use the following code:

```python
>>> from PIL import Image
>>> from io import BytesIO

>>> i = Image.open(BytesIO(r.content))
```

## JSON Response Content

There's also a builtin JSON decoder, in case you're dealing with JSON data:

```python
>>> import requests

>>> r = requests.get('https://api.github.com/events')
>>> r.json()
[{u'repository': {u'open_issues': 0, u'url': 'https://github.com/...
```

In case the JSON decoding fails, `r.json()` raises an exception. For example, if the response gets a 204 (No Content), or if the response contains invalid JSON,attempting `r.json()` raises `ValueError: No JSON object could be decoded`.

It should be noted that the success of the call to `r.json()` does **not** indicate the success of the response. Some servers may return a JSON object in a failed response (e.g. error details with HTTP 500). Such JSON will be decodedand returned. To check that a request is successful, use`r.raise_for_status()` or check `r.status_code` is what you expect.

## Custom Headers

If you'd like to add HTTP headers to a request, simply pass in a `dict` to the`headers` parameter.

For example, we didn't specify our user-agent in the previous example:

```python
>>> url = 'https://api.github.com/some/endpoint'
>>> headers = {'user-agent': 'my-app/0.0.1'}

>>> r = requests.get(url, headers=headers)
```

Requests does not change its behavior at all based on which custom headers are specified. The headers are simply passed on into the final request.

Note: All header values must be a `string`, bytestring, or unicode. While permitted, it's advised to avoid passing unicode header values.

## Response Headers

We can view the server's response headers using a Python dictionary:

```python
>>> r.headers
{
    'content-encoding': 'gzip',
    'transfer-encoding': 'chunked',
    'connection': 'close',
    'server': 'nginx/1.0.4',
    'x-runtime': '148ms',
    'etag': '"e1ca502697e5c9317743dc078f67693f"',
    'content-type': 'application/json'
}
```

The dictionary is special, though: it's made just for HTTP headers. HTTP Header names are case-insensitive.

So, we can access the headers using any capitalization we want:

```python
>>> r.headers['Content-Type']
'application/json'

>>> r.headers.get('content-type')
'application/json'
```

## Cookies

If a response contains some Cookies, you can quickly access them:

```python
>>> url = 'http://example.com/some/cookie/setting/url'
>>> r = requests.get(url)

>>> r.cookies['example_cookie_name']
'example_cookie_value'
```

To send your own cookies to the server, you can use the `cookies`parameter:

```python
>>> url = 'http://httpbin.org/cookies'
>>> cookies = dict(cookies_are='working')

>>> r = requests.get(url, cookies=cookies)
>>> r.text
'{"cookies": {"cookies_are": "working"}}'
```

Cookies are returned in a [`RequestsCookieJar`](http://docs.python-requests.org/en/master/api/#requests.cookies.RequestsCookieJar), which acts like a `dict` but also offers a more complete interface,suitable for use over multiple domains or paths.  Cookie jars can also be passed in to requests:

```python
>>> jar = requests.cookies.RequestsCookieJar()
>>> jar.set('tasty_cookie', 'yum', site='httpbin.org', path='/cookies')
>>> jar.set('gross_cookie', 'blech', site='httpbin.org', path='/elsewhere')
>>> url = 'http://httpbin.org/cookies'
>>> r = requests.get(url, cookies=jar)
>>> r.text
'{"cookies": {"tasty_cookie": "yum"}}'
```

## Timeouts

You can tell Requests to stop waiting for a response after a given number of seconds with the `timeout` parameter:

```python
>>> requests.get('http://github.com', timeout=0.001)
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
requests.exceptions.Timeout: HTTPConnectionPool(host='github.com', port=80): Request timed out. (timeout=0.001)
```

If you specify a single value for the timeout, like this:

```python
r = requests.get('https://github.com', timeout=5)
```

The timeout value will be applied to both the `connect` and the `read`timeouts. Specify a tuple if you would like to set the values separately:

```python
r = requests.get('https://github.com', timeout=(3.05, 27))
```

If the remote server is very slow, you can tell Requests to wait forever for a response, by passing None as a timeout value and then retrieving a cup of coffee.

```python
r = requests.get('https://github.com', timeout=None)
```

> Note: `timeout` is not a time limit on the entire response download; rather, an exception is raised if the server has not issued aresponse for `timeout` seconds (more precisely, if no bytes have been received on the underlying socket for `timeout` seconds). If no timeout is specified explicitly, requests do not time out.

## Reference

[Python爬虫利器一之Requests库的用法](http://cuiqingcai.com/2556.html) 

[Requests–快速上手](http://docs.python-requests.org/zh_CN/latest/user/quickstart.html) 

[Requests–高级用法](http://docs.python-requests.org/zh_CN/latest/user/advanced.html) 

[深入理解urllib、urllib2及requests](http://www.codefrom.com/paper/%E6%B7%B1%E5%85%A5%E7%90%86%E8%A7%A3urllib%E3%80%81urllib2%E5%8F%8Arequests)

[What are the differences between the urllib, urllib2, and requests module?](http://stackoverflow.com/questions/2018026/what-are-the-differences-between-the-urllib-urllib2-and-requests-module)

[Chapter 11 – Web Scraping](https://automatetheboringstuff.com/chapter11/)
