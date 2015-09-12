#!/bin/sh 

sudo aptitude safe-upgrade
sudo aptitude install vim-gtk git build-essential terminator htop mc ipython openssh-server

printf  "yoav\tALL=(ALL)\tNOPASSWD: ALL\n" >> /etc/sudoers

