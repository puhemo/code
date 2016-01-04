---
layout: post
title: 'Better Way To Get Talk Feedback'
date: 2016-01-05  06:00
categories: ['Speaking']
published: true
--

As a public speaker one of the most important things for me is getting feedback from attendees.  The feedback helps me get better as a presenter as well as figuring out what is working in a talk and what is not. 

When I started speaking I tried several different speaker feedback sites but the number of people that actually have feedback was extremely low (like 1 out of a hundred).  It wasn't until one of the attendees gave me feedback in person and told that they wanted to leave feedback but just didn't want to register for another online account.  

I had been talking with other speakers about how they get feedback and all of them seemed to have the same issue of low response rate. 

Then I meet [Devin Rader ](http://twitter.com/devinrader) from [Twilio ](http:/twillio.com) and he mentioned a totally different way that they asked for talk feedback.  At Twilio they used something called Net Promoter Score (NPS).   

NPS ask the user to rate on a scale of 1 to 10.   10 meaning, I would bring my best friend to see the talk and 1 being, please never give this talk again.  

NPS seems easy enough but you still need some way to get the feedback and to get attendee to summit the feedback.  

The first problem is solved by a combination of Twilio to receive the rating through a text message and Twimlbin to send an automated response back to the attendee.   By sending a text message the attendee does not have to register for any kind of account and are more willing to give feedback.

The second problem is solved by giving attendees a reason to text in the rating.  Most attendees want to be able to download the slides and demo code.  I used to give the links at the end of the slide deck but now the attendees get the links as part of the automated response for giving me a rating.  It is a win win for attendees and myself. 

 By using this method of getting feedback I have seen the amount of feedback climb to between 50-75%.  
 
Now lets take a look at how to actual implement this feedback system. 

## Getting Twilio Phone Number 

The first thing we need to do is sign up for a Twilio account.  

Once you have an account you need to purchase a phone number.  The number of phone numbers to purchase depends on how close your talks are together at an event.  If the talks are on the same day then I get a separate phone number for each talk else I just reuse the phone number.  

Sending a text message through Twilio does cost money but it is really inexpensive.  It is $1 per month for each phone number and $.0075 per message.  That is less than a penny per message.  

![cost image here]() 

To purchase a phone number go under your account, select phone numbers, and click the buy a new Twilio phone  number llink.

![buy phone number]()

## Configuring Phone Number to Use Twimlbin

Now that we have a phone number we need to configure it to have an automated response when it gets SMS messages. 

To do this we are going to use [Twimlbin](http://twimlbin.com/)   which is a website that does nothing more than send back a Twilio formatted response (Twilio markup language or TwiML for short) when Twilio sends it a message.  

To create a Twinlbin, click on the "Create a new Twimlbin" button on the home page. 

![Twinlbin home page]()

When you create a Twimlbin.com you will be presented with a box to type in the TwiML, a public url thst is read only and a private url to edit the twimlbin. 

![Create twimlbin page]()



## Parsing Log To Calculate Feedback 

## Turning off Twilio so you are not charged by accident 



