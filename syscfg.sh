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
function gitcfg
{
	if ! [ -x "$(command -v git)" ]; then
	    $yum_cmd install git
	fi
    echo "config git"
    git config --global user.email "zhouyu5460@gmail.com"
    git config --global user.name "fossy"
    git config --global merge.tool "vimdiff"
}
if [ 'git' == $1 ] || [ all == $1 ];
then
    gitcfg
fi



#### Config VIM ######
if [ 'vim' = $1 ] || [ all == $1 ];
then
	echo 'config vim'
    if ! [ -x "$(command -v vim)" ]; then
        sudo $yum_cmd install vim
    fi
    if ! [ -x "$(command -v xclip)" ]; then
		sudo  $yum_cmd install xclip
	fi
    echo "alias vi=vim" >> ~/.bashrc
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    #cat vimrc >>~/.vimrc
fi

### pip3 ###
if [ 'pip' = $1 ] || [ all == $1 ];
then
    if ! [ -x "$(command -v pip3)" ]; then
        $yum_cmd install pip3
    else
        echo "pip3 installed"
    fi
fi

if [ 'shadowsocks' = $1 ] || [ all == $1 ];
then
    if ! [ -x "$(command -v sslocal)" ]; then
	    pip3 install --user  shadowsocks
    else
        echo "shadowsocks is installed already"
    fi
fi

### proxychains-ng
if [ 'proxychains' = $1 ] || [ all == $1 ];
then
    if ! [ -x "$(command -v proxychains)" ]; then
        sudo $yum_cmd install proxychains-ng
	#vi /etc/proxychains.conf
    else
        echo "proxychains exists"
    fi
fi


### bash ###
if [ 'bash' = $1 ] || [ all == $1 ];
then
    echo 'export PATH=~/apps.sh:$PATH' >> ~/.bashrc
    echo 'alias notes="cd ~/Documents/notes"'>> ~/.bashrc
fi


### cordova####
if [ 'cordova' = $1 ] || [ all == $1 ];
then
    if ! [ -x "$(command -v npm)" ]; then
        sudo $yum_cmd install nodejs
    fi

    if ! [ -x "$(command -v cordova)" ]; then
        sudo npm install -g cordova
    fi
    echo 'export ANDROID_HOME=~/apps/sdk-tools-linux'>>~/.bashrc
    echo 'export PATH=$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$PATH'>>~/.bashrc
fi

if [ 'android' = $1 ] || [ all == $1 ];
then
    echo 'export ANDROID_HOME=~/apps/sdk-tools-linux'>>~/.bashrc
    echo 'export PATH=$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$PATH'>>~/.bashrc
fi

### repository###
# sudo dnf install ffmpeg
if [ 'rpmfusion' = $1 ] || [ all == $1 ];
then
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
fi

###develop tools###
function  gcccfg
{
    if ! [ -x "$(command -v g++)" ]; then
        sudo dnf install gcc-c++
    else
        echo "gcc has been installed"
    fi
}
function makecfg
{
    if ! [ -x "$(command -v make)" ]; then
        sudo dnf install make
    else
        echo "make has been installed"
    fi
}
if [ 'dev' = $1 ] || [ all == $1 ];
then
    gcccfg
    makecfg
    #sudo dnf install kernel-devel kernel-headers
fi
### QT####
if [ 'qt' = $1 ] || [ all == $1 ];
then
    gcccfg
    makecfg
    echo 'export PATH=~/apps/qt5/5.5/gcc_64/bin:$PATH'>>~/.bashrc
    echo 'export PATH=~/apps/qt5/Tools/QtCreator/bin:$PATH'>>~/.bashrc
    sudo dnf install  mesa-libGL-devel
fi

