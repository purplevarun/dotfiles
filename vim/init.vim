" encoding
set encoding=utf-8 fileencoding=utf-8 termencoding=utf-8
cd ~\Desktop

" plugins
call plug#begin()
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'preservim/nerdcommenter'
Plug 'Jorengarenar/miniSnip'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'mattn/emmet-vim'
Plug 'morhetz/gruvbox'
call plug#end()
color gruvbox

" config
set noswapfile
set nobackup
set noundofile
set splitright
set splitbelow
set nowrap
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
nnoremap <Home> <S-I><Esc>
nnoremap <End> <S-A><Esc>
inoremap <Home> <Esc><S-I>
inoremap <End> <Esc><S-A>
nnoremap <C-S> :w <CR>
nnoremap <C-Q> :q <CR>
nnoremap <C-L> :source % <CR>
nnoremap <C-P> :e $MYVIMRC <CR>
nnoremap <C-B> :!runner % <CR>
nnoremap <C-A> ggVG
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
autocmd BufWinEnter * NERDTreeMirror
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif


" coc settings
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" airline settings
let g:airline_powerline_fonts = 1
