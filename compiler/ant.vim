" Vim Compiler File
" Compiler:	ant
" Maintainer:	Johannes Zellner <johannes@zellner.org>
" Last Change:	Mi, 13 Apr 2005 22:50:07 CEST

if exists("current_compiler")
    finish
endif
let current_compiler = "ant"

if exists(":CompilerSet") != 2		" older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

let s:cpo_save = &cpo
set cpo&vim

"CompilerSet makeprg=ant\ -emacs\ -find\ build.xml
CompilerSet makeprg=ant\ -q\ -find\ build.xml

" first  line:
"     ant with jikes +E, which assumes  the following
"     two property lines in your 'build.xml':
"
"         <property name = "build.compiler"       value = "jikes"/>
"         <property name = "build.compiler.emacs" value = "true"/>
"
" second line:
"     ant with javac
"
" note that this will work also for tasks like [wtkbuild]
"
"CompilerSet errorformat=\ %#[%.%#]\ %#%f:%l:%v:%*\\d:%*\\d:\ %t%[%^:]%#:%m,%A\ %#[%.%#]\ %f:%l:\ %m,%-Z\ %#[%.%#]\ %p^,%C\ %#[%.%#]\ %#%m,%-C%.%#

"CompilerSet errorformat=%A\ %#[javac]\ %f:%l:\ %m,%-Z\ %#[javac]\ %p^,%-C%.%#,%-G\ %#[javac]\ %l\ errors,%-GTotal\ time:.%#
CompilerSet errorformat=%A\ %#[javac]\ %f:%l:\ %m,%-Z\ %#[javac]\ %p^,%-C%.%#,%-G\ %#[javac]\ %l\ errors

let &cpo = s:cpo_save
unlet s:cpo_save
