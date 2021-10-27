" encoding
set encoding=utf-8 fileencoding=utf-8 termencoding=utf-8

" plugins
call plug#begin('~/.vim/plugged')
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'itchyny/vim-gitbranch'
Plug 'preservim/nerdtree'
Plug 'itchyny/lightline.vim'
Plug 'preservim/nerdcommenter'
Plug 'Jorengarenar/miniSnip'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'mattn/emmet-vim'
Plug 'neoclide/coc-emmet'
call plug#end()

" config
set noswapfile
set nobackup
set noundofile
set splitright
set splitbelow
set wrap
set linebreak
set noshowmode
set incsearch
set nohlsearch
set scrolloff=8
set autochdir
set autoread
set history=5
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set number
set mouse=a

" keymaps
let mapleader = ","
nnoremap <Home> <Esc><S-I>
nnoremap <End> <Esc><S-A>
inoremap <Home> <Esc><S-I>
inoremap <End> <Esc><S-A>
nnoremap <C-S> :w <CR>
nnoremap <C-Q> :q <CR>
nnoremap <C-L> :source % <CR>
nnoremap <C-P> :e $MYVIMRC <CR>
nnoremap p "+p
vnoremap y "+y
vnoremap d "_d
vnoremap x "+d

" nerdtree settings
let g:NERDTreeWinPos = "right"
nnoremap <C-t> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeIgnore = ['node_modules']

" coc settings
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" lightline settings
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ }

" some git shortcuts
nnoremap <C-G> :!git add . && git commit -am % <CR>
nnoremap <C-H> :!git push <CR>

" code runner shortcuts
nnoremap <C-B> :call Run() <CR>
function Run()
  silent exec "!touch in"
  if &filetype == 'cpp'
    exec "!g++ -std=c++17 -Wl,--stack,536870912 % && a < in && del a.exe"
  elseif &filetype == 'javascript.jsx'
    exec "!node % < in"
  elseif &filetype == 'python'
    exec "!python % < in"
  elseif &filetype == 'java'
    exec "!java % < in"
  elseif &filetype == 'sql'
    exec "!mysql -u root --table < %"
  endif
endfunction
