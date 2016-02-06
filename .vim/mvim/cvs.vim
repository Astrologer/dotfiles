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
        call GitUnDo()
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

        call GitUnDo()
        silent call GitAnnotate()
    endif
endfunction
