" color scheme
runtime colors/default.vim
let g:colors_name = 'custom'

" --- dump
highlight SpecialKey        term=bold ctermfg=81 guifg=Cyan
highlight NonText           term=bold ctermfg=12 gui=bold guifg=Blue
highlight Directory         term=bold ctermfg=159 guifg=Cyan
highlight ErrorMsg          term=standout ctermfg=15 ctermbg=1 guifg=White guibg=Red
highlight IncSearch         term=reverse cterm=reverse gui=reverse
highlight Search            term=reverse ctermfg=0 ctermbg=1 guifg=Black guibg=Yellow
highlight MoreMsg           term=bold ctermfg=121 gui=bold guifg=SeaGreen
highlight ModeMsg           term=bold cterm=bold gui=bold
highlight LineNr            term=underline ctermfg=242 guifg=Yellow
highlight CursorLineNr      term=bold cterm=underline ctermfg=11 gui=bold guifg=Yellow
highlight Question          term=standout ctermfg=121 gui=bold guifg=Green
highlight StatusLine        term=bold,reverse ctermfg=242 ctermbg=0 gui=bold,reverse
highlight StatusLineNC      term=reverse ctermfg=242 ctermbg=0 gui=reverse
highlight VertSplit         term=reverse cterm=reverse ctermfg=0 ctermbg=242 gui=reverse
highlight Title             term=bold ctermfg=225 gui=bold guifg=Magenta
highlight Visual            term=reverse cterm=reverse ctermbg=242 guibg=DarkGrey
highlight VisualNOS         term=bold,underline cterm=bold,underline gui=bold,underline
highlight WarningMsg        term=standout ctermfg=224 guifg=Red
highlight WildMenu          term=standout ctermfg=0 ctermbg=11 guifg=Black guibg=Yellow
highlight Folded            term=standout ctermfg=242 ctermbg=0 guifg=Cyan guibg=DarkGrey
highlight FoldColumn        term=standout ctermfg=14 ctermbg=242 guifg=Cyan guibg=Grey
highlight DiffAdd           term=bold ctermbg=4 guibg=DarkBlue
highlight DiffChange        term=bold ctermbg=5 guibg=DarkMagenta
highlight DiffDelete        term=bold ctermfg=12 ctermbg=6 gui=bold guifg=Blue guibg=DarkCyan
highlight DiffText          term=reverse cterm=bold ctermbg=9 gui=bold guibg=Red
highlight SignColumn        term=standout ctermfg=14 ctermbg=242 guifg=Cyan guibg=Grey
highlight Conceal           ctermfg=7 ctermbg=242 guifg=LightGrey guibg=DarkGrey
highlight SpellBad          term=reverse ctermbg=9 gui=undercurl guisp=Red
highlight SpellCap          term=reverse ctermbg=12 gui=undercurl guisp=Blue
highlight SpellRare         term=reverse ctermbg=13 gui=undercurl guisp=Magenta
highlight SpellLocal        term=underline ctermbg=14 gui=undercurl guisp=Cyan
highlight Pmenu             ctermfg=242 ctermbg=0 guibg=Magenta
highlight PmenuSel          ctermfg=15 ctermbg=242 guibg=DarkGrey
highlight PmenuSbar         ctermbg=248 guibg=Grey
highlight PmenuThumb        ctermbg=15 guibg=White
highlight TabLine           term=underline cterm=underline ctermfg=15 ctermbg=242 gui=underline guibg=DarkGrey
highlight TabLineSel        term=bold cterm=bold gui=bold
highlight TabLineFill       term=reverse cterm=reverse gui=reverse
highlight CursorColumn      term=reverse ctermbg=242 guibg=Grey40
highlight CursorLine        term=underline cterm=underline guibg=Grey40
highlight ColorColumn       term=reverse ctermbg=1 guibg=DarkRed
highlight StatusLineTerm    term=bold,reverse cterm=bold ctermfg=0 ctermbg=121 gui=bold guifg=bg guibg=LightGreen
highlight StatusLineTermNC  term=reverse ctermfg=0 ctermbg=121 guifg=bg guibg=LightGreen
highlight Normal            ctermfg=7 ctermbg=0
highlight MatchParen        term=reverse ctermbg=6 guibg=DarkCyan
highlight ToolbarLine       term=underline ctermbg=242 guibg=Grey50
highlight ToolbarButton     cterm=bold ctermfg=0 ctermbg=7 gui=bold guifg=Black guibg=LightGrey
highlight Cursor            cterm=bold ctermfg=0 ctermbg=10
highlight Special           term=bold ctermfg=3 guifg=Orange
highlight Comment           term=bold cterm=italic ctermfg=12 guifg=#80a0ff
highlight Statement         term=bold ctermfg=3 gui=bold guifg=#ffff60
highlight Constant          term=underline ctermfg=13 guifg=#ffa0a0
highlight Type              term=underline ctermfg=2 gui=bold guifg=#60ff60
highlight Todo              term=standout cterm=italic ctermfg=0 ctermbg=3 guifg=Blue guibg=Yellow
highlight DiffAdded         ctermfg=2
highlight DiffRemoved       ctermfg=1
highlight Identifier        term=underline cterm=bold ctermfg=14 guifg=#40ffff
highlight PreProc           term=underline ctermfg=81 guifg=#ff80ff
highlight Underlined        term=underline cterm=underline ctermfg=81 gui=underline guifg=#80a0ff
highlight Ignore            ctermfg=0 guifg=bg
highlight Error             term=reverse ctermfg=15 ctermbg=9 guifg=White guibg=Red
" ---

" --- customization
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
