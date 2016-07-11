---
title: "Python Part 03: Date and Time"
date: 2016-06-15 10:40
modified: 2016-07-11
categories:
  - Python
tags:
  - Python Syntax
  - Python 2.x
published: true
excerpt: |
  A lot of times you want to keep track of when something happened. We can do so in Python using `datetime`.
series: "Intro to Python"	
---
{% include series.html %}

* TOC
{:toc}

A lot of times you want to keep track of when something happened. We can do so in Python using `datetime`.

We can use a function called `datetime.now()` to retrieve the current date and time.

```python
from datetime import datetime

print datetime.now()
```

## Extracting Information

```python
from datetime import datetime
now = datetime.now()

current_year = now.year
current_month = now.month
current_day = now.day
print now.hour
print now.minute
print now.second
```

## Hot Date

What if we want to print today's date in the following format? `mm/dd/yyyy`. Let's use string substitution again!

```python
from datetime import datetime
now = datetime.now()

print '%s-%s-%s' % (now.year, now.month, now.day)
# will print: 2016-07-11
```

## Grand Finale

We've managed to print the date and time separately in a very pretty fashion. Let's combine the two!

```python
from datetime import datetime
now = datetime.now()

print '%s/%s/%s' % (now.month, now.day, now.year)
print '%s:%s:%s' % (now.hour, now.minute, now.second)
```

