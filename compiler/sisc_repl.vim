" Vim compiler file
" Compiler:     siscweb repl
" Maintainer:   Jörn Horstmann <joern_h@gmx.net>
" Last Change:  2005-08-25

if exists("current_compiler")
  finish
endif
let current_compiler = "sisc_repl"

if exists(":CompilerSet") != 2		" older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

CompilerSet makeprg=c:/programme/putty/plink.exe\ localhost\ -raw\ -P\ 5156\ -m
