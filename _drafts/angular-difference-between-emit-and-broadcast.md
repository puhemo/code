---
layout: post
title: Angular - Difference Between $scope emit and broadcast
date: 2016-01-25 06:00
categories: [' angular']
published: true
excerpt: |

---


The main difference between scope.$broadcast and scope.$emit is where in the scope hierarchy you use them to send event notifictions.  

If you have a need to send notification of an event from a parent scope to a child scope, you use $scope.$broadcast to send the event.  

???? code examples???
	$scope.$broadcast("parent event name", dataTo Send);

If you then need to send notification of an event from the child scope back to the parent scope you use $scope.$emit

??? code examples???

	$scope.$emit("child event name", dataTo Send);
	
To listen to the events regardless of if it sent from the parent or child scope, you use $scope.$on.

???code examples ?????

	$scope.$on("parent event name", function(){
	});
	
		$scope.$on("child event name", function(){
	});
	
