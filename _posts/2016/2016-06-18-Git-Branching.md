---
title:  "Git Part 3.1 - Branches in a Nutshell"
date: 2016-06-18 
modified: 2016-06-18 11:20
published: true
categories: 
  - Git
tags:
  - Git
  - Github
excerpt: |
  几乎所有的版本控制系统都以某种形式支持分支。 使用分支意味着你可以把你的工作从开发主线上分离开来，以免影响开发主线。
series: "Intro to Git"
---
{% include series.html %}

## 分支简介

我们假设现在有一个工作目录，里面包含了三个将要被暂存和提交的文件。

```
$ git add README test.rb LICENSE
$ git commit -m 'The initial commit of my project'
```

现在，Git 仓库中有五个对象：三个 blob 对象（保存着文件快照）、一个树对象（记录着目录结构和 blob 对象索引）以及一个提交对象（包含着指向前述树对象的指针和所有提交信息）。

![首次提交对象及其树结构.](https://git-scm.com/book/en/v2/book/03-git-branching/images/commit-and-tree.png)Figure 3-1. 首次提交对象及其树结构

做些修改后再次提交，那么这次产生的提交对象会包含一个指向上次提交对象（父对象）的指针。

![提交对象及其父对象.](https://git-scm.com/book/en/v2/book/03-git-branching/images/commits-and-parents.png)Figure 3-2. 提交对象及其父对象

Git 的分支，其实本质上仅仅是**指向提交对象的可变指针**。Git 的默认分支名字是 `master`。在多次提交操作之后，你其实已经有一个指向最后那个提交对象的 `master` 分支。它会在每次的提交操作中自动向前移动。

> Note: Git 的 “master” 分支并不是一个特殊分支。它就跟其它分支完全没有区别。之所以几乎每一个仓库都有 master 分支，是因为 `git init` 命令默认创建它，并且大多数人都懒得去改动它。

![分支及其提交历史.](https://git-scm.com/book/en/v2/book/03-git-branching/images/branch-and-history.png)Figure 3-3. 分支及其提交历史

## 分支创建

Git 是怎么创建新分支的呢？很简单，它只是为你创建了一个可以移动的新的指针。比如，创建一个 testing 分支，你需要使用 `git branch` 命令：

```
$ git branch testing
```

这会在当前所在的提交对象上创建一个指针。

![两个指向相同提交历史的分支。](https://git-scm.com/book/en/v2/book/03-git-branching/images/two-branches.png)Figure 3-4. 两个指向相同提交历史的分支

那么，Git 又是怎么知道当前在哪一个分支上呢？也很简单，它有一个名为 `HEAD` 的特殊指针。在 Git 中，它是一个指针，指向当前所在的本地分支（译注：将 `HEAD` 想象为当前分支的别名）。在本例中，你仍然在 `master` 分支上。因为 `git branch` 命令仅仅 创建 一个新分支，并不会自动切换到新分支中去。

![HEAD 指向当前所在的分支.](https://git-scm.com/book/en/v2/book/03-git-branching/images/head-to-master.png)Figure 3-5. HEAD 指向当前所在的分支

你可以简单地使用 `git log` 命令查看各个分支当前所指的对象。提供这一功能的参数是 `--decorate`。

```
$ git log --oneline --decorate
f30ab (HEAD, master, testing) add feature #32 - ability to add new
34ac2 fixed bug #1328 - stack overflow under certain conditions
98ca9 initial commit of my project
```

正如你所见，当前 “master” 和 “testing” 分支均指向校验和以 `f30ab` 开头的提交对象。

## 分支切换

要切换到一个已存在的分支，你需要使用 `git checkout` 命令。我们现在切换到新创建的 `testing` 分支去：

```
$ git checkout testing
```

这样 `HEAD` 就指向 `testing` 分支了。

![HEAD 指向当前所在的分支.](https://git-scm.com/book/en/v2/book/03-git-branching/images/head-to-testing.png)Figure 3-6. HEAD 指向当前所在的分支

那么，这样的实现方式会给我们带来什么好处呢？现在不妨再提交一次：

```
$ vim test.rb
$ git commit -a -m 'made a change'
```

![HEAD 分支随着提交操作自动向前移动.](https://git-scm.com/book/en/v2/book/03-git-branching/images/advance-testing.png)Figure 3-7. HEAD 分支随着提交操作自动向前移动

如图所示，你的 `testing` 分支向前移动了，但是 `master` 分支却没有，它仍然指向运行 `git checkout` 时所指的对象。这就有意思了，现在我们切换回 `master` 分支看看：

```
$ git checkout master
```

![检出时 HEAD 随之移动.](https://git-scm.com/book/en/v2/book/03-git-branching/images/checkout-master.png)Figure 3-8. 检出时 HEAD 随之移动

这条命令做了两件事。一是使 HEAD 指回 `master` 分支，二是将工作目录恢复成 `master` 分支所指向的快照内容。也就是说，你现在做修改的话，项目将始于一个较旧的版本。本质上来讲，这就是忽略 `testing` 分支所做的修改，以便于向另一个方向进行开发。

> Note: 
> **分支切换会改变你工作目录中的文件**
> 在切换分支时，一定要注意你工作目录里的文件会被改变。如果是切换到一个较旧的分支，你的工作目录会恢复到该分支最后一次提交时的样子。如果 Git 不能干净利落地完成这个任务，它将禁止切换分支。

我们不妨再稍微做些修改并提交：

```
$ vim test.rb
$ git commit -a -m 'made other changes'
```

现在，这个项目的提交历史已经产生了分叉。因为刚才你创建了一个新分支，并切换过去进行了一些工作，随后又切换回 master 分支进行了另外一些工作。上述两次改动针对的是不同分支：你可以在不同分支间不断地来回切换和工作，并在时机成熟时将它们合并起来。而所有这些工作，你需要的命令只有 `branch`、`checkout` 和 `commit`。

![项目分叉历史.](https://git-scm.com/book/en/v2/book/03-git-branching/images/advance-master.png)Figure 3-9. 项目分叉历史

由于 Git 的分支实质上仅是包含所指对象校验和（长度为 40 的 SHA-1 值字符串）的文件，所以它的创建和销毁都异常高效。 创建一个新分支就像是往一个文件中写入 41 个字节（40 个字符和 1 个换行符），如此的简单能不快吗？

## More Info

* [3.1 Git 分支 - 分支简介](https://git-scm.com/book/zh/v2/Git-%E5%88%86%E6%94%AF-%E5%88%86%E6%94%AF%E7%AE%80%E4%BB%8B)
