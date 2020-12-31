" Enable file type detection and do language-dependent indenting
filetype plugin indent on

" Appearance Config
" =================

syntax enable                           " Turn on syntax highlighting
set t_Co=256                            " Use 256 colors in vim


" Sanity Config
" =============

set nocompatible                        " Use vim rather than vi settings
set encoding=utf-8                      " Standard encoding
set number                              " It's nice to see line numbers
set backspace=indent,eol,start          " Allow backspace in insert mode
set autoread                            " Reload files changed outside vim
set hidden                              " Buffers can exist in the background, don't limit to 1 file per window/split
set history=1000                        " By default, vim saves the last 8 commands, but we can handle more


" General Config
" ==============

let mapleader=","                       " Replace leader key (the key that acts as a namespace to custom keybindings)
set showcmd                             " Show incomplete command keystrokes at the bottom-right corner
set laststatus=2                        " Always show the status line
set splitright                          " Open vertical split to the right of current window
set splitbelow                          " Open horizontal split below the current window
set shell=zsh


" Style Config
" ============

set fillchars+=vert:│
hi VertSplit cterm=NONE ctermbg=NONE ctermfg=Cyan


" Search Config
" =============

set incsearch                           " Highlight next search match while still typing the pattern
set hlsearch                            " Highlight search matches by default


" Turn Off Swap Files
" ===================

set noswapfile                          " Don't create swap files


" Indentation and Display
" =======================

set autoindent                          " Copy indentation in current line to new line
set smartindent                         " Auto-adjust indentation when going in or out code blocks
set expandtab                           " Use spaces for indentation
set tabstop=4                           " Number of spaces that a tab counts for
set softtabstop=4                       " Number of spaces that a tab counts for when performing editing operations
set shiftwidth=4                        " Number of spaces to use for each auto-indent step

set list listchars=tab:\»\ ,trail:·     " Display tabs and trailing spaces visually
set nowrap                              " Don't wrap lines


" Scrolling
" =========

set scrolloff=5                         " Keep this number of lines above/below the cursor when scrolling vertically
set sidescrolloff=5                     " Keep this number of columns to the left/right of cursor when scrolling horizontally
set sidescroll=1                        " How many columns to scroll horizontally
set ruler                               " Show cursor position and relative position in file


" Setup netrw, builtin file explorer
" https://shapeshed.com/vim-netrw/
" ==================================

let g:netrw_winsize=25                  " Set the size of the netrw window
let g:netrw_liststyle=3                 " Display tree-view
let g:netrw_sort_sequence='[\/]$,*'     " Sort by directories on top, followed by files
let g:netrw_browse_split=1              " Open files in horizontal split
let g:netrw_banner=0                    " Remove the banner on top


" Setup tcomment plugin for easy comment/uncomment
" ================================================

noremap <silent> <Leader>cc :TComment<CR>


" Setup lightline status line
" ===========================

set noshowmode


" Plug configs
" https://github.com/junegunn/vim-plug
" ====================================

call plug#begin('~/.vim/plugged')

Plug 'tomtom/tcomment_vim'
Plug 'itchyny/lightline.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'airblade/vim-gitgutter'

call plug#end()
