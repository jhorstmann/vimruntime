" Vim compiler file
" Compiler:     Eclipse Java Compiler
" Maintainer:   Jörn Horstmann <joern_h@gmx.net>
" Last Change:  2006-07-07

if exists("current_compiler")
  finish
endif
let current_compiler = "ecj"

if exists(":CompilerSet") != 2		" older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

CompilerSet makeprg=java\ -jar\ c:/programme/vim7/ecj.jar\ -Xemacs\ -cp\ .\ -encoding\ utf-8\ -d\ .\ %

CompilerSet errorformat=%E%f:%l:\ %m,%-Z%p^,%-C%.%#,%-G%.%#
