# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
alias vi=vim
export PATH=~/apps.sh:$PATH
alias notes="cd ~/Documents/notes"
alias x66="cd ~/projs/x66gui/Test/views && vi main.cpp"
alias resources="cd ~/projs/x66gui/Application/Resource/GUI_UI_Design/Horizontal"
alias 2tbbt="vi ~/Documents/notes/dict/tbbt/2-tbbt.rst"
alias 3tbbt="vi ~/Documents/notes/dict/tbbt/3-tbbt.rst"
alias 6tbbt="vi ~/Documents/notes/dict/tbbt/6-tbbt.rst"
alias 9tbbt="vi ~/Documents/notes/dict/tbbt/9-tbbt.rst"
alias 10tbbt="vi ~/Documents/notes/dict/tbbt/10-tbbt.rst"
alias 11tbbt="vi ~/Documents/notes/dict/tbbt/11-tbbt.rst"
alias 12tbbt="vi ~/Documents/notes/dict/tbbt/12-tbbt.rst"
alias war3="vi ~/Documents/notes/dict/war3.rst"
alias limit-render="cd ~/Documents/x66doc/renders/limits && xdg-open AlarmLimits_Selected_Pv.bmp"
alias selftest-render="cd ~/Documents/x66doc/renders/selftest && xdg-open 1sort.bmp"
alias cali-render="cd ~/Documents/x66doc/renders/cali&& xdg-open 1sort_pv.bmp"
alias nsk="vi ~/projs/odoo-dev/custom-addons/todo_app/views/todo_view.xml"
#QTVER=5.5
QTVER=5.10.1
#QTVER=5.11.2
#QTVER=5.12.1
export PATH=~/apps/qt5/$QTVER/gcc_64/bin:$PATH
#export QT_QPA_PLATFORM_PLUGIN_PATH=~/apps/qt5/$QTVER/gcc_64/plugins
#export QT_QPA_PLATFORM=wayland
#export LD_LIBRARY_PATH=~/apps/qt5/$QTVER/gcc_64/lib
#export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:~/apps/qt5/Tools/QtCreator/lib/Qt/lib

#export QT_DEBUG_PLUGINS=1
export PATH=~/apps/qt5/Tools/QtCreator/bin:$PATH
export PATH=/usr/local/musl/bin:$PATH
export PATH=~/projs/mxe/usr/bin:$PATH

export CPATH=/usr/local/cuda/include:$CPATH
export X66=xcomment
export EDITOR=vi
alias vi=vim
