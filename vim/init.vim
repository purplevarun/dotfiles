" purplevarun's vimrc
" plugins
call plug#begin()
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'Jorengarenar/miniSnip'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jiangmiao/auto-pairs'
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'
Plug 'mhinz/vim-startify'
call plug#end()
" ----------------------------------------------------------------------

" encoding
set encoding=utf-8
set fileencoding=utf-8
set termencoding=utf-8
" ----------------------------------------------------------------------

" config
filetype plugin indent on
set title
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
set smarttab
set autoindent
set number
set mouse=a
" ----------------------------------------------------------------------

" keymaps
let mapleader = ","
nnoremap <Home> <S-I><Esc>
nnoremap <End> <S-A><Esc>
inoremap <Home> <Esc><S-I>
inoremap <End> <Esc><S-A>
nnoremap <C-S> :w <CR>
nnoremap <C-Q> :q <CR>
nnoremap <C-L> :source % <CR>
nnoremap <C-B> :call RUN()<CR>
nnoremap <C-P> :e $MYVIMRC <CR>
nnoremap <C-A> ggVG
nnoremap p "+p
vnoremap y "+y
vnoremap d "_d
vnoremap x "+d
" ----------------------------------------------------------------------

" coc setup
inoremap <silent><expr> <c-space> coc#refresh()
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
command! -nargs=0 Prettier :CocCommand prettier.formatFile
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction
" ----------------------------------------------------------------------

" lightline setup
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ }
" ----------------------------------------------------------------------

" nerdtree settings
let g:NERDTreeWinPos = "right"
nnoremap <C-t> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeIgnore = ['node_modules']
autocmd BufWinEnter * NERDTreeMirror
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" ----------------------------------------------------------------------

" some stuff when starting vim w/o arguments
autocmd VimEnter *
    \   if !argc()
    \ |   Startify
    \ |   NERDTree
    \ |   wincmd w
    \ | endif
" ----------------------------------------------------------------------






" setup win2yank for wsl-to-clipboard copy paste
set clipboard+=unnamedplus
let g:clipboard = {
          \   'name': 'win32yank-wsl',
          \   'copy': {
          \      '+': 'win32yank.exe -i --crlf',
          \      '*': 'win32yank.exe -i --crlf',
          \    },
          \   'paste': {
          \      '+': 'win32yank.exe -o --lf',
          \      '*': 'win32yank.exe -o --lf',
          \   },
          \   'cache_enabled': 0,
          \ }
" ----------------------------------------------------------------------
