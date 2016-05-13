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

{% assign imagedir = "../images/user-management/" %}

{:.fake-h2}
Objective

In this lab we are going to create the login and sign up pages.  By the end of the lab you will have the need instructions to be able to implement login functionality in any of your ionic applications.


|![Login Page]({{"login-page-no-error.png" | prepend: imagedir }}) |![Sign up page]({{"signup-page.png" | prepend: imagedir }})
|*login page*|*signup page*

{:.fake-h2}
Table of Contents

* TOC
{:toc}

## 9.0: Create the Signup Page

1. In the www/templates directory created a file called signup.html
1. Set the contents of the signup.html page to:

        <ion-view view-title="Signup" hide-nav-bar="true">
          <ion-content class="padding">
            <div class="app-logo"><img src="img/todo_logo.png"></div>
            <div>
              <form name="loginForm">
                <label class="item item-input">
                        <input id="email" name="email" required type="email" placeholder="Your email" ng-model="vm.formdata.email">
                    </label>
                <label class="item item-input">
                        <input id="firstname" name="firstname" type="text" placeholder="Your first name" ng-model="vm.formdata.firstName">
                    </label>
                <label class="item item-input">
                        <input id="username" name="lastname" type="text" placeholder="Your last name" ng-model="vm.formdata.lastName">
                    </label>
                <label class="item item-input">
                        <input id="password" required name="password" type="password" placeholder="Your password" ng-model="vm.formdata.password">
                    </label>
                <label class="item item-input">
                        <input id="again" required name="again" type="password" placeholder="confirm your password" ng-model="vm.formdata.passwordConfirm">
                    </label>
              </form>
            </div>

            <div ng-show="vm.error" class="center-div login-error">
              <h4 class="login-error" ng-bind="vm.error"></h4>
            </div>

            <div>
              <button class="button button-block button-positive" ng-disabled="!loginForm.$valid" ng-click="vm.signup()"> Create Account </button>
            </div>
            <div class="center-div">
              Already have an account? <a href="#/login">Sign in</a>
            </div>
          </ion-content>
        </ion-view>

### 9.0.1: Add some style to the Signup page

The signup and login pages uses a few custom styles to get the layout look like we, so we need to add those into our stylesheet.

1. Open the www/css/style.css and add the following classes:

        .center-div {
          display: inline-block;
          width: 100%;
          margin: 0 auto;
          text-align: center;
          margin-top: 10px;
        }

        #social-login-buttons {
          margin-top: 30px;
        }

        .app-logo {
          max-width: 100px;
          margin: auto;
          background-repeat: no-repeat;
          background-position: center;
        }

        .login-error {
          color:red;
        }

### 9.0.2: Adding Route

We are now ready to add the routes in so that we can view the pages.

1. Open the www/js/config/app.config.js and add the following routes to get to the lign and signup pages.

        .state('signup', {
              url: '/signup',
              templateUrl: 'templates/signup.html'
        })

1. If you don't already have ionic serve running, open a command prompt and run the command ionic serve
1. In your web browser, navigate directly to [http://localhost:8100/#/signup](http://localhost:8100/#/signup) to view the signup page.  Later on we will wire up all of the logic to route the user correctly to the login if they are not authenticated but one thing at a time.

Right now the sign up page do not have any functionality behind it.  We are now going to add the controllers and services.

### 9.0.3: Login Service

The first thing we are going to do is create the angular service to call the Back& authorization service to sign a user up.

1. In the www/js/services directory create a file called login.service.js
1. Using the angular snippet `ng1factory` to generate a new service.
    * This will have a few fields to fill out as part of the template.  When you are done filling out each field press tab to go to the next one
    * Values to fill out:
        * Module: starter
        * Service: LoginService
        * dependency1: Backand
        * exposedFn: signup
1. Press Esc to exit the snippet
1. In the signup method, we need to pass in the following fields:
    * firstName
    * lastName
    * email
    * password
    * passwordConfirm

            function signup(firstName, lastName, email, password, passwordConfirm) {
            }
1. Then inside the signup method we need to call the Backand.signup method and pass all of the fields in.  The Backand.signup method takes care all of the authentication.  It calls the Back& authorization service and upon successful login broadcast an authorize event.

        return Backand.signup(firstName, lastName, email, password, passwordConfirm);

1. In order for the Backand.signup method to work properly, we need to set the signup token value in the www/js/app.config.js file just like we set the app name and anonymous token in the previous lab.  Back& will

          BackandProvider.setSignUpToken('14d7ec8d-e57a-4d93-9724-10f7879a352b');

### 9.0.4: Signup Controller

Now it is time to create the controller for the signup page for the UI view to be able to call the LoginService.

1. In the www/js/controllers directory created a file called signup.controller.js
1. Use the `ng1controller` snippet to generate the controller code
    * This will have a few fields to fill out as part of the template.  When you are done filling out each field press tab to go to the next one
    * Values to fill out:
        * Module: starter
        * Controller: SignupController
        * dependency1: LoginService
1. Press Esc to exit the snippet

Now we need to create the signup function and expose it to the view.  After the `activate` function create a new function called signup.  In the signup function if the call to the LoginService.signup is successfully we will redirect the user to the projects page by calling `$state.go` (Don't forget to inject `$state` into the `SignupController`).  To expose the function to the view we need to add it to the vm variable by creating the vm.signup variable and setting the value of it to signup.

       SignupController.$inject = ['LoginService', '$rootScope', '$state'];
       function SignupController(LoginService, $rootScope, $state) {
         var vm = this;
         vm.signup = signup;

         activate();

         ////////////////

         function activate() { }

         function signup() {
           vm.error = '';
           LoginService.signup(vm.formdata.firstName, vm.formdata.lastName, vm.formdata.email, vm.formdata.password, vm.formdata.passwordConfirm)
             .then(function (result) {
               $state.go('projects');
             },
             function (error) {
               console.log('error', error);
               if (error.error_description !== undefined) {
                 vm.error = error.error_description;
               } else {
                 vm.error = 'Unknown Error';
               }

             });
         }
       }

1. We are ready to add the `SignupController` to the route in the www/js/app.config.js file

        controller: 'SignupController as vm'

1. The last step before viewing it in the browser is to add the reference to the signup.controller.js and login.service.js files in the index.html page

        <script src="js/services/login.service.js"></script>
        <script src="js/controllers/signup.controller.js"></script>

1. If you don't already have ionic serve running, open a command prompt and run the command ionic serve
1. In your web browser, navigate directly to [http://localhost:8100/#/signup](http://localhost:8100/#/signup) to view the signup page.  Later on we will wire up all of the logic to route the user correctly to the login if they are not authenticated but one thing at a time.
1. You should now be able to create a new account and it will redirect you to the projects list upon successful account creation.


## 9.1: Creating the Login Page


1. Download the [logo image](../files/todo_logo.png) and save it into the www/img directory
1. In the www/templates directory create a file called login.html
1. Set the contents of login.html  to:

        <ion-view view-title="Login" hide-nav-bar="true">
          <ion-content class="padding">
            <div>
              <div>
                <div class="app-logo"><img src="img/todo_logo.png"></div>
                <div>
                  <form name="loginForm">
                    <label class="item item-input">
                              <input required type="text" placeholder="Email" ng-model="vm.formdata.email">
                    </label>
                    <label class="item item-input">
                              <input required type="password" placeholder="Password" ng-model="vm.formdata.password">
                    </label>
                  </form>
                </div>
                <div ng-show="vm.error" class="center-div">
                  <h4 class="login-error" ng-bind="vm.error"></h4>
                </div>
                <div>
                  <button class="button button-block button-positive ion-unlocked"
                      ng-disabled="!loginForm.$valid" ng-click="vm.login()"> Login</button>
                </div>
                <div class="center-div">
                  <a href="#/signup">Join now</a>
                </div>
              </div>
            </div>
          </ion-content>
        </ion-view>

### 9.1.1: Adding Routes

We are now ready to add the routes in so that we can view the pages.

1. Open the www/js/config/app.config.js and add the following routes to get to the lign and signup pages.

            .state('login', {
              url: '/login',
              templateUrl: 'templates/login.html'
            })

1. If you don't already have ionic serve running, open a command prompt and run the command ionic serve
1. In your web browser, navigate to [http://localhost:8100/#/login](http://localhost:8100/#/login) to view the login page.  Click on Join now will take you to the sign up page or you can navigate directly to it at [http://localhost:8100/#/signup](http://localhost:8100/#/signup)

Right now the login page do not have any functionality behind it.  It is now time to wire up the login page with a controller that calls into the LoginService to log the user in.

### 9.1.2: Login Service

We are first going to implement the username and password login.  To do this we need to create a function in the `LoginService` that calls the `Backand.signin` function.

1. Open the www/js/services/login.service.js file
1. Add a function called `login` with 2 parameters called email and password
1. In the `login' function return `Back.signin` and pass both parameters to the call

          function login(email, password) {
            return Backand.signin(email, password);
          }
1.  Don't forget to also add the `login` function to the `var service`

        var service = {
            signup: signup,
            login: login
         }

We are now ready to create the login controller to call the `LoginService.signin` function that we just created.

### 9.1.3: Login Controller

1. In the www/js.controllers directory create a file called login.controller.js
1. Use the `ng1controller` snippet to generate the controller code
    * This will have a few fields to fill out as part of the template.  When you are done filling out each field press tab to go to the next one
    * Values to fill out:
        * Module: starter
        * Controller: LoginController
        * dependency1: LoginService
1. Press Esc to exit the snippet

Now we need to create the login function and expose it to the view.  After the `activate` function create a new function called login.  In the ogin function if the call to the `LoginService.login` is successfully we will redirect the user to the projects page by calling `$state.go` (Don't forget to inject `$state` into the `LoginController`).  To expose the function to the view we need to add it to the vm variable by creating the vm.login variable and setting the value of it to login.

    LoginController.$inject = ['LoginService', '$state'];
      function LoginController(LoginService, $state) {
        var vm = this;
        vm.login = login;

        activate();

        ////////////////
        function activate() { }

        function login() {
          vm.error = '';
          LoginService.login(vm.formdata.email, vm.formdata.password)
            .then(function (result) {
              $state.go('projects');
            },
            function (error) {
              console.log('error', error);
              if (error.error_description !== undefined) {
                vm.error = error.error_description;
              } else {
                vm.error = 'Unknown Error';
              }
            });
        }
      }


1. We are ready to add the `LoginController` to the route in the www/js/app.config.js file

        controller: 'LoginController as vm'

1. The last step before viewing it in the browser is to add the reference to the login.controller.js files in the index.html page.  No need to add the login.service.js  since it is already there from the signup page section

        <script src="js/controllers/login.controller.js"></script>

1. If you don't already have ionic serve running, open a command prompt and run the command ionic serve
1. In your web browser, navigate directly to [http://localhost:8100/#/login](http://localhost:8100/#/login) to view the login page.  Later on we will wire up all of the logic to route the user correctly to the login if they are not authenticated but one thing at a time.
1. You should be able to login with the user that you create when you signed up in the previous section and have it redirect you to the project list upon successful login.

## 9.2: Adding Social Logins

Now that we are able to login with the username and password, lets add in the ability to login with Facebook, Google+, Github or Twitter.

### 9.2.1: Add Social Buttons to Login Page

1. Open the www/templates/login.html page
1. Before the `</ion-content>` tag add the follwing html to add the social login buttons onto the login form.  This html will add the ionicons for the different provider and call the vm.socialSignin function for each type.

        <div id="social-login-buttons">
          <div class="button-bar">
            <button class="button button-positive button-block" ng-click="vm.socialSignin('facebook')"><i class="icon ion-social-facebook"> Facebook</i></button>
            <button class="button button-assertive  button-block" ng-click="vm.socialSignin('google')"><i class="icon ion-social-googleplus"> Google+</i></button>
          </div>
          <div class="button-bar">
            <button class="button button-stable  button-block" ng-click="vm.socialSignin('github')"><i class="icon ion-social-github"></i> Github</button>
            <button class="button button-calm  button-block" ng-click="vm.socialSignin('twitter')"><i class="icon ion-social-twitter"></i> Twitter</button>
          </div>
        </div>

### 9.2.2: Creating the `LoginService` function to call the social provider to login and authorize

### 9.2.3: Adding `socialSignin` method to controller

    vm.socialSignIn(provider);

    *ex:*
    vm.socialSignIn('facebook')
    vm.socialSignIn('google')
    vm.socialSignIn('github')
    vm.socialSignIn('twitter')

## 9.3: Ensuring the User is Logged In

**app.config.js**

    BackandProvider.setSignUpToken(CONSTS.signUpToken);

    $urlRouterProvider.otherwise(function ($injector) {
    var $state = $injector.get("$state");
        $state.go("tab.projects");
    });

    // Setup interceptors for $http calls to provide global functions for request/response
    $httpProvider.interceptors.push('APIInterceptor');

**api.interceptor.js**

    runBlock.$inject = ['$ionicPlatform', '$rootScope', '$state', 'Backand', 'LoginService'];

    (function () {
      'use strict';

      angular
        .module('todo.interceptors')
        .service('APIInterceptor', ApiInterceptor);

      ApiInterceptor.$inject = ['$rootScope', '$q'];
      function ApiInterceptor($rootScope, $q) {
        var service = this;
        service.responseError = responseError;
        service.request = request;
        service.response = response;

        ////////////////
        function responseError(response) {
          if (response.status === 401) {
            $rootScope.$broadcast('unauthorized');
          }

          console.log('api interceptor http error', response);
          return $q.reject(response);
        }
      }
    })();

**app.run.js**

    var isMobile = !(ionic.Platform.platforms[0] == "browser");
    Backand.setIsMobile(isMobile);
    Backand.setRunSignupAfterErrorInSigninSocial(true);

    $rootScope.$on('$stateChangeStart', function (event, next, nextParams, fromState) {
        console.log('state change');
        if (next.name !== 'login' && next.name !== "signup") {
          if (!LoginService.verifyIsLoggedIn(false)) {
            event.preventDefault();
            return $state.go('login');
          } else {
            console.log('logged in already');
            return;
          }
        } else {
          console.log("should be on login page");
        }
        });

        $rootScope.$on('BackandSignOut', function () {
        $state.go('login');
    });




## Logout Support

Right now we do not directly support logout.  In a  future lab we will implement this functionality.  For now you can go into the Chrome Dev Tools and clear the Resource local storage for anything that has Backand in the name.