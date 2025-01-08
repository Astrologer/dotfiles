" vim: et

scriptencoding utf-8


let s:commands = {
    \ 'info': 'git show %r',
    \ 'show': 'git -C %p show HEAD:./%f',
    \ 'blame': 'git -C %p --no-pager blame -e %r %f'
    \}


function! cvs#show()
    let l:file = expand('%:t')
    let l:path = expand('%:p:h')

    let cmd = s:commands['show']
    let cmd = substitute(cmd, '%f', l:file, 'g')
    let cmd = substitute(cmd, '%p', l:path, 'g')
    return systemlist(cmd)
endfunction


function! cvs#blame(file_path, file_name)
    let cmd = s:commands['blame']
    let cmd = substitute(cmd, '%f', a:file_name, 'g')
    let cmd = substitute(cmd, '%p', a:file_path, 'g')
    let cmd = substitute(cmd, '%r', '', 'g')
    return systemlist(cmd)
endfunction


function! cvs#info(rev)
    let l:cmd = s:commands['info']
    let l:cmd = substitute(l:cmd, '%r', a:rev, 'g')
    return systemlist(cmd)
endfunction

" echo matchlist("ff14fc42 (Denis 2016-02-06 16:02:39 +0300  4) function! SetStatusLine()", '^\(\w\+\) (\(\w\+\) \(.*\)) \(.*\)')
function! cvs#bs(file_path, file_name)
    let l:result = []
    let l:context = []

    for l:line in cvs#blame(a:file_path, a:file_name)
        let l:tokens = matchlist(l:line, '^\v(\w+) \((\<[a-zA_Z@\.-_]+\>)\s+([0-9-]+) ([0-9:]+) [0-9+-]+\s+\d+\) (.*)')
        let l:z = '('.l:tokens[1].' '.l:tokens[3].' '.l:tokens[4].') '.l:tokens[5]
        call add(l:result, l:z)
        call add(l:context, l:tokens[1])

        "call add(l:result, l:line)
        "call add(l:result, l:tokens)
    endfor

    let b:context = l:context
    return l:result
endfunction

function! cvs#blame_show()
    let l:file_name = expand('%:t')
    let l:file_path = expand('%:p:h')
    let l:file_pos = getpos('.')
    let l:file_buffer = bufnr('%')
    let l:file_syntax = &syntax

    enew
    file Git
    setlocal statusline=~
    setlocal buftype=nofile
    setlocal noswapfile
    setlocal hidden
    setlocal cursorline
    let &syntax = l:file_syntax

    let b:file_buffer = l:file_buffer
    map <silent> <buffer> <CR> :exe 'b ' b:file_buffer <CR>:bdelete Git<CR>
    map <silent> <buffer> i :call cvs#info_show()<CR>
    "map <silent> <buffer> h :call GitLastRev()<CR>
    "map <silent> <buffer> d :call GitNextRev()<CR>

    call setline(1, cvs#bs(l:file_path, l:file_name))

    call setpos('.', l:file_pos)
endfunction

function! cvs#info_show()
    let l:pos = line('.')
    let l:rev = b:context[l:pos]
    let l:base_buffer = bufnr('%')

    " §setlocal hidden
    enew
    file Commit_Info
    setlocal statusline=~
    setlocal buftype=nofile
    setlocal noswapfile
    setlocal syntax=diff
    let b:base_buffer = l:base_buffer

    map <silent> <buffer> <CR> :exe 'b ' b:base_buffer<CR>:bdelete Commit_Info<CR>

    call setline(1, cvs#info(l:rev))
    setlocal readonly
endfunction
