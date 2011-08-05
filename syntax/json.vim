" Vim syntax file
" Language:         JSON (JavaScript Object Notation)
" Maintainer:       Jörn Horstmann <joern_h@gmx.net>
" Latest Revision:  2006-05-22

"if exists("b:current_syntax")
  "finish
"endif

let s:cpo_save = &cpo
set cpo&vim

syn match  jsonToken '[\[\]{},:]'
syn match  jsonTrue  'true'
syn match  jsonFalse 'false'
syn match  jsonNull  'null'

syn region jsonString start=+"+ end=+"+ contains=jsonEscape

syn match  jsonEscape '\\\(r\|n\|t\|f\|b\|"\|\|\'\|\\\|u\x\{4}\)' contained display

syn match jsonNumber  '[-+.eE0-9]+'

hi def link jsonToken  Operator
hi def link jsonTrue   Keyword
hi def link jsonFalse  Keyword
hi def link jsonNull   Keyword
hi def link jsonString String
hi def link jsonNumber Number
hi def link jsonEscape Special

let b:current_syntax = "json"

let &cpo = s:cpo_save
unlet s:cpo_save
