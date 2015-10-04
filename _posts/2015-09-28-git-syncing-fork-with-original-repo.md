---
layout: post
title: 'Git - Syncing Your Fork With The Original Repo'
categories: ['git', 'github']
published: true
date: 2015-10-2 07:00
excerpt: |
   If you have forked a repository there are times where you want to sync the changes in the original repositoy with your forked repository.  This is very easy to accomplish but it is not configured out of the box when you you do a clone of the repo to your machine.

   This post will walk you syncing the changes from the original repo into your forked repository.    
---

##Overview

If you have forked a repository there are times where you want to sync the changes in the original repositoy with your forked repository.  This is very easy to accomplish but it is not configured out of the box when you you do a clone of the repo to your machine.

This post will walk you syncing the changes from the original repo into your forked repository.

##Configuring a remote for a fork

Before we can sync the changes from the original repo into your forked repo, you have to tell git how to contact the original repository.

1. Open the Command Prompt or Terminal
1. Change to the directory that contains your repository
1. Check to see if you have the original repo configured or not as an upstream remote

    ```
    $ git remote -v
    origin  https://github.com/YOUR_USERNAME/YOUR_FORK.git (fetch)
    origin  https://github.com/YOUR_USERNAME/YOUR_FORK.git (push)
    ```

1. If the only remotes is to your repo, then you need to add the original repo location.

    ```
    $ git remote add upstream https://github.com/ORIGINAL_OWNER/ORIGINAL_REPOSITORY.git
    ```

1. Verify you have the original repo location configured as an upstream repo      

    ```
    $ git remote -v
    origin    https://github.com/YOUR_USERNAME/YOUR_FORK.git (fetch)
    origin    https://github.com/YOUR_USERNAME/YOUR_FORK.git (push)
    upstream  https://github.com/ORIGINAL_OWNER/ORIGINAL_REPOSITORY.git (fetch)
    upstream  https://github.com/ORIGINAL_OWNER/ORIGINAL_REPOSITORY.git (push)
    ```

##Syncing the Forked Repo with the Original Repo

Now that we have the upstream remote configured, we can pull the changes from the original repository into your forked repository.  

1. Open the Command Prompt or Terminal         
1. Change to the directory that contains your repository
1. Fetch the branches and their respective commits from the upstream repository. Commits to master will be stored in a local branch, upstream/master.

    ```
    $ git fetch upstream
    remote: Counting objects: 75, done.
    remote: Compressing objects: 100% (53/53), done.
    remote: Total 62 (delta 27), reused 44 (delta 9)
    Unpacking objects: 100% (62/62), done.
    From https://github.com/ORIGINAL_OWNER/ORIGINAL_REPOSITORY
    * [new branch]      master     -> upstream/master
    ```

1. Check out your fork's local master branch.

    ```
    $ git checkout master
    Switched to branch 'master'         
    ```

1. Merge the changes from upstream/master into your local master branch. This brings your fork's master branch into sync with the upstream repository, without losing your local changes.        

    ```
    $ git merge upstream/master
    Updating a422352..5fdff0f
    Fast-forward
    README                    |    9 -------
    README.md                 |    7 ++++++
    2 files changed, 7 insertions(+), 9 deletions(-)
    delete mode 100644 README
    create mode 100644 README.md
    ```

1. If your local branch didn't have any unique commits, Git will instead perform a "fast-forward":

    ```
    $ git merge upstream/master
    Updating 34e91da..16c56ad
    Fast-forward
    README.md                 |    5 +++--
    1 file changed, 3 insertions(+), 2 deletions(-)          
    ```
          
1. If there were no merge conflicts, you are ready to push the changes back to the online repo

        $ git push          
        
1. If you have merge conflicts, you will need to resolve before committing the changes.

##Conclussion

Now your forked repository has all of the changes that the original repo has made since you forked the repo.           
        