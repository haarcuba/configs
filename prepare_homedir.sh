#!/bin/sh

TOP=$PWD
#bash
cp bash/.bashrc ~/
sudo cp bash/root.bashrc /root/.bashrc

#terminator
cd ~
mkdir .config/terminator
cp $TOP/terminator/config ~/.config/terminator/config

#vim
cp $TOP/vim/.vimrc ~/
mkdir ~/.vim
cp -af $TOP/vim/.vim/colors ~/.vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/vundle


#tmux
cd $TOP
mkdir -p ~/.tmux/plugins/tpm
cp tmux/.tmux.conf ~/

pip3 install boto3 ipython
