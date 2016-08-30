" .vimrc
" enable pathogen.vim
" execute pathogen#infect()

" don't create backups
set nobackup

" no compatibility
set nocompatible
set encoding=utf-8

" detect filetype
filetype plugin on

" enable syntax highlighting
syntax enable

" 256 colors
set t_Co=256

" dark solarized scheme
set background=dark

" tabs, indentation, and lines
filetype plugin indent on

" 4-space indentation
set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4

"round indent to nearest multiple of 4
set shiftround

" no line wrapping
set nowrap

" start scrolling slightly before the cursor reaches an edge
set scrolloff=3
set sidescrolloff=5

" scroll sideways a character at a time
set sidescroll=1

" allow motions and back-spacing over line-endings
set backspace=indent,eol,start
set whichwrap=h,l,b,<,>,~,[,]

" underscores denote words
set iskeyword-=_

" show status line
set laststatus=2

" show what mode you're currently in
set showmode

" show what commands you're typing
set showcmd

" allow modelines
set modeline

" show current line and position in file
set ruler

" show file title in terminal tab
set title

" show line numbers
set number

" don't keep results highlighted after searching
set nohlsearch

" only highlight search results as we type
set incsearch

" ignore case when searching
set ignorecase

" don't ignore case in search if we input a capital letter
set smartcase

" show whitespaces
scriptencoding utf-8
set encoding=utf-8
set list listchars=tab:»·,trail:·



""" CUSTOM KEY-BINDINGS

" color scheme
" color codeschool

" open ~/.vimrc
nnoremap <A-v> :split<Space>~/.vimrc<CR>

" window split resizing
noremap <Esc>= :resize<Space>+1<CR>
noremap <Esc>- :resize<Space>-1<CR>
noremap <Esc>+ :vertical<Space>resize<Space>+1<CR>
noremap <Esc>_ :vertical<Space>resize<Space>-1<CR>

" save file
nnoremap <A-s> :w<CR>
inoremap <A-s> <Esc>:w<CR>i

" close window
nnoremap <A-w> :q<CR>
inoremap <A-w> <Esc>:q<CR>

" autoclose parentheses and quotes
inoremap ( ()<Esc>i
inoremap { {}<Esc>i
inoremap [ []<Esc>i
inoremap ' ''<Esc>i
inoremap " ""<Esc>i

" navigation keys in insert mode
" @todo this mappings times out after a few seconds
inoremap <A-h> <Left>
inoremap <A-j> <Down>
inoremap <A-k> <Up>
inoremap <expr> <A-l> EndOfLine() ? '<Esc>a' : '<Right>'

function EndOfLine()
  return col('.') == col('$') && col('.') > 1 
endfunction

" split screen mappings
noremap <A-o> :split<CR>
noremap <A-e> :vsplit<CR>

" map escape sequences to their alt combinations
let c = 'a'
while c <= 'z'
  exec "set <A-".c.">=\e".c
  exec "imap \e".c." <A-".c.">"
  let c = nr2char(1+char2nr(c))
endw
set timeout ttimeoutlen=10



""" PLUGINS

""" NERDTree configurations

" open nerdtree on vim startup if no files is opened
" autocmd vimenter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" hotkey to toggle NERDTree
" map <F2> :NERDTreeToggle<CR>

" close vi if the only open window is NERDTree
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

