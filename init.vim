call plug#begin()
Plug 'tpope/vim-fugitive'
Plug 'mattn/emmet-vim'
Plug 'mxw/vim-jsx'
Plug 'elzr/vim-json'
Plug 'tpope/vim-markdown'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'jiangmiao/auto-pairs'
Plug 'itchyny/lightline.vim'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'itchyny/vim-gitbranch'
call plug#end()

set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
syntax on
filetype plugin on
let mapleader=","
cd ~\Desktop

set wrap
set noshowmode
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab
set relativenumber
set nohlsearch
set autochdir
set autoread
set incsearch
"set statusline=%f\ %{Mode()}\ %y\ %=%l/%L
set autoindent

vnoremap y "+y
nnoremap yy "+yy
vnoremap x "+x

nnoremap p "+p
nnoremap P "+P
vnoremap p "+p
vnoremap P "+P

nnoremap <C-A> ggVG
nnoremap <C-B> :!runner %<CR>
nnoremap <C-F> :call Format()<CR>
nnoremap <C-T> :NERDTreeTabsToggle<CR>

function! Format()
	if &filetype=="cpp"
		exec "!astyle -A2 -T -j % && rm -rf *.orig"
	elseif &filetype=="html" || &filetype=="css" || &filetype=="js"
		exec "!prettier --use-tabs --tab-width 4 --write %"
	elseif &filetype=="javascript.jsx" || &filetype=="json"
		exec "!prettier --use-tabs --tab-width 4 --write %"
	else
		exec "echo hey hey"
	endif
endfunction
function! Mode()
	if mode()=="n"
		return "NORMAL"
	elseif mode()=="c"
		return "COMMAND"
	elseif mode()=="i"
		return "INSERT"
	elseif mode()=="v"
		return "VISUAL"
	elseif mode()=="V"
		return "VISUAL-LINE"
	else
		return mode()
endfunction
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ }
