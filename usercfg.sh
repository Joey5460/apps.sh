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
#### Config Git #####
if [ 'git' == $1 ] || [ all == $1 ];
then
	if ! [ -x "$(command -v git)" ]; then
	    $yum_cmd install git
	    fi
    git config --global user.email "zhouyu5460@gmail.com"
    git config --global user.name "fosy"
fi

#### Config VIM ######
echo 'config vim'
if [ 'vim' = $1 ] || [ all == $1 ];
then
    if ! [ -x "$(command -v vim)" ]; then
        sudo $yum_cmd install vim
    fi
    if ! [ -x "$(command -v xclip)" ]; then
		sudo  $yum_cmd install xclip
	fi
    echo "alias vi=vim" >> ~/.bashrc
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

### Config Pip ###
if [ 'pip' = $1 ] || [ all == $1 ];
then
    if ! [ -x "$(command -v pip)" ]; then
        $yum_cmd install pip
    else
        echo "pip installed"
    fi
    pip install shadowsocks
fi

### Config bashrc ###
if [ 'bash' = $1 ] || [ all == $1 ];
then
    echo 'export PATH=~/apps.sh:$PATH' >> ~/.bashrc
    echo 'export PATH=~/apps/qt5/5.5/gcc/bin:$PATH'>>~/.bashrc
    echo 'export PATH=~/apps/qt5/Tools/QtCreator/bin:$PATH'>>~/.bashrc
    echo 'alias notes="cd ~/Documents/notes"'>> ~/.bashrc
fi

### repository###
if [ 'rpmfusion' = $1 ] || [ all == $1 ];
then
#sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
fi
