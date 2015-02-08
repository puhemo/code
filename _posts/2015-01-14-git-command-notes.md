---
published: true
layout: post
title: Git Command Notes
tags: [git]
categories: ['git', 'source-control', 'github']
redirect_from: "/git/"
date: 2015-01-14 20:45:35
---

I am finally making myself learn the git command line instead of just using a UI so that I can actually understand what git is really doing.  Plus I have started playing a lot with the IonicBox and running a Ubuntu vagrant controlled VM for this blog and both of those are just linux shell command prompt only machines.

Below are my notes on various commands so that I can stop having to Google each time I forgot one of them.


## Caching Credentials

#### To cache credentials for 1 hour.  The timeout is in seconds.

	git config --global credential.helper 'cache --timeout 3600'


## Basic Commands

### Getting code to local machine

In Git terms, this is called cloning a repository and the command to use is git clone.  

#### directory name will match repository name

	git clone [Remote Repository Url]  
    
#### use this command if you want to name the directory different than the repository name

	git clone [Remote Repository Url]  [Directory to Clone into]
    
### Where did the local repository come from?


	git remote -v

### See what files have changed


	Long Form: git status  
	Short Form: git status -s


### Turning a directory into a repository on the local machine

	git init
    
### Adding files to the repository

	git add [file name]

### Adding all files in a directory except the ones in the .gitignore file

	git add .


### Ignoring files

- create .gitignore file 
- starter files available at [https://github.com/github/gitignore](https://github.com/github/gitignore)

  
### Committing files to the local repository

	git commit -m "Your Message"
  
### Removing Files
  
	git rm [File Name]
  
### Moving Files
  
	git mv [Old File Name] [New File Name]
  
### Publishing files to the remote repository
  
	git push
  
## Storing work that you want to keep but not commit
  
### Storing the work
  
	git stash
  
### Seeing what work is stored
	
	git stash list
  
### Applying the last stash to the current code

	git stash apply
  
### Applying a different stash then the last one to the current code
	
	git stash apply stash@{[Number for stash from git stash list command]}
  
## Branching
  
### Creating a Branch
  
	git branch [Branch Name]
  
### Switch to a branch
  
	git checkout [Branch Name]
  
### Merging a branch into the master (HEAD)
  
	First make sure you are on the master branch: git checkout master
  
	Then issue the merge command: git merge [branch name]
  
### List the branches for the repository
  
	git branch
  
  - Note: the * in the results indicates the branch currently checked out. 
  
  
### See last commit of each branch
  
	git branch -v 
  
### See branches already merged
  
	git branch --merged
  
### See branches NOT already merged
  
	git branch --no-merged
  
### Push branch to remote repository
	
	git push origin [branch name]
  
### Delete a Local branch
	
	git branch -d [branch name]


### Deleting Remote Branch
	git push origin --delete [branch name]
