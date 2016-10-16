let s:grev = ''
let s:groot = system('git rev-parse --show-toplevel')[:-2].'/'
let s:gfile = '%'


function! GetGitBranch()
    let p = split(system('pwd')[:-2], '/')
    let git_branch = system('git symbolic-ref --short HEAD')[:-2]
    if git_branch[:4] == 'fatal' || git_branch == ''
        return ''
    endif
    return git_branch
endfunction


function! GetGitProject()
    let git_root = system('git rev-parse --show-toplevel')[:-2].'/'
    if git_root[:4] == 'fatal' || git_root == '/'
        return ['./', '*']
    endif
    return [git_root, split(git_root, '/')[-1]]
endfunction


function! s:GitUnDo()
    let s:gapos = getpos('.')
    undo
    call setpos('.', s:gapos)
    unlet s:gapos
endfunction


function! GitAnnotate()
    if exists('s:gapos')
        call s:GitUnDo()
        let s:gfile = '%'
        let s:grev = ''
    else
        let s:gapos = getpos('.')
        execute ':%! git --no-pager blame '.s:grev.' '.s:gfile.' | sed s/\\s*[+-]0[0-9]00\\s*/\ /'
        call setpos('.', s:gapos)

    endif
endfunction


function! GitNext()
    if exists('s:gapos')
        let line = split(getline('.'), ' ')
        let s:grev = line[0].'~1 --'
        if line[1][0] != '('
            let s:gfile = s:groot.line[1]
        endif

        call s:GitUnDo()
        silent call GitAnnotate()
    endif
endfunction


function! GitBlame()
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
    let &syntax = l:file_syntax

    let b:file_buffer = l:file_buffer
    let b:file_name = l:file_name
    let b:file_path = l:file_path
    let b:git_root =  ':%! cd '.l:file_path.'; git --no-pager blame '.l:file_name

    map <silent> <buffer> <CR> :exe 'b ' b:file_buffer <CR>:bdelete Git<CR>
    map <silent> <buffer> i :call GitShow()<CR>
    map <silent> <buffer> h :call GitLastRev()<CR>
    map <silent> <buffer> d :call GitNextRev()<CR>

    exe b:git_root
    call setpos('.', l:file_pos)
endfunction


function! GitShow()
    let line = split(getline('.'), ' ')
    let rev = line[0]
    let l:base_buffer = bufnr('%')

    enew
    file Commit_Info
    setlocal statusline=~
    setlocal buftype=nofile
    setlocal noswapfile
    let b:base_buffer = l:base_buffer

    set syntax=diff
    map <silent> <buffer> <CR> :exe 'b ' b:base_buffer<CR>:bdelete Commit_Info<CR>

    execute ':%! git show '.rev
endfunction


function! GitNextRev()
    let l:line = split(getline('.'), ' ')
    let l:rev = l:line[0].'~1 --'
    "if l:line[1][0] != '('
    "    let s:gfile = s:groot.line[1]
    "endif

    let l:file_pos = getpos('.')
    exe ':%! cd '.b:file_path.'; git --no-pager blame ' l:rev ' ' b:file_name
    call setpos('.', l:file_pos)
endfunction


function! GitLastRev()
    let l:file_pos = getpos('.')
    exe ':%! cd '.b:file_path.'; git --no-pager blame'  b:file_name
    call setpos('.', l:file_pos)
endfunction
