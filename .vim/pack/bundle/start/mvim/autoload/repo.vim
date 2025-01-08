" vim: et

scriptencoding utf-8

function! repo#diff_show()
   " let bufnr = bufadd('someName')
   " call bufload(bufnr)

   " call setbufvar(bufnr, '&buflisted', 1)
   " call setbufvar(bufnr, '&hidden', 1)
   " execute ':noa buffer! +r!git\ show\ master:.vimrc someName | bn'

    " \=strftime('%d-%m-%Y', 1730489904)

    let l:file = expand('%:t')
    let l:path = expand('%:p:h')
    let l:cmd = ':%!git -C '.l:path.' show HEAD:./'.l:file
    let l:bufnr = bufnr('')

    enew
    let l:diffBuf = bufnr('')

    " setbufvar(l:bufnr, 'diffCtx', l:buffBuf)
    file GitDiff
    setlocal noswapfile
    setlocal hidden
    execute l:cmd
    setlocal readonly

    diffthis
    execute 'buffer '.l:bufnr
    "buffer l:bufnr
    diffthis
    setlocal diffopt=context:4
    setlocal foldcolumn=0
    setlocal signcolumn=no

    let b:diffCtx = l:diffBuf
    "set nofoldenable

    "difoff
    "hi DiffAdd      ctermfg=None   ctermbg=DarkBlue          guibg=#ffffff
    "hi DiffChange   gui=none    guifg=NONE          guibg=#e5d5ac
    "hi DiffDelete   gui=bold    guifg=#ff8080       guibg=#ffb0b0
    "hi DiffText     gui=none    guifg=NONE          guibg=#8cbee2
endfunction

function! repo#diff_hide()
    diffoff
    echo b:diffCtx

    "let l:bufnr = getbufvar(bufnr(''), 'diffCtx')
    execute 'bdelete! '.b:diffCtx
endfunction
