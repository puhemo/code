---
published: true
layout: post
title: 'Vagrant - Multi-Machines from External File'
categories: ['How-To', 'vagrant']
date: 2015-3-28
---


###Machine Status

**All Machines**

	vagrant status

**By Name**

	vagrant status [machine name]

**By Regular Expression**

	vagrant status [Regular expression]

Examples:
* Contains the String win7: vagrant status /win7/
  

###Start up Machines

**All Machines**

	vagrant up

**By Name**

	vagrant up [machine name]

**By Regular Expression**

Use regular expression to bring up machines that match a string in the virtual machine name.

	vagrant up /ie8/

