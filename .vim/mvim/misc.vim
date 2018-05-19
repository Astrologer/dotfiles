function! ResCur()
    if line("'\"") <= line("$")
        normal! g`" 
        return 1
    endif
endfunction


if has("terminfo")
    syntax on
endif

filetype indent plugin on

augroup resCur
    autocmd!
    autocmd BufWinEnter * call ResCur()
augroup END 
