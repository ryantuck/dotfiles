set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

Plugin 'ambv/black'
Plugin 'dense-analysis/ale'

call vundle#end()


" don't expand tabs for Makefiles
au BufRead,BufNewFile Makefile* set noexpandtab


set autochdir " switch dir
set autoindent
set backspace=2
set clipboard=unnamed
set ignorecase
set incsearch " incremental search
set number " show line nums
set ruler " show r,c in bottom right
set showcmd " show current command


" tab stuff
set expandtab
set shiftwidth=4
set smarttab
set softtabstop=4
set tabstop=4


syntax on


imap jj <Esc>


" don't do something crazy like overwrite the register with whatever
" i just pasted over / substituted / deleted
xnoremap p pgvy
xnoremap d "_d
nnoremap dd "_dd
nnoremap s "_s
vnoremap s "_s


" set custom indentation per filetype
autocmd FileType yaml setlocal shiftwidth=2 | set tabstop=2
autocmd FileType make setlocal noexpandtab shiftwidth=8 softtabstop=0


""highlight trailing whitespace
highlight ErrorMsg ctermbg=magenta ctermfg=white
match ErrorMsg '\s\+$'
