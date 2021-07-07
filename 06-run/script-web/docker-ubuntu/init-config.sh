#!/bin/bash

uname -a

# git
git config --global core.autocrlf input
git config --global user.name "huhongjun"
git config --global user.email  "136114837@qq.com"
git config -l

alias setps='export PS1="\[\e]0;\u@\h: \W\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]\$"'
