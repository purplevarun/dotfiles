" purplevarun's init.vim
" ---------------------------------------
call plug#begin()
Plug 'Jorengarenar/miniSnip'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'preservim/nerdcommenter'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'uiiaoo/java-syntax.vim'
Plug 'preservim/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'itchyny/vim-gitbranch'
Plug 'Pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
call plug#end()
" ---------------------------------------
syntax on
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set mouse=a
set incsearch
set nohlsearch
set nobackup
set noundofile
set noswapfile
set backspace=2
set laststatus=2
set statusline=%f\ ~%{Mode()}~\ %y\ %=[%l/%L]\ %F
set noshowmode
set autochdir
set scrolloff=8
set autoread
set number
set splitright
set splitbelow
set tabstop=2
set softtabstop=2
set shiftwidth=2
set autoindent
" ---------------------------------------
let mapleader = ","
let g:rainbow_active = 1
let g:NERDTreeWinPos = "right"
nnoremap <C-S> :w <CR>
nnoremap <C-Q> :q <CR>
nnoremap <C-L> :source % <CR>
nnoremap <C-P> :e $MYVIMRC <CR>
nnoremap <C-B> :!runner % <CR>
nnoremap <C-A> ggVG
nnoremap <C-T> :NERDTreeTabsToggle <CR>
" ---------------------------------------
vnoremap y "+y
vnoremap p "+p
vnoremap P "+P
vnoremap x "+x
nnoremap yy "+yy
nnoremap p "+p
nnoremap P "+P
" ---------------------------------------
command! -nargs=0 Prettier :CocCommand prettier.formatFile
highlight StatusLine ctermbg=red
" ---------------------------------------
function Mode()
	if mode()=="n"
		return "NORMAL"
	elseif mode()=="i"
		return "INSERT"
	elseif mode()=="c"
		return "COMMAND"
	elseif mode()=="v"
		return "VISUAL"
	elseif mode()=="V"
		return "VISUAL-LINE"
	elseif mode()=="R"
		return "REPLACE"
	else
		return mode()
endfunction
" ---------------------------------------
