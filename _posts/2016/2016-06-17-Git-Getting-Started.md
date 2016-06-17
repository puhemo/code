---
title:  "Git 基础 - Getting Started"
date: 2016-06-17
modified: 2016-06-17
published: true
categories: 
  - Git
tags:
  - Git
  - Github
excerpt: |
  git是一个分布式版本控制软件，最初由林纳斯·托瓦兹（Linus Torvalds）创作，于2005年以GPL发布。最初目的是为更好地管理Linux内核开发而设计。
---

## Git 基础 - Getting Started

git是一个分布式版本控制软件，最初由林纳斯·托瓦兹（Linus Torvalds）创作，于2005年以GPL发布。最初目的是为更好地管理Linux内核开发而设计。

### 直接记录快照，而非差异比较

Git 更像是把数据看作是对小型文件系统的一组快照。每次你提交更新，或在 Git 中保存项目状态时，它主要对当时的全部文件制作一个快照并保存这个快照的索引。为了高效，如果文件没有修改，Git 不再重新存储该文件，而是只保留一个链接指向之前存储的文件。Git 对待数据更像是一个 **快照流**。

![Git 存储项目随时间改变的快照。](https://git-scm.com/book/en/v2/book/01-introduction/images/snapshots.png)Figure 1-5. 存储项目随时间改变的快照.

这是 Git 与几乎所有其它版本控制系统的重要区别。因此 Git 重新考虑了以前每一代版本控制系统延续下来的诸多方面。

### 三种状态

#### Git 有三种状态:

1. 已提交（committed）：已提交表示数据已经安全的保存在本地数据库中
2. 已修改（modified）：已修改表示修改了文件，但还没保存到数据库中
3. 已暂存（staged）：已暂存表示对一个已修改文件的当前版本做了标记，使之包含在下次提交的快照中。

#### Git 项目的三个工作区域：

1. Git 仓库：保存项目的元数据和对象数据库
2. 工作目录：对项目的某个版本独立提取出来的内容。这些从 Git 仓库的压缩数据库中提取出来的文件，放在磁盘上供你使用或修改
3. 暂存区域：一个保存了下次将提交的文件列表信息的文件，一般在 Git 仓库目录中。有时候也被称作“索引”，不过一般说法还是叫暂存区域。

![工作目录、暂存区域以及 Git 仓库。](https://git-scm.com/book/en/v2/book/01-introduction/images/areas.png)Figure 1-6. 工作目录、暂存区域以及 Git 仓库.

#### 基本的 Git 工作流程如下：

1. 在工作目录中修改文件。
2. 暂存文件，将文件的快照放入暂存区域。
3. 提交更新，找到暂存区域的文件，将快照永久性存储到 Git 仓库目录。

如果 Git 目录中保存着的特定版本文件，就属于已提交状态。如果作了修改并已放入暂存区域，就属于已暂存状态。如果自上次取出后，作了修改但还没有放到暂存区域，就是已修改状态。

## More Info

* [gitpro](https://git-scm.com/book/zh/v2/)
* [git - 简明指南](http://rogerdudler.github.io/git-guide/index.zh.html)
