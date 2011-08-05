" Vim color file by Jörn Horstmann <joern_h@gmx.net>
" Black background, works in gui and console
" Last change 30.11.2004

set bg=dark

hi clear
if exists("syntax_on")
    syntax reset
endif

let colors_name = "jhdark"

hi Normal         guifg=#999999 guibg=#000000 gui=none ctermfg=gray     ctermbg=black    cterm=none

hi ErrorMsg       guifg=#ff0000 guibg=NONE      gui=none ctermfg=red      ctermbg=NONE       cterm=none
hi Visual         guifg=NONE      guibg=#000066 gui=none ctermfg=NONE       ctermbg=darkblue cterm=none
hi VisualNOS      guifg=NONE      guibg=#000066 gui=none ctermfg=NONE       ctermbg=darkblue cterm=none
hi Todo           guifg=bg      guibg=#aaaa00 gui=none ctermfg=bg       ctermbg=yellow   cterm=none
"hi Todo          guifg=#884400 guibg=bg      gui=none ctermfg=bg       ctermbg=yellow   cterm=none
hi Search         guifg=bg      guibg=#4444aa gui=none ctermfg=bg       ctermbg=darkcyan     cterm=none
hi IncSearch      guifg=bg      guibg=#4444aa gui=none ctermfg=bg       ctermbg=darkcyan     cterm=none

hi SpecialKey     guifg=#775522 guibg=bg      gui=none ctermfg=magenta  ctermbg=bg       cterm=none
hi Directory      guifg=#4444aa guibg=bg      gui=none ctermfg=blue     ctermbg=bg       cterm=none
hi WarningMsg     guifg=#ff0000 guibg=bg      gui=none ctermfg=red      ctermbg=bg       cterm=none
hi WildMenu       guifg=bg      guibg=#ffff00 gui=none ctermfg=bg       ctermbg=yellow   cterm=none
hi ModeMsg        guifg=fg      guibg=NONE      gui=none ctermfg=fg       ctermbg=NONE       cterm=none
hi Title          guifg=fg      guibg=#cccccc gui=none ctermfg=bg       ctermbg=fg       cterm=none
hi MoreMsg        guifg=fg      guibg=NONE      gui=none ctermfg=bg       ctermbg=NONE       cterm=none
hi Question       guifg=fg      guibg=NONE      gui=none ctermfg=bg       ctermbg=NONE       cterm=none
hi NonText        guifg=#666666 guibg=NONE      gui=none ctermfg=fg       ctermbg=NONE       cterm=none

hi StatusLine     guifg=#dddddd guibg=#000088 gui=none ctermfg=fg       ctermbg=darkblue cterm=none
hi StatusLineNC   guifg=#dddddd guibg=#333333 gui=none ctermfg=fg       ctermbg=darkgray cterm=none
hi VertSplit      guifg=#dddddd guibg=#333333 gui=none ctermfg=fg       ctermbg=darkgray cterm=none

hi Folded         guifg=#bb0099 guibg=#222222 gui=none ctermfg=darkmagenta ctermbg=bg cterm=none
hi FoldColumn     guifg=#bb0099 guibg=#222222 gui=none ctermfg=darkmagenta ctermbg=bg cterm=none
hi SignColumn     guifg=#bb0099 guibg=#222222 gui=none ctermfg=darkmagenta ctermbg=bg cterm=none
hi LineNr         guifg=#bb0099 guibg=#222222 gui=none ctermfg=darkmagenta ctermbg=bg cterm=none

"hi Folded         guifg=#dddddd guibg=#666666 gui=none ctermfg=darkmagenta ctermbg=bg cterm=none
"hi FoldColumn     guifg=#dddddd guibg=#666666 gui=none ctermfg=darkmagenta ctermbg=bg cterm=none
"hi SignColumn     guifg=#dddddd guibg=#666666 gui=none ctermfg=darkmagenta ctermbg=bg cterm=none
"hi LineNr         guifg=#dddddd guibg=#666666 gui=none ctermfg=darkmagenta ctermbg=bg cterm=none

hi DiffChange     guifg=bg      guibg=#888800 gui=none ctermfg=NONE       ctermbg=brown      cterm=none
hi DiffAdd        guifg=bg      guibg=#000088 gui=none ctermfg=NONE       ctermbg=darkblue   cterm=none
hi DiffDelete     guifg=bg      guibg=#880000 gui=none ctermfg=NONE       ctermbg=darkred    cterm=none
hi DiffText       guifg=fg      guibg=#dd0000 gui=none ctermfg=fg       ctermbg=red        cterm=none

hi Cursor         guifg=bg      guibg=fg      gui=none ctermfg=bg       ctermbg=fg         cterm=none
hi lCursor        guifg=bg      guibg=fg      gui=none ctermfg=bg       ctermbg=fg         cterm=none

hi Comment        guifg=#008800 guibg=NONE      gui=none ctermfg=darkgreen  ctermbg=NONE     cterm=none
hi Operator       guifg=#ffffff guibg=NONE      gui=none ctermfg=fg         ctermbg=NONE     cterm=none
hi Constant       guifg=#aa0000 guibg=NONE      gui=none ctermfg=darkred    ctermbg=NONE     cterm=none
hi Special        guifg=#997700 guibg=NONE      gui=none ctermfg=brown      ctermbg=NONE     cterm=none

hi Identifier     guifg=#dddddd guibg=NONE      gui=none ctermfg=gray     ctermbg=NONE    cterm=none

hi Type           guifg=#6666dd guibg=NONE      gui=none ctermfg=blue     ctermbg=NONE    cterm=none
hi Statement      guifg=#dddddd guibg=NONE      gui=none ctermfg=white    ctermbg=NONE    cterm=none

hi PreProc        guifg=#008888 guibg=NONE      gui=none ctermfg=darkcyan ctermbg=NONE    cterm=none

hi Error          guifg=NONE      guibg=#ff0000 gui=none ctermfg=NONE       ctermbg=red   cterm=none

hi Ignore         guifg=bg      ctermfg=bg   
hi Underlined     guifg=fg      guibg=NONE ctermfg=fg ctermbg=NONE cterm=underline term=underline gui=underline
