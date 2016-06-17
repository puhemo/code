---
title:  "Git Part 2 - Basics"
date: 2016-06-17
modified: 2016-06-17
published: true
categories: 
  - Git
tags:
  - Git
  - Github
excerpt: |
  Git 基础-获取 Git 仓库
series: "Intro to Git"
---
{% include series.html %}

# Git 基础 

## 获取 Git 仓库

### 在现有目录中初始化仓库
* 初始化 - 项目文件未被跟踪。

  ```git
  $ git init
  ```

* 跟踪文件

  ```git
  $ git add *.c
  $ git add LICENSE
  $ git commit -m 'initial project version'
  ```

### 克隆现有的仓库

获得一份已经存在了的 Git 仓库的拷贝

克隆仓库的命令格式是 `git clone [url]` 。比如，要克隆 Git 的可链接库 libgit2，可以用下面的命令：

```git
$ git clone https://github.com/libgit2/libgit2
```

```
$ git clone https://github.com/libgit2/libgit2 mylibgit #自定义仓库名
```

## 记录每次更新到仓库

![Git 下文件生命周期图。](https://git-scm.com/book/en/v2/book/02-git-basics/images/lifecycle.png)Figure 2-1. 文件的状态变化周期

### 检查当前文件状态

要查看哪些文件处于什么状态，可以用 `git status` 命令。如果在克隆仓库后立即使用此命令，会看到类似这样的输出：

```git
$ git status
On branch master #分支名
nothing to commit, working directory clean 
```

### 跟踪新文件

使用命令 `git add` 开始跟踪一个文件。所以，要跟踪 README 文件，运行：

```git
$ git add README
```

### 暂存已修改文件

```git
$ git add CONTRIBUTING.md
$ git status
On branch master
Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)

    new file:   README
    modified:   CONTRIBUTING.md
```

> 运行了`git add`之后又作了修订的文件，需要重新运行`git add`把最新版本重新暂存起来

### 状态简览

`git status` 命令的输出十分详细，但其用语有些繁琐。如果你使用 `git status -s` 命令或 `git status --short` 命令，你将得到一种更为紧凑的格式输出。运行 `git status -s` ，状态报告输出如下：

```git
$ git status -s
 M README # M: 修改过的文件
MM Rakefile # 
A  lib/git.rb # A: 新添加到暂存区
M  lib/simplegit.rb # M: 修改过的文件
?? LICENSE.txt # ??: 新添加的未跟踪文件
```

### 忽略文件

一般我们总会有些文件无需纳入 Git 的管理，也不希望它们总出现在未跟踪文件列表。通常都是些自动生成的文件，比如日志文件，或者编译过程中创建的临时文件等。在这种情况下，我们可以创建一个名为 `.gitignore` 的文件，列出要忽略的文件模式。来看一个实际的例子：

```ｇｉｔ
$ cat .gitignore
*.[oa]
*~
```

第一行告诉 Git 忽略所有以 `.o` 或 `.a` 结尾的文件。一般这类对象文件和存档文件都是编译过程中出现的。第二行告诉 Git 忽略所有以波浪符（~）结尾的文件，许多文本编辑软件（比如 Emacs）都用这样的文件名保存副本。此外，你可能还需要忽略 log，tmp 或者 pid 目录，以及自动生成的文档等等。要养成一开始就设置好 .gitignore 文件的习惯，以免将来误提交这类无用的文件。

文件 `.gitignore` 的格式规范如下：

- 所有空行或者以 `＃` 开头的行都会被 Git 忽略。
- 可以使用标准的 glob 模式匹配。
- 匹配模式可以以（`/`）开头防止递归。
- 匹配模式可以以（`/`）结尾指定目录。
- 要忽略指定模式以外的文件或目录，可以在模式前加上惊叹号（`!`）取反。

所谓的 glob 模式是指 shell 所使用的简化了的正则表达式。星号（`*`）匹配零个或多个任意字符；`[abc]` 匹配任何一个列在方括号中的字符（这个例子要么匹配一个 a，要么匹配一个 b，要么匹配一个 c）；问号（`?`）只匹配一个任意字符；如果在方括号中使用短划线分隔两个字符，表示所有在这两个字符范围内的都可以匹配（比如 `[0-9]` 表示匹配所有 0 到 9 的数字）。使用两个星号（`*`) 表示匹配任意中间目录，比如`a/**/z` 可以匹配 `a/z`, `a/b/z` 或 `a/b/c/z`等。

我们再看一个 .gitignore 文件的例子：

```
# no .a files
*.a

# but do track lib.a, even though you're ignoring .a files above
!lib.a

# only ignore the TODO file in the current directory, not subdir/TODO
/TODO

# ignore all files in the build/ directory
build/

# ignore doc/notes.txt, but not doc/server/arch.txt
doc/*.txt

# ignore all .pdf files in the doc/ directory
doc/**/*.pdf
```

> Tip: GitHub 有一个十分详细的针对数十种项目及语言的 `.gitignore` 文件列表，你可以在 [https://github.com/github/gitignore](https://github.com/github/gitignore)

### 提交更新

现在的暂存区域已经准备妥当可以提交了。在此之前，请一定要确认还有什么修改过的或新建的文件还没有 `git add` 过，否则提交的时候不会记录这些还没暂存起来的变化。这些修改过的文件只保留在本地磁盘。所以，每次准备提交前，先用 `git status` 看下，是不是都已暂存起来了，然后再运行提交命令 `git commit`：

```git
$ git commit
```

>  这种方式会启动文本编辑器以便输入本次提交的说明。

在 `commit` 命令后添加 `-m` 选项，将提交信息与命令放在同一行，如下所示：

```git
$ git commit -m "Story 182: Fix benchmarks for speed"
[master 463dc4f] Story 182: Fix benchmarks for speed
 2 files changed, 2 insertions(+)
 create mode 100644 README
```

## More Info

* [2.2 Git 基础 - 记录每次更新到仓库](https://git-scm.com/book/zh/v2/Git-%E5%9F%BA%E7%A1%80-%E8%AE%B0%E5%BD%95%E6%AF%8F%E6%AC%A1%E6%9B%B4%E6%96%B0%E5%88%B0%E4%BB%93%E5%BA%93)

{% include series.html %}
