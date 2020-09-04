set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

Plugin 'ambv/black'

call vundle#end()

set autoindent
set autochdir " switch dir
set backspace=2
set ignorecase
set incsearch " incremental search
set number
set clipboard=unnamed

" tab stuff
set expandtab
set shiftwidth=4
set smarttab
set softtabstop=4
set tabstop=4

syntax on


" don't do something crazy like overwrite the register with whatever
" i just pasted over / substituted / deleted
xnoremap p pgvy
xnoremap d "_d
nnoremap dd "_dd
nnoremap s "_s
vnoremap s "_s
