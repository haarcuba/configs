#!/bin/sh

#bash
cd ~
mkdir work
cd work
git clone git@bitbucket.org:haarcuba/vimconfig.git
cp vimconfig/bash/.bashrc ~/
sudo cp vimconfig/bash/root.bashrc /root/.bashrc

#terminator
cd ~
mkdir .config/terminator
cp ~/work/vimconfig/terminator/config ~/.config/terminator/config

#vim
cp ~/work/vimconfig/vim/.vimrc ~/
mkdir ~/.vim
cp -af ~/work/vimconfig/vim/.vim/colors ~/.vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/vundle
