" encoding
set encoding=utf-8 fileencoding=utf-8 termencoding=utf-8

" plugins
call plug#begin('~/.vim/plugged')
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
set tabstop=4 
set softtabstop=4 
set expandtab 
set number 
set mouse=a

" keymaps
let mapleader = ","
nnoremap <C-S> :w <CR>
nnoremap <C-Q> :q <CR>
nnoremap <C-L> :source % <CR>
nnoremap <C-P> :e $MYVIMRC <CR>
nnoremap p "+p
vnoremap y "+y
vnoremap d "_d

" nerdtree settings
let g:NERDTreeWinPos = "right"
nnoremap <C-t> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeIgnore = ['node_modules']

" coc settings
" coc.preferences.formatOnSaveFiletypes": ["*"] -> inside CocConfig
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
