" ----------------------------------------------
" Packages
" ----------------------------------------------
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

Plugin 'ambv/black'
" Plugin 'plasticboy/vim-markdown'
Plugin 'rhysd/vim-gfm-syntax'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'preservim/nerdtree'
Plugin 'evanram/mandevilla'
Plugin 'itchyny/vim-highlighturl'
Plugin 'junegunn/goyo.vim'
Plugin 'flazz/vim-colorschemes'
" Plugin 'ycm-core/YouCompleteMe' "This shit sucks
Plugin 'freitass/todo.txt-vim'
Plugin 'jidn/vim-dbml'
Plugin 'gmarik/vundle'
Plugin 'lepture/vim-jinja'
Plugin 'shmup/vim-sql-syntax'
Plugin 'thalesmello/lkml.vim'
Plugin 'w0rp/ale'

call vundle#end()


" ----------------------------------------------
" Params
" ----------------------------------------------
" NOTE: could prune these

set autoindent
set autochdir " switch dir
set background=dark
set backspace=2
set cindent
set expandtab
set ignorecase
set incsearch " incremental search
set hlsearch "highlight search term
set linebreak
set mouse=a
set nocompatible
set number
set pastetoggle=<F2>
set shiftwidth=4
set showcmd
set smarttab
set softtabstop=4
set tabstop=4
set wildmenu

" helps with system-wide copying
set clipboard=unnamed

" make things faster
set lazyredraw

" spellcheck
set spelllang=en
set spellfile=/Users/ryan/Dropbox/spellfile.en.utf-8.add

syntax on
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on

" Populate ending brace(s), then navigate back to insert mode
" e.g. inoremap x y<Esc>...
" NOTE: would be cool to conditionally do this for underscores
inoremap [[ [[]]<Esc>hi
inoremap {{ {{  }}<Esc>hhi
inoremap {% {%  %}<Esc>hhi

" map things
imap jj <Esc>
imap <C-w><C-w> <Esc><C-w><C-w>
let g:ctrlp_map = '<c-p>'

" this is a good default
colorscheme gruvbox

""highlight whitespace
highlight ErrorMsg ctermbg=magenta ctermfg=white
match ErrorMsg '\s\+$'

" set tabs depending on filetype
autocmd Filetype lkml setlocal shiftwidth=2 | set tabstop=2
autocmd FileType javascript setlocal shiftwidth=2 | set tabstop=2
autocmd FileType yaml setlocal shiftwidth=2 | set tabstop=2
autocmd FileType make setlocal noexpandtab shiftwidth=8 softtabstop=0
autocmd Filetype css setlocal shiftwidth=2 | set tabstop=2

"Remove all trailing whitespace by pressing F5
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

" don't do something crazy like overwrite the register with whatever
" i just pasted over / substituted / deleted
xnoremap p pgvy
xnoremap d "_d
nnoremap dd "_dd
nnoremap s "_s
vnoremap s "_s

" set a big fat line at 88 columns for python and sql files
highlight ColorColumn ctermbg=darkgrey
autocmd Filetype python setlocal cc=88
autocmd Filetype sql setlocal cc=88

" define stuff
autocmd Filetype markdown setlocal columns=80

" Black formatting
let g:black_skip_string_normalization=1

" netrw
let g:netrw_banner = 0
let g:netrw_liststyle = 3

" notes
set suffixesadd+=.md " look for md files when using `gf`
set suffixesadd+=.sql " look for md files when using `gf`
set isfname-=# " ignore # when looking for files using `gf`
set isfname-=+ " ignore # when looking for files using `gf`

" gx broke with a new version of vim
nmap gx yiW:!open <cWORD><CR> <C-r>" & <CR><CR>

" folding by default for markdown files
let g:markdown_folding=1

" go light mode
fu! Light()
    set background=light
    colorscheme Atelier_DuneLight
endfunction
