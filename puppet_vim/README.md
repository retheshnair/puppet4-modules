# puppet_vim

#### Table of Contents

1. [Description](#description)
1. [Setup - The basics of getting started with puppet_vim](#setup)
    * [What puppet_vim affects](#what-puppet_vim-affects)

## Description

This module is designed to work on NIX based systems to ensure that vim-enhanced is installed ans the correct syntax and indenting files have been added for vim to play nicely with vim.

This has been tested on Solaris 11.2, Ubuntu 14.04, CentOS 6.7 and CentOS 7.2. The module will add syntax and indenting files for vim to their system locations represented by the default $VIM. 

## Files
### RedHat
* Files added to subdirs in /usr/share/vim/vim74
* /etc/vimrc replaced with an orginal copy with additons

### Debian
* Files added to subdirecories in /etc/vim
* New /etc/vim/vimrc.local created

### Solaris
* Files added to subdirs in /usr/share/vim/vim73
* /usr/share/vim/vimrc created

The module will also intall **vim** on Ununtu and **vim-enhanced** on CentOS. Make sure you use the command vim on CentOS and not vi.

