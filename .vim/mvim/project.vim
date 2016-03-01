let s:projects_config = { 
\ 'app-prototype':              '/opt/origami/app-prototype/src/',
\ 'pipeline-ingest':            '/opt/origami/pipeline-ingest/src/',
\ 'connector-api-python':       '/opt/origami/connector-api-python/origami/',
\ 'connector-pipeline-python':  '/opt/origami/connector-pipeline-python/origami/',
\ 'connector-common-python':    '/opt/origami/connector-pipeline-python/origami/',
\ 'platform-api-python':        '/opt/origami/platform-api-python/origami/'
\}


function! ProjGet(name, path)
    if has_key(s:projects_config, a:name)
        return [a:name, s:projects_config[a:name], s:projects_config[a:name].'tags']
    else
        return [a:name, a:path, a:path.'tags']
    endif
endfunction


function! MoveCur()
    if exists('w:main')
        set count = winnr('$')
        call cursor(12,1)
    endif
endfunction


function! ListOfClasses()
    let file = @%
    let s_syntax=&syntax
    bo :vnew
    let &syntax = s_syntax

    execute '%!cat '.file.'| grep class'
    file Content

    setlocal buftype=nofile
    setlocal noswapfile
    vertical res 40

    "map <silent> <buffer> <CR> :bdelete Content<CR>
    map <silent> <buffer> <CR> :call MoveCur()<CR>
endfunction


function! ProjSet(name)
    let g:project = a:name
    let g:project_path = s:projects_config[a:name]
    let &tags = g:project_path.'tags'
endfunction


function! ProjSwitch2()
    bo :new
    setlocal statusline=~
    file Projects

    let main = @%

    setlocal buftype=nofile
    setlocal noswapfile
    resize 5
    let pos = 1
    for [name, path] in items(s:projects_config)
        call setline(pos, name) 
        let pos = pos + 1
    endfor
    "set nomodifiable

    map <silent> <buffer> <CR> :call ProjSet(getline('.'))<CR> :bdelete Projects<CR>
endfunction


function! ProjSwitch()
    let pos = 1
    let projs = ''
    for [name, path] in items(s:projects_config)
        let projs = projs.pos.' '.name.' '
        let pos = pos + 1
    endfor
    let stty_config = system('stty -g -f /dev/tty')
    let p = system('dialog --stdout --menu projects 13 40 13 '.projs)
    silent execute '!stty '.stty_config
    :redraw!
    let p = p - 1
    let item = items(s:projects_config)[p]
    return [item[0], item[1], item[1].'tags']
endfunction


function! ProjLaunch()
    let command = '!DJANGO_SETTINGS_MODULE=origami.settings
                \  PYTHONPATH='.g:project_path.' python %'
    execute command
endfunction

function! ProjLaunchTest()
    let command = '!DJANGO_SETTINGS_MODULE=origami.settings
                \  PYTHONPATH='.g:project_path.' python -m unittest '.expand('%:r')
    execute command
endfunction
