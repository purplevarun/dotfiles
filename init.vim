" encoding
set encoding=utf-8 fileencoding=utf-8 termencoding=utf-8

" plugins
call plug#begin('~/.vim/plugged')
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
set noswapfile nobackup noundofile splitright splitbelow wrap linebreak noshowmode incsearch nohlsearch scrolloff=8 autochdir autoread history=5 tabstop=4 softtabstop=4 expandtab number mouse=a

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

" coc settings
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
command! -nargs=0 Prettier :CocCommand prettier.formatFile
