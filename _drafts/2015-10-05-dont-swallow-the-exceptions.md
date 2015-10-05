---
layout: post
title: 'Do Not Swallow The Exceptions'
categories: ['programming', 'c#']
published: true
date: 2015-10-6 06:00
excerpt: |
    I really dislike when I get projects that swallow or hide all of the exception that are thrown.  What I mean by this is that there is try/catch blocks in the code that do nothing with the exceptions and in some cases don't have a way to get at the exception even in the debugger.  I have spent many hours troubleshooting code that I thought should have worked and was not throwing any exceptions back.    
    
    ##Examples of Issue

    Here are a couple of examples of swallowing the exception.  
    
    **Totally Throwing Away Exception**
    
    In this example, the code does nothing with the exception and does not even tell the caller that something failed.  I have spent many hours troubleshooting projects with this exact try/catch block and wondering why something that I thought should have worked was not, just to discover that deep down in the call stack it was swallowing the exception.  Since the catch block is empty, there is no way to put a breakpoint in the catch block but even if you could, there is no way to get at the exception in the catch block since it was not passed into it.  You would need to make a temp code change to add an exception parameter to the catch block and a bogus line in the catch block to be able to get at the exception.  
        
        public void SomeMethod()
        {
            try
            {
                //Some Code That Errors
            }
            catch
            {
            }
        }
---

I really dislike when I see or get projects that swallow or hide all of the exception that are thrown.  What I mean by this is that there is try/catch blocks in the code that do nothing with the exceptions and in some cases don't have a way to get at the exception even in the debugger.  I have spent many hours troubleshooting code that I thought should have worked and was not throwing any exceptions back.    

##Examples of Issue

Here are a couple of examples of swallowing the exception.  

**Totally Throwing Away Exception**

In this example, the code does nothing with the exception and does not even tell the caller that something failed.  I have spent many hours troubleshooting projects with this exact try/catch block and wondering why something that I thought should have worked was not, just to discover that deep down in the call stack it was swallowing the exception.  Since the catch block is empty, there is no way to put a breakpoint in the catch block but even if you could, there is no way to get at the exception in the catch block since it was not passed into it.  You would need to make a temp code change to add an exception parameter to the catch block and a bogus line in the catch block to be able to get at the exception.  
    
    public void SomeMethod()
    {
        try
        {
            //Some Code That Errors
        }
        catch
        {
        }
    }

**At Least Tells You Something Went Wrong**

In this example, the code at least returns false back from the method so you can try to assume that something didn't go right but you really don't know if an exception was generated or if it was some business logic that didn't pass.  If it does throw an exception, it is not logging an information about the exception.  As well if you hook up a debugger there is no way to get to the thrown exception in the catch block since it was not passed into it.  You would need to make a temp code change to add an exception parameter to the catch block and a bogus line in the catch block to be able to get at the exception.

    public bool SomeMethod()
    {
        try
        {
           //Some code
           if ("Business Logic Failed")
           {
                return false;   
           }
           
           //everything passed
           return true;  
        }
        catch 
        {
            return false;    
        }    
    }
    
##Not Swallowing the Exception..What to Do

So what should you do to not swallow the exception?  It is simple.  Add the Exception variable to the catch block and log the information somewhere or let the exception bubble up the call stack.

**Fix Example #1: Logging Exception**

In this example, the exception along with all of the inner exceptions are logged.  You can also put a breakpoint inside the catch block to get details on the exception.  This code still returns a false if something went wrong which doesn't make it obvious if it was an exception or just business logic that didn't pass.    

    public bool SomeMethod()
    {
        try
        {
           //Some code
           if ("Business Logic Failed")
           {
                throw new ApplicationException("Business Logic Failed...Give details on what failed");  
           }
           
           return true;  
        }  
        catch (Exception ex)
        {
            //Logs StackTrace, Message, and all InnerException Message/StackTrace
            LogMessage(ex);   
            return false;
        }
    }
    
**Fix Example #2: Bubbling Exception Up Call Stack**

This example lets the full exception go up the call stack so that the calling method can figure out how it wants to handle the exception.  You should handle this exception at some point.  It is bad practice to let it become an unhandled exception and crach your application.

    public void SomeMethod()
    {
        //Some Code        
        if ("Business Logic Failed")
        {
            //Let Exception Bubble Up the Call Stack
            throw new ApplicationException("Business Logic Failed...Give details on what failed");  
        }
            
    }    

    
**Fix Example #3: Ability to Put in a Breakpoint**

This is my least favorite way to not swallow exception as you are still technically swallow the error.  At least though, you can hook up the debugger, put a breakpoint on the return statement, and get at the real exception.  This only works in your debugger but sometimes something is better than nothing.  

    public void SomeMethod()
    {
        try
        {
            
            //Some Code    
        }   
        catch (Exception ex)
        {
            return;
        }    
    }    
    
    
##Wrap-Up

As you can see it does not take much more work to be able to do something with the exception.  It will save you hours of troubleshooting work just by handling the exception and not throwing it away.  Don't take the easy route out.  Be nice to your fellow developers and don't throw away the exceptions.       