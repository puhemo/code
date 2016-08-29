---
title: "Difference between exit(0) and exit(1) in Python"
date: 2016-08-29
modified: 2016-08-29
published: true
categories:
  - Python
tags:
  - Python
  - OOP
excerpt: |
    Exit from Python. Zero is considered “successful termination” and any nonzero value is considered “abnormal termination” by shells and the like.
---

```python
from sys import exit

exit([arg])
```

0 and 1 are the exit[^1] codes.

`exit(0)` means a clean exit without any errors / problems

`exit(1)` means there was some issue / error / problem and that is why the program is exiting.

This is not Python specific and is pretty common. A non-zero exit code is treated as an abnormal exit, and at times, the error code indicates what the problem was. A zero error code means a successful exit.

This is useful for other programs, shell, caller etc. to know what happened with your program and proceed accordingly.

## Reference

[Difference between exit(0) and exit(1) in Python](http://stackoverflow.com/questions/9426045/difference-between-exit0-and-exit1-in-python)

[28.1. sys — System-specific parameters and functions](https://docs.python.org/2/library/sys.html)

[^1]: The optional argument arg can be an integer giving the exit status (defaulting to zero), or another type of object. If it is an integer, zero is considered “successful termination” and any nonzero value is considered “abnormal termination” by shells and the like. 
