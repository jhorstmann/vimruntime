" Vim compiler file
" Compiler:     Kawa Scheme
" Maintainer:   Jörn Horstmann <joern_h@gmx.net>
" Last Change:  2007-06-26

" if exists("current_compiler")
"   finish
" endif
" let current_compiler = "kawa"

setlocal makeprg=java\ -cp\ c:/temp/kawa-1.9.1.jar;c:/programme/tomcat6/lib/servlet-api.jar\ kawa.repl\ -C\ %

setlocal errorformat=%E%f:%l:%c\ %m,%-Z%p^,%-C%.%#,%-G%.%#
