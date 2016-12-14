#!/bin/sh
set -e
PATH="/usr/local/bin:$PATH"
dir="`git rev-parse --git-dir`"
trap 'rm -f "$dir/$$.tags"' EXIT
#git ls-files > "$dir/ctags.files"
git ls-files |
ctags --tag-relative -L - -f"$dir/$$.tags" #--exclude=.git
mv "$dir/$$.tags" "$dir/tags"
#absolute path with $PWD
find $PWD  -name '*.c' -o -name '*.h' > .git/cscope.files
cscope -Rbkq  -i "$dir/cscope.files" -f "$dir/cscope.out" 
