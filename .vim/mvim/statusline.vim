" g:git_branch
" g:project

function! SetStatusLine()
    set laststatus=2
    set statusline=%{'\ '}%f
    set statusline+=%6{'cvs:\ '}%{'['.g:project.']\ '.g:git_branch}
    set statusline+=%{'\ '}%r%m
    set statusline+=%=%l[%L],%-6v
    set statusline+=%P
endfunction
