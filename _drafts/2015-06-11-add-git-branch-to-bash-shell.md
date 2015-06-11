---
published: true
layout: post
title: Add Git Branch Name to Bash Prompt
categories: ['git', 'source-control', 'github', 'bash']
date: 2015-06-11
---

 https://github.com/jimeh/git-aware-prompt.git
 
 export GITAWAREPROMPT=~/.bash/git-aware-prompt
source $GITAWAREPROMPT/main.sh

export PS1="\${debian_chroot:+(\$debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\] \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\$ "



Install Instructions

mkdir ~/.bash
cd ~/.bash
git clone git://github.com/jimeh/git-aware-prompt.git

