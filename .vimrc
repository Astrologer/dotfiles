set ts=4
set bs=2
set textwidth=10000
set nobackup
set hlsearch
set noincsearch
set ruler
set showmatch
set nowrap
set expandtab
"set tags=tags,../tags
set shiftwidth=4
"set foldmethod=marker
set foldmethod=indent
set nofoldenable
set number
set clipboard=unnamed
"set clipboard=unnamedplus
"colorscheme torte
set list
"set relativenumber

"colorscheme torte
colorscheme custom

set foldcolumn=0

set wildmenu
set wildmode=full
set wildoptions=pum
"set wildoptions+=fuzzy

exec 'source ~/.vim/mvim/misc.vim'
"exec 'source ~/.vim/mvim/colorscheme.vim'
exec 'source ~/.vim/mvim/statusline.vim'
exec 'source ~/.vim/mvim/keybind.vim'
exec 'source ~/.vim/mvim/project.vim'
exec 'source ~/.vim/mvim/cvs.vim'

let [g:project_path, g:project] = GetGitProject()
let [g:project, g:project_path, &tags] = ProjGet(g:project, g:project_path)
let g:git_branch = GetGitBranch()
call SetStatusLine()
cd `=g:project_path`

"some development integration
map <F2> :IPython --existing vim.json<CR>
map <F5> :call GitAnnotate()<CR>
map <F6> :call GitNext()<CR>
map <leader>a :call GitBlame()<CR>
map <silent> <leader>o :call FilesTree()<CR>

map Zt :call ProjLaunchTest()<CR>
map Zs :call ProjLaunch()<CR>
"map <F9> :let [g:project, g:project_path, &tags] = ProjSwitch()<CR>
map <silent> <F9> :call ProjSwitch2()<CR>
autocmd BufNewFile,BufRead *.qml   set syntax=java
"func Hh(channel, msg)
"    echo 'from the handler: ' . a:msg
"endfunc

"let logjob = job_start("tail -f /tmp/log", {'out_io': 'buffer', 'out_name': 'dummy'})
"let job = job_start(["/bin/bash"], {"out_cb": 'Hh'})

"let job = job_start("bash", {'out_io': 'buffer', 'out_name': 'dummy'})
"let ch = job_getchannel(job)
"call ch_sendraw(ch, "ls\n")

"call popup_create(['aasd asd adssa', ' asdfasdfasdf asdfbb'], #{  border: [], cursorline: 1, padding: [0,1,0,1], filter
"    : 'popup_filter_menu', title: 'Project'})

map <leader>d :call repo#diff_show()<CR>
map <leader>q :call repo#diff_hide()<CR>


map <leader>b :call cvs#blame_show()<CR>


"scalac-2.13 -Ystop-after:packageobjects %f
