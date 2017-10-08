# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
alias vi=vim
alias nsle="cd ~/projs/nSmart/projs/ble_peripheral/nSmart"
alias ezle="cd ~/projs/ezle/projs/ble_peripheral"
alias iotbox="cd ~/projs/iotbox"
alias notes="cd ~/Documents/notes"

export ANDROID_HOME=~/apps/android-sdk-linux
export PATH=$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$PATH
export PATH=~/apps/nrf5/tools/nrfjprog:/opt/SEGGER/JLink:$PATH
export PATH=~/apps/nrf5/tools/mergehex:$PATH
export PATH=~/apps.sh:$PATH
export PATH=~/apps/qt5/5.5/gcc/bin:$PATH
export PATH=~/apps/qt5/Tools/QtCreator/bin:$PATH
export PATH=/home/xFrog/projs/ve_projs/bin:$PATH
#export PATH=/usr/local/gcc-arm-none-eabi-4_9-2015q1/bin:$PATH
export CSCOPE_EDITOR=`which vim`
export NRF51_SDK_PATH=~/projs/nrf_sdk_11/
