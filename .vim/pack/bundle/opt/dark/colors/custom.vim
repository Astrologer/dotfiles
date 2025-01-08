" color scheme
runtime colors/default.vim
let g:colors_name = 'custom'

set t_ZH=[3m
set t_ZR=[23m

highlight Normal        ctermfg=LightGrey   ctermbg=Black
highlight Search        ctermfg=Black       ctermbg=DarkRed     cterm=NONE
highlight Visual                                                cterm=reverse
highlight Cursor        ctermfg=Black       ctermbg=Green       cterm=bold
highlight Special       ctermfg=DarkYellow
highlight Comment       ctermfg=Blue                            cterm=italic
highlight StatusLine    ctermfg=DarkGrey    ctermbg=Black       cterm=NONE
highlight Statement     ctermfg=DarkYellow                      cterm=NONE
highlight Constant      ctermfg=Magenta                         cterm=NONE
highlight Type          ctermfg=DarkGreen                       cterm=NONE
highlight Todo          ctermfg=Black       ctermbg=DarkYellow  cterm=italic
highlight LineNr        ctermfg=darkgrey
highlight Folded        ctermfg=DarkGrey    ctermbg=Black       cterm=NONE

highlight Pmenu         ctermfg=DarkGrey    ctermbg=Black       cterm=NONE
highlight PmenuSel      ctermfg=White       ctermbg=DarkGrey    cterm=NONE
highlight DiffAdded     ctermfg=DarkGreen
highlight DiffRemoved   ctermfg=DarkRed
"highlight DiffDelete    ctermfg=DarkRed

highlight VertSplit     ctermfg=Black       ctermbg=DarkGray
highlight StatusLineNC    ctermfg=DarkGrey    ctermbg=Black       cterm=NONE

set fillchars=vert:│,fold:-,eob:~,lastline:@
set listchars=tab:▸\ ,trail:·,extends:«,precedes:»
