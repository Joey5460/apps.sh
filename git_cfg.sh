#!/bin/sh
git config --global init.templatedir '~/.git_template'
git config --global alias.ctags '!.git/hooks/cstags.sh'
mkdir -p ~/.git_template/hooks
cp cstags.sh post-commit ~/.git_template/hooks/

