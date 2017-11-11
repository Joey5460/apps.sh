set guifont=courier_new
set nocompatible
set autowrite
filetype off
set clipboard=unnamedplus

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"Plugin 'gmarik/Vundle.vim'
Plugin 'VundleVim/Vundle.vim'
Plugin 'kannokanno/previm'
"The following are examples of different formats supported.
"...........................
"plugin on GitHub repo
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'ctrlpvim/ctrlp.vim'

"...........................
"plugin from http://vim-scripts.org.vim.scripts.html

"Plugin 'L9'

"...........................
"Git plugin not hosted on GitHub

Plugin 'https://github.com/scrooloose/nerdtree'
call vundle#end()
syntax on
filetype plugin indent on
set tabstop=4 shiftwidth=4 expandtab 
"nnoremap <space> za
"vnoremap <space> zf


set nu

set foldmethod=syntax
set foldmethod=indent
"set foldlevelstart=1
let javaScript_fold=1    " JavaScript
"function FoldBrace()
"  if getline(v:lnum+1)[0] == '{'
"    return '>1'
"  endif
"  if getline(v:lnum)[0] == '}'
"    return '<1'
"  endif
"  return foldlevel(v:lnum-1)
"endfunction
"set foldexpr=FoldBrace()
"set foldmethod=expr

let g:previm_open_cmd= 'chromium-browser'
augroup PrevimSettings
    autocmd!
    "autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
    autocmd BufNewFile,BufRead *.{rst} set filetype=rst
augroup END

""""""
"session
"
"let g:session_autosave='yes'
"autocmd QuickFixCmdPost [^l]* nested cwindow

""""""""""
"shortcut
"
map <F4> :silent! NERDTreeTabsToggle<CR>
map <F6> :e %<.h<CR>
noremap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
"noremap <F3> :cscope find s <C-r><c-w><cr>
set pastetoggle=<F2>
"autocmd FileType python nnoremap <silent> <F5> :exec '!python' shellscape(@%,1)<CR>
let g:pymode_rope_goto_definition_bind = "<C-]>"
autocmd FileType python noremap <silent> <F5> :!clear;python %<CR>
autocmd FileType c noremap <F7> :wa <CR>: make<CR>
autocmd FileType c noremap <F5> : !make flash <CR>
autocmd FileType cpp noremap <F7> :wa <CR>: make<CR>
autocmd FileType cpp noremap <F5> :wa <CR>: !make run <CR>
autocmd FileType javascript noremap <F5> :wa <CR>: !sh  $PWD/build.sh <CR>
autocmd FileType rst noremap <F7> :wa <CR>: !make <CR>
autocmd FileType rst noremap <F5> :wa <CR>: !make run<CR>
inoremap ,/  </<C-X><C-O>
"autocmd sh !./run.sh

"""""
"ctags
"
set tags+=./tags;~/projs
set path+=~/projs/nSmart/**
vmap <C-c> :<Esc>`>a<CR><Esc>mx`<i<CR><Esc>my'xk$v'y!xclip -selection c<CR>u
