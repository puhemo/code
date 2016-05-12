---
collection: workshops
title: 'Lab 09 : Implementing User Management'
published: true
type: ionic
layout: workshoppost2
order: 9
lab: ionic
length: 
todo: |
    * Update length
    * Update objectives
    * Add Wrap Up
    * Write Lab

---

{% assign imagedir = "../images/" %}

<div class="fake-h2">Objective</div>

* Add Username and password logins
* Add Social Logins
* ?? Implement Security in the API

<div class="fake-h2">Table of Contents</div>

* TOC
{:toc}

## Creating the Login Page

1. In the www/templates directory create a file called login.html
1. Download the [logo image](../files/todo_logo.png) and save it into the www/img directory
1. Set the contents of login.html  to:

        <ion-view view-title="Login" hide-nav-bar="true">
          <ion-content class="padding">
            <div class="row responsive-sm padding removeBP login-div">
              <div class="col">
                <div class="app-logo"><img src="img/todo_logo.png"></div>
                <div class="list removeBP">
                  <form name="loginForm">
                    <label class="item item-input">
                      <input required type="text" placeholder="Email" ng-model="login.email">
                    </label>
                    <label class="item item-input">
                      <input required type="password" placeholder="Password" ng-model="login.password">
                    </label>
                  </form>
                </div>
            <div class="row padding removePM">
              <div class="col">
                <h4 style="color:red;" ng-bind="login.error"></h4>
              </div>
            </div>
                <div class="loginButton">
                  <button class="button button-block button-positive  ion-unlocked" ng-disabled="!loginForm.$valid" ng-click="login.signin()">
                    Login </button>
                </div>
                <div class="row padding removePM centerDiv">
                  <div class="col">
                    <a href="#/signup">Create Account</a>
                  </div>
                </div>
              </div>
            </div>
            <div class="row  padding removePM">
              <div class="button-bar">
                <button class="button button-positive button-block item-text-wrap" ng-click="login.socialSignin('facebook')"><i class="icon ion-social-facebook"></i><br />Facebook</button>
                <button class="button button-assertive  button-block item-text-wrap" ng-click="login.socialSignin('google')"><i class="icon ion-social-googleplus"></i><br />Google+</button>
                <button class="button button-calm  button-block item-text-wrap" ng-click="login.socialSignin('github')"><i class="icon ion-social-github"></i><br />Github</button>
              </div>
            </div>
          </ion-content>
        </ion-view>

## Create the Signup Page

1. In the www/templates directory created a file called signup.html
1. Set the contents of the signup.html page to:

        <ion-view view-title="Signup" hide-nav-bar="true">
          <ion-content class="padding">
            <div class="row responsive-sm padding removeBP login-div">
              <div class="col">
                <div class="app-logo"><img src="img/todo_logo.png"></div>
                <div class="list removeBP">
                  <form name="loginForm">
                    <label class="item item-input">
                      <input id="email" name="email" required type="email" placeholder="Your email" ng-model="signup.email">
                    </label>
                    <label class="item item-input">
                      <input id="firstname" name="firstname" type="text" placeholder="Your first name" ng-model="signup.firstName">
                    </label>
                    <label class="item item-input">
                      <input id="username" name="lastname" type="text" placeholder="Your last name" ng-model="signup.lastName">
                    </label>
                    <label class="item item-input">
                      <input id="password" required name="password" type="password" placeholder="Your password" ng-model="signup.password">
                    </label>
                    <label class="item item-input">
                      <input id="again" required name="again" type="password" placeholder="confirm your password" ng-model="signup.again">
                    </label>
                  </form>
                </div>
                <div class="row padding removePM">
                  <div class="col">
                    <h4 style="color:red;" ng-bind="signup.error"></h4>
                  </div>
                </div>

                <div class="loginButton">
                  <button class="button button-block button-positive" ng-disabled="!loginForm.$valid" ng-click="signup.signup()"> Create Account </button>
                </div>
                <div class="row padding removePM centerDiv">
                  <div class="col">
                    <a href="#/login">Cancel</a>
                  </div>
                </div>
              </div>
            </div>
          </ion-content>
        </ion-view>

## Adding Routes


1. Open the www/js/config/app.config.js and add the following routes to get to the lign and signup pages.

            .state('login', {
              url: '/login',
              templateUrl: 'templates/login.html'
            })

            .state('signup', {
              url: '/signup',
              templateUrl: 'templates/signup.html'
            });


## Style the Signup and Login Pages

1. Open the www/css/style.css and add the following classes to the bottom of the file so that the signin pages looks like we want it.  These CSS classes are custom ones that are built just for the purpose of making the page looks like I want.

        .centerDiv {
          display: inline-block;
          width: 100%;
          margin: 0 auto;
          text-align: center; }

        .item-text-center {
          display: -webkit-box;
          display: -webkit-flex;
          display: -moz-box;
          display: -moz-flex;
          display: -ms-flexbox;
          display: flex;
          -webkit-box-align: center;
          -ms-flex-align: center;
          -webkit-align-items: center;
          -moz-align-items: center;
          align-items: center;
          top: 0;
          height: 100%; }

        .login-div {
          opacity: 0.93; }

        .removePM {
          margin-top: 0px;
          margin-bottom: 0px;
          padding-top: 0px;
          padding-bottom: 0px; }

        .removeBP {
          padding-bottom: 0px; }

        .loginButton {
          padding-bottom: 0px; }

        .app-logo {
          max-width: 100px;
          margin: auto;
          background-repeat: no-repeat;
          background-position: center; }



## Wiring up the Signup Page


## Implement Username and Password Login

## Implement Social Logins