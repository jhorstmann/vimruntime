"if exists("current_compiler")
"  finish
"endif
let current_compiler = "networkpipe"

if exists(":CompilerSet") != 2		" older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

CompilerSet makeprg=java\ -cp\ c:/home/sources/java\ NetworkPipe\ %

"CompilerSet errorformat=#;>%.%#
CompilerSet errorformat=%+G%.%#
