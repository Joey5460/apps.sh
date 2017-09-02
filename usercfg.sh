#!/bin/bash
yum_cmd=""
if [ -x "$(command -v apt)" ]; then
   echo "ubuntu-like" 
   yum_cmd="apt"
elif [ -x "$(command -v dnf)" ]; then
   echo "fedora-like"
   yum_cmd="dnf"
fi 
   #eval $yum_cmd -v 
   #$yum_cmd install git
   #git config --global user.email "zhouyu5460@gmail.com"
   #git config --global user.name "fossy"
   #echo "alias vi=vim" >> .bashrc
   #git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
   if ! [ -x "$(command -v pip)" ]; then
     $yum_cmd install pip
 else
     echo "pip installed"
   fi
   
