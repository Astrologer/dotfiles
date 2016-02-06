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
set foldmethod=marker
set foldmethod=indent
set nofoldenable
set number
set clipboard=unnamed
"set clipboard=unnamedplus
"colorscheme torte
let g:pyflakes_use_quickfix = 0

exec 'source ~/.vim/mvim/misc.vim'
exec 'source ~/.vim/mvim/colorscheme.vim'
exec 'source ~/.vim/mvim/statusline.vim'
exec 'source ~/.vim/mvim/keybind.vim'
exec 'source ~/.vim/mvim/project.vim'
exec 'source ~/.vim/mvim/cvs.vim'

let [g:project_path, g:project] = GetGitProject()
let [g:project, g:project_path, &tags] = ProjGet(g:project, g:project_path)
let g:git_branch = GetGitBranch()
call SetStatusLine()

"some development integration
map <F2> :IPython --existing vim.json<CR>
map <F5> :call GitAnnotate()<CR>
map <F6> :call GitNext()<CR>

map Z :call ProjLaunch()<CR>
"map <F9> :let [g:project, g:project_path, &tags] = ProjSwitch()<CR>
map <silent> <F9> :call ProjSwitch2()<CR>
