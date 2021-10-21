set encoding=utf-8
set fileencoding=utf-8
set termencoding=utf-8
cd ~/Desktop
call plug#begin('~/.vim/plugged')
Plug 'itchyny/lightline.vim'
Plug 'morhetz/gruvbox'
Plug 'preservim/nerdcommenter'
Plug 'preservim/nerdtree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'Jorengarenar/miniSnip'
call plug#end()
syntax on
filetype on
set autochdir
set number
set splitright
set splitbelow
set laststatus=2
set backspace=2
set tabstop=4
set softtabstop=4
set expandtab
set wrap
set linebreak
set nobackup
set noswapfile
set noundofile
set guioptions=
set guicursor=a:blinkoff0
set guifont=FiraCode_NF:h12
set incsearch
set nohlsearch
set noshowmode
color gruvbox
command! -nargs=0 Prettier :CocCommand prettier.formatFile
nnoremap <C-S> :w <CR>
nnoremap <C-Q> :q <CR>
nnoremap <C-P> :e $MYVIMRC <CR>
nnoremap <C-L> :source % <CR>
nnoremap <C-Tab> <C-W><C-W>
nnoremap <C-T> :NERDTreeToggle <CR>
nnoremap p "+p
vnoremap y "+y
vnoremap d "_d
