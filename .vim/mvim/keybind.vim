ca W w
ca Q q
ca WQ wq
ca wQ wq
ca Wq wq

map <F11> :%s/\s*$// <CR>

"Change encoding
"map ! :e ++enc=8bit-koi8-r <CR> :echo &fenc <CR>
"map @ :e ++enc=cp1251 <CR> :echo &fenc <CR>
"map # :e ++enc=2byte-utf-8 <CR> :echo &fenc <CR>

map = :noh <CR>
"map . zr
"map , zm
map <TAB> za

"Autocomplition by Shift + Tab
imap <S-Tab> <C-n>
"move curson to string start/end
"nmap <C-e> $
imap <C-e> <Esc>A
"nmap <C-a> ^
imap <C-a> <Esc>I

"multiline comment
vmap a :s/^\([^#]\)/#\1/ <CR> :noh <CR>
vmap q :s/^#// <CR> :noh <CR>
"comment current line
nmap \ :s/^/#/ <CR> :noh <CR>

"xterm clipboard
vmap <F3> "+y
map <F4> "+p
"nmap <C-w> i<C-w><Esc>
vmap f :!python -mjson.tool <CR>
