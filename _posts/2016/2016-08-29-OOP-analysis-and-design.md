---
title: "Basic Object-Oriented Analysis and Design"
date: 2016-08-29
modified: 2016-08-29
published: true
categories:
  - Python
tags:
  - Python
  - OOP
excerpt: |
    I'm going to describe a process to use when you want to build something using Python, specifically with object-oriented programming (OOP). 
---

This article excerpt from [Exercise 43: Basic Object-Oriented Analysis and Design](https://learnpythonthehardway.org/book/ex43.html).

I'm going to describe a process to use when you want to build something using Python, specifically with **object-oriented programming (OOP)**.  What I mean by a "process" is that I'll give you a set of steps that you do in order, but that you aren't meant to be a slave to or that will totally always work for every problem.  They are just a good starting point for many programming problems and shouldn't be considered the *only* way to solve these types of problems.  This process is just one way to do it that you can follow.

The process is as follows:

1. Write or draw about the problem.
2. Extract key concepts from 1 and research them.
3. Create a class hierarchy[^1] and object map for the concepts.
4. Code the classes and a test to run them.
5. Repeat and refine.

The way to look at this process is that it is "**top down**," meaning it starts from the very abstract loose idea and then slowly refines it until the idea is solid and something you can code.

I start by just writing about the problem and trying to think up anything I can about it.  Maybe I'll even draw a **diagram** or two, maybe a map of some kind, or even write myself a series of emails describing the problem.  This gives me a way to express the key concepts in the problem and also explore what I might already know about it.

Then I go through these notes, drawings, and descriptions and I pull out the key concepts.  There's a simple trick to doing this:  **Simply make a list of all the *nouns* and *verbs* in your writing and drawings, then write out how they're related**.  This gives me a good list of names for classes, objects, and functions in the next step.  I take this list of concepts and then research any that I don't understand so I can refine them further if I needed.

Once I have my list of concepts I create a simple outline/tree of the concepts and how they are related as classes.  You can usually take your list of nouns and start asking "Is this one like other concept nouns? That means they have a common parent class, so what is it called?" Keep doing this until you have a class hierarchy that's just a simple tree list or a diagram.  Then take the *verbs* you have and see if those are function names for each class and put them in your tree.

With this class hierarchy figured out, I sit down and write some basic skeleton code that has just the classes, their functions, and nothing more.  I then write a test that runs this code and makes sure the classes I've made make sense and work right.  Sometimes I may write the test first though, and other times I might write a little test, a little code, a little test, etc. until I have the whole thing built.

Finally, I keep cycling over this process repeating it and refining as I go and making it as clear as I can before doing more implementation.  If I get stuck at any particular part because of a concept or problem I haven't anticipated, then I sit down and start the process over on just that part to figure it out more before continuing.

## Top Down vs. Bottom Up

The process is typically labeled "top down" since it starts at the most abstract concepts (the top) and works its way down to actual implementation.  I want you to use this process I just described when analyzing problems in the book from now on, but you should know that there's another way to solve problems in programming that starts with code and goes "up" to the abstract concepts.  This other way is labeled "bottom up."  Here are the general steps you follow to do this:

1. Take a small piece of the problem; hack on some code and get it to run barely.
2. Refine the code into something more formal with classes and automated tests.
3. Extract the key concepts you're using and try to find research for them.
4. Write a description of what's really going on.
5. Go back and refine the code, possibly throwing it out and starting over.
6. Repeat, moving on to some other piece of the problem.

I find this process is better once you're more solid at programming and, are naturally thinking in code about problems.  This process is very good when you know small pieces of the overall puzzle, but maybe don't have enough information yet about the overall concept.  Breaking it down in little pieces and exploring with code then helps you slowly grind away at the problem until you've solved it.  However, remember that your solution will probably be meandering and weird, so that's why my version of this process involves going back and finding research then cleaning things up based on what you've learned.

[^1]: any system of persons or things ranked one above another.
