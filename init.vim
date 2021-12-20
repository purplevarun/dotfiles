set number
set backup
set undofile
set swapfile
set backupdir=~\.nvim\backup
set undodir=~\.nvim\undo
set directory=~\.nvim\swap
set laststatus=2
set statusline=%t\ %{mode()}\ %y\ %=%F
set tabline=%!Tabline()

nnoremap y "+y
nnoremap p "+p
nnoremap P "+P
nnoremap x "+x
nnoremap P "+P

vnoremap y "+y
vnoremap p "+p
vnoremap P "+P
vnoremap x "+x
vnoremap P "+P

function! Tabline() abort
    let l:line = ''
    let l:current = tabpagenr()

    for l:i in range(1, tabpagenr('$'))
        if l:i == l:current
            let l:line .= '%#TabLineSel#'
        else
            let l:line .= '%#TabLine#'
        endif

        let l:label = fnamemodify(
            \ bufname(tabpagebuflist(l:i)[tabpagewinnr(l:i) - 1]),
            \ ':t'
        \ )

        let l:line .= '%' . i . 'T' " Starts mouse click target region.
        let l:line .= '  ' . l:label . '  '
    endfor

    let l:line .= '%#TabLineFill#'
    let l:line .= '%T' " Ends mouse click target region(s).

    return l:line
endfunction

