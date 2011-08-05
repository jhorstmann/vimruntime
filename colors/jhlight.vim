" Vim colour scheme
" Maintainer:	Jörn Horstmann <joern_h@gmx.net>
" Last Change:	2005-08-17
" Version:	1.2
"
" Color scheme with light background, works in GUI and console.
"
" Options
"       g:jh_hi_use_bold - use bold for types and statements
"       g:jh_hi_guibg    - background color for gui
"       g:jh_hi_ctermbg  - background color for console
"
" Update 2004-09-08
"       changed colors for better contrast
" Update 2005-08-17
"       Changed bg to NONE
"       lighter color for visual selection

set bg=light

hi clear
if exists("syntax_on")
    syntax reset
endif

let colors_name = "jhlight"

hi Normal         guifg=#000000 guibg=NONE gui=none ctermfg=black    ctermbg=grey     cterm=none

if exists("g:jh_hi_guibg")
    execute 'hi Normal guibg=' . g:jh_hi_guibg
endif
if exists("g:jh_hi_ctermbg")
    execute 'hi Normal ctermbg=' . g:jh_hi_ctermbg
endif

hi ErrorMsg       guifg=#ff0000 guibg=NONE      gui=none ctermfg=red      ctermbg=NONE       cterm=none
hi Visual         guifg=NONE      guibg=#aaaaff gui=none ctermfg=NONE       ctermbg=darkcyan cterm=none
hi VisualNOS      guifg=NONE      guibg=#aaaaff gui=none ctermfg=NONE       ctermbg=darkcyan cterm=none
hi Todo           guifg=fg      guibg=#bbbb77 gui=none ctermfg=NONE       ctermbg=brown    cterm=none
"hi Todo          guifg=#884400 guibg=NONE      gui=none ctermfg=NONE       ctermbg=yellow   cterm=none
hi Search         guifg=fg      guibg=#8888dd gui=none ctermfg=NONE       ctermbg=blue     cterm=none
hi IncSearch      guifg=fg      guibg=#8888dd gui=none ctermfg=NONE       ctermbg=blue     cterm=none

hi SpecialKey     guifg=#553300 guibg=NONE      gui=none ctermfg=darkmagenta ctermbg=NONE       cterm=none
hi Directory      guifg=#000088 guibg=NONE      gui=none ctermfg=blue     ctermbg=NONE       cterm=none
hi WarningMsg     guifg=#ff0000 guibg=NONE      gui=none ctermfg=red      ctermbg=NONE       cterm=none
hi WildMenu       guifg=fg      guibg=#ffff00 gui=none ctermfg=NONE       ctermbg=brown    cterm=none
hi ModeMsg        guifg=fg      guibg=NONE      gui=none ctermfg=fg       ctermbg=NONE       cterm=none
hi Title          guifg=#000088 guibg=#cccccc gui=none ctermfg=fg       ctermbg=NONE       cterm=none
hi MoreMsg        guifg=#000088 guibg=NONE      gui=none ctermfg=fg       ctermbg=NONE       cterm=none
hi Question       guifg=#000088 guibg=NONE      gui=none ctermfg=fg       ctermbg=NONE       cterm=none
hi NonText        guifg=#444444 guibg=NONE      gui=none ctermfg=fg       ctermbg=NONE       cterm=none

hi StatusLine     guifg=#dddddd guibg=#000088 gui=none ctermfg=white    ctermbg=darkblue cterm=none
hi StatusLineNC   guifg=#dddddd guibg=#333333 gui=none ctermfg=grey     ctermbg=black    cterm=none
hi VertSplit      guifg=#dddddd guibg=#333333 gui=none ctermfg=white    ctermbg=black    cterm=none

hi Folded         guifg=#005500 guibg=#999999 gui=none ctermfg=darkgreen ctermbg=darkgray cterm=none
hi FoldColumn     guifg=#005500 guibg=#999999 gui=none ctermfg=darkgreen ctermbg=darkgray cterm=none
hi SignColumn     guifg=#005500 guibg=#999999 gui=none ctermfg=darkgreen ctermbg=darkgray cterm=none
hi LineNr         guifg=#005500 guibg=#999999 gui=none ctermfg=darkgreen ctermbg=darkgray cterm=none

"hi Folded         guifg=#dddddd guibg=#666666 gui=none ctermfg=darkmagenta ctermbg=NONE cterm=none
"hi FoldColumn     guifg=#dddddd guibg=#666666 gui=none ctermfg=darkmagenta ctermbg=NONE cterm=none
"hi SignColumn     guifg=#dddddd guibg=#666666 gui=none ctermfg=darkmagenta ctermbg=NONE cterm=none
"hi LineNr         guifg=#dddddd guibg=#666666 gui=none ctermfg=darkmagenta ctermbg=NONE cterm=none

hi DiffChange     guifg=fg      guibg=#888800 gui=none ctermfg=NONE       ctermbg=brown      cterm=none
hi DiffAdd        guifg=fg      guibg=#008800 gui=none ctermfg=NONE       ctermbg=green   cterm=none
hi DiffDelete     guifg=fg      guibg=#880000 gui=none ctermfg=NONE       ctermbg=darkred    cterm=none
hi DiffText       guifg=fg      guibg=#dd0000 gui=none  ctermfg=fg        ctermbg=red        cterm=none

hi Cursor         guifg=bg      guibg=fg      gui=none ctermfg=NONE       ctermbg=fg         cterm=none
hi lCursor        guifg=bg      guibg=fg      gui=none ctermfg=NONE       ctermbg=fg         cterm=none

hi Comment        guifg=#006600 guibg=NONE      gui=none ctermfg=darkgreen  ctermbg=NONE     cterm=none
hi Operator       guifg=fg      guibg=NONE      gui=none ctermfg=fg         ctermbg=NONE     cterm=none
hi Constant       guifg=#880000 guibg=NONE      gui=none ctermfg=darkred    ctermbg=NONE     cterm=none
hi Special        guifg=#553300 guibg=NONE      gui=none ctermfg=brown      ctermbg=NONE     cterm=none

hi Identifier     guifg=#000088 guibg=NONE      gui=none ctermfg=darkblue   ctermbg=NONE       cterm=none
"hi Function      guifg=#000044 gui=none

"hi Keyword       guifg=#000088 gui=none

if exists("g:jh_hi_use_bold")
    hi Type           guifg=#660044 guibg=NONE      gui=bold ctermfg=darkmagenta ctermbg=NONE    cterm=none
    hi Statement      guifg=#440066 guibg=NONE      gui=bold ctermfg=darkmagenta ctermbg=NONE    cterm=none
else
    hi Type           guifg=#660044 guibg=NONE      gui=none ctermfg=darkmagenta ctermbg=NONE    cterm=none
    hi Statement      guifg=#440066 guibg=NONE      gui=none ctermfg=darkmagenta ctermbg=NONE    cterm=none
endif

hi PreProc        guifg=#004466 guibg=NONE      gui=none ctermfg=darkcyan ctermbg=NONE    cterm=none

hi Error          guifg=NONE      guibg=#bb0000 gui=none ctermfg=NONE       ctermbg=red   cterm=none

hi Ignore         guifg=NONE      ctermfg=NONE   
hi Underlined     guifg=fg guibg=NONE ctermfg=fg ctermbg=NONE cterm=underline term=underline gui=underline
