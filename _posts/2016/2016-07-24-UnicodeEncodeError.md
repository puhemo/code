---
title: "UnicodeEncodeError01"
date: 2016-07-24
modified: 2016-07-24
published: true
categories:
  - Python
tags:
  - Python 2.x
  - Error
excerpt: |
    UnicodeEncodeError: ‘gbk’ codec can’t encode character ****: illegal multibyte sequence
---

## Error

```python
UnicodeDecodeError: 'gbk' codec can't decode bytes in position 7-8: illegal multibyte sequence
```

## Problem

```python
def getResult(url):
    txtfile = open("cnbeta.txt", "w")
    html = urllib2.urlopen(url).read()
    html = html.decode('gbk').encode('utf-8')
    #print html
    analysisPage(html, txtfile)
    txtfile.close()
```

## Solution

`s.decode('gbk', ‘ignore').encode('utf-8′)`

`decode( [encoding[, errors]])`: Decodes the string using the codec registered for encoding. encoding defaults to the default string encoding. errors may be given to set a different error handling scheme. The default is 'strict', meaning that encoding errors raise UnicodeError. Other possible values are 'ignore', 'replace' and any other name registered via codecs.register_error, see section 4.8.1.

```python
def getResult(url):
    txtfile = open("cnbeta.txt", "w")
    html = urllib2.urlopen(url).read()
    html = html.decode('gbk', 'ignore').encode('utf-8') # 
    #print html
    analysisPage(html, txtfile)
    txtfile.close()
```

## Reference

[网页抓取中编码问题：UnicodeEncodeError: ‘gbk’ codec can’t encode character ****: illegal multibyte sequence](http://ouyangmy.is-programmer.com/posts/38096.html)

[python字符串decode中遇到非法字符的问题](http://www.cnblogs.com/baiyuyang/archive/2011/10/29/2228667.html)
