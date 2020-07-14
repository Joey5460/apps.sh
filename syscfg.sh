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
	else
	    echo "git has been installed"
	fi
    echo "config git"
    git config --global user.email "zhouyu5460@gmail.com"
    git config --global user.name "zhouyu"
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
        git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    fi
    if ! [ -x "$(command -v xclip)" ]; then
		sudo  $yum_cmd install xclip
    fi
    sed -i '/alias vi=vim/d' ~/.bashrc
    echo "alias vi=vim" >> ~/.bashrc
fi


if [ 'v2ray' = $1 ] || [ all == $1 ];
then
	bash <(curl -L -s https://install.direct/go.sh)
fi

### proxychains-ng
if [ 'proxychains' = $1 ] || [ all == $1 ];
then
    if ! [ -x "$(command -v proxychains)" ]; then
        sudo $yum_cmd install proxychains-ng
        sudo sed  -i 's/socks4\s\s127.0.0.1\s9050/socks5 127.0.0.1 1080/g' /etc/proxychains.conf
	#vi /etc/proxychains.conf
    else
        echo "proxychains exists"
    fi
fi

### bash ###
if [ 'bash' = $1 ] || [ all == $1 ];
then
    sed -i '/export PATH=~\/apps.sh:$PATH/d'  ~/.bashrc
    sed -i '/alias notes="cd ~\/Documents\/notes"/d' ~/.bashrc
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
    sed -i '/export ANDROID_HOME=~\/apps\/sdk-tools-linux/d' ~/.bashrc
    sed -i '/export ANDROID_NDK_ROOT=$ANDROID_HOME\/ndk-bundle/d' ~/.bashrc
    sed -i '/export ANDROID_SDK_ROOT=$ANDROID_HOME/d' ~/.bashrc
    sed -i '/export JAVA_HOME=\/usr\/lib\/jvm\/java-openjdk/d' ~/.bashrc
    sed -i '/export PATH=$ANDROID_HOME\/tools:$ANDROID_HOME\/platform-tools:$PATH/d' ~/.bashrc
    echo 'export ANDROID_HOME=~/apps/sdk-tools-linux'>>~/.bashrc
    echo 'export ANDROID_NDK_ROOT=$ANDROID_HOME/ndk-bundle'>>~/.bashrc
    echo 'export ANDROID_SDK_ROOT=$ANDROID_HOME'>>~/.bashrc
    echo 'export JAVA_HOME=/usr/lib/jvm/java-openjdk'>>~/.bashrc
    echo 'export PATH=$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$PATH'>>~/.bashrc
    #export JAVA_HOME=/usr/lib/jvm/java-openjdk
    #export ANDROID_NDK_ROOT=$ANDROID_HOME/ndk-bundle
    #export ANDROID_SDK_ROOT=$ANDROID_HOME

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
    sed -i '/QTVER=5.15.0/d' ~/.bashrc
    sed -i '/export PATH=~\/apps\/qt5\/$QTVER\/gcc_64\/bin:$PATH/d' ~/.bashrc
    sed -i '/export PATH=~\/apps\/qt5\/Tools\/QtCreator\/bin:$PATH/d' ~/.bashrc
    sed -i '/alias qmakeandroid=~\/apps\/qt5\/$QTVER\/android\/bin\/qmake/d' ~/.bashrc
    echo 'QTVER=5.15.0'>>~/.bashrc
    echo 'export PATH=~/apps/qt5/$QTVER/gcc_64/bin:$PATH'>>~/.bashrc
    echo 'export PATH=~/apps/qt5/Tools/QtCreator/bin:$PATH'>>~/.bashrc
    echo 'alias qmakeandroid=~/apps/qt5/$QTVER/android/bin/qmake'>>~/.bashrc

    sudo dnf install  mesa-libGL-devel
fi

### youtube
if [ 'youtube' = $1 ] || [ all == $1 ];
then
    pip install --upgrade --user youtube-dl
fi

### chromium 
if [ 'chromium' = $1 ] || [ all == $1 ];
then
    sudo dnf install chromium
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
