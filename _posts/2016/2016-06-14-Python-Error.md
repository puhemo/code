---
title: "Python Error"
date: 2016-06-09 20:55:39
categories:
- 术
tags:
- Python
- Error
permalink: python-error
---

## SyntaxError

###  SyntaxError: non-ascii character ' xe6' in file
中文注释乱码问题
```python
代码开始的第一行添加如下一条语句：
# This Python file uses the following encoding: utf-8

或添加语句为：

# encoding: utf-8
```
<!-- more -->