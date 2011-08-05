" Vim syntax file
" Language:     Scheme (R5RS)
" Last Change:  02.05.2008
" Maintainer:   Jörn Horstmann <joern_h@gmx.net>
" Original author: Sergey Khorev <sergey.khorev@gmail.com>
" Original author: Dirk van Deun <dirk@igwe.vub.ac.be>

" Initializing:

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
"if version < 600
"  syntax clear
"elseif exists("b:current_syntax")
"  finish
"endif

"syn case ignore

syn match schemeError '[^ \t()\[\]";]\+' display

syn match schemeIdentifier        "\<\k\+\>" display
syn match schemeIdentifierSpecial "\<|[^|]\+|\>" display
syn match schemeIdentifierSpecial "\<<\k\+>\>" display
syn match schemeIdentifierSpecial "\<[$%&/:?]\k\+\>" display
syn match schemeIdentifierGlobal  "\<\*\k\+\*\>" display

syn match schemeBoolean '#[tTfF]\>' display

syn match schemePragma "#!\w\+\>"

" This is a useful lax approximation:
syn match schemeNumber  "\<[-+0-9.][-+/0-9.@isSfFdDlL]*\>" display
syn match schemeNumber  "\(#[iIeEbBoOdDxX]\)\+[-+0-9a-fA-F.@isSdDlL]\+\>" display

"syn match schemeNumber  "#[iIeE]\(#[dD]\)\?" nextgroup=schemeComplex10
"syn match schemeNumber  "\(#[iIeE]#[bB]\|#[bB]\(#[iIeE]\)\?\)" nextgroup=schemeComplex2
"syn match schemeNumber  "\(#[iIeE]#[oO]\|#[oO]\(#[iIeE]\)\?\)" nextgroup=schemeComplex8
"syn match schemeNumber  "\(#[iIeE]#[xX]\|#[xX]\(#[iIeE]\)\?\)" nextgroup=schemeComplex16

"syn match schemeComplex10 "\([-+0-9]\+[0-9]*\|\.[0-9]\+\)\(#[eEsSfFdDlL][-+][0-9]\+\)\?\(|[0-9]\+]\)\?\>"
"syn match schemeComplex2  "[-+]\?[01]\+\>" contained
"syn match schemeComplex8  "[-+]\?[01]\+\>" contained
"syn match schemeComplex10 "[-+]nan.0\>"
"syn match schemeComplex10 "[-+]inf.0\>"

syn match schemeChar    "#\\." display
syn match schemeChar    "#\\x\x\+\>" display
syn match schemeChar    "#\\nul\>" display
syn match schemeChar    "#\\alarm\>" display
syn match schemeChar    "#\\backspace\>" display
syn match schemeChar    "#\\tab\>" display
syn match schemeChar    "#\\linefeed\>" display
syn match schemeChar    "#\\newline\>" display
syn match schemeChar    "#\\vtab\>" display
syn match schemeChar    "#\\page\>" display
syn match schemeChar    "#\\return\>" display
syn match schemeChar    "#\\esc\>" display
syn match schemeChar    "#\\space\>" display
syn match schemeChar    "#\\delete\>" display

syn region schemeString start='"' skip='\\"' end='"' contains=schemeStringEscape,schemeInlineHexEscape
syn match  schemeStringEscape '\\[\\"abtnvfr]' contained
syn match  schemeInlineHexEscape '\\x\x\+;' contained
"syn match  schemeStringEscape '\\x\x\+;' contained

" syn cluster schemeAtom contains=schemeIdentifier,schemeIdentifierSpecial,schemeIdentifierGlobal,schemeBoolean,schemeString,schemeChar

syn region schemeList matchgroup=schemeDelimiter start="("     end=")"  contains=TOP
syn region schemeList matchgroup=schemeDelimiter start="\["    end="\]" contains=TOP
syn region schemeList matchgroup=schemeDelimiter start="#("    end=")"  contains=TOP
syn region schemeList matchgroup=schemeDelimiter start="#vu8(" end=")"  contains=TOP

syn match  schemeQuoteAtom "#\?['`]['`,@]*\s*[^ \t,()]\+" display
syn region schemeQuoteList matchGroup=schemeQuoteAtom start="#\?['`]['`,@]*\s*("     end=")"  contains=TOP
syn region schemeQuoteList matchGroup=schemeQuoteAtom start="#\?['`]['`,@]*\s*\["    end="\]" contains=TOP
syn region schemeQuoteList matchGroup=schemeQuoteAtom start="#\?['`]['`,@]*\s*#("    end=")"  contains=TOP
syn region schemeQuoteList matchGroup=schemeQuoteAtom start="#\?['`]['`,@]*\s*#vu8(" end=")"  contains=TOP

syn match  schemeUnquoteAtom "#\?,['`,@]*\s*[^ \t()]\+" display
syn region schemeUnquoteList matchGroup=schemeUnquoteAtom start="#\?,['`,@]*\s*("  end=")" contains=TOP
syn region schemeUnquoteList matchGroup=schemeUnquoteAtom start="#\?,['`,@]*\s*\[" end="]" contains=TOP

syn region schemeCommentML start="#|" end="|#" contains=schemeCommentML
syn match  schemeCommentSL ";.*$" display

syn match  schemeCommentExprAtom "#;\s*['`,@#]*[^ \t()]\+" display 
syn region schemeCommentExprList matchGroup=schemeCommentExprAtom start="#;\s*['`,@#]*("     end=")"  contains=TOP
syn region schemeCommentExprList matchGroup=schemeCommentExprAtom start="#;\s*['`,@#]*#("    end=")"  contains=TOP
syn region schemeCommentExprList matchGroup=schemeCommentExprAtom start="#;\s*['`,@#]*#vu8(" end=")"  contains=TOP
syn region schemeCommentExprList matchGroup=schemeCommentExprAtom start="#;\s*['`,@#]*\["    end="\]" contains=TOP

" R5RS Scheme Functions and Syntax:

if version < 600
  set iskeyword=33,36-38,42-58,60-90,94,95,97-122,124,126,_
else
  setlocal iskeyword=33,36-38,42-58,60-90,94,95,97-122,124,126,_
endif

syn keyword schemeSyntax lambda and or if cond case define let let* letrec letrec* let-values let*-values
syn keyword schemeSyntax begin do delay set! else =>
syn keyword schemeSyntax quote quasiquote unquote unquote-splicing
syn keyword schemeSyntax define-syntax let-syntax letrec-syntax syntax-rules

syn keyword schemeFunc not boolean? eq? eqv? equal? pair? cons car cdr set-car!
syn keyword schemeFunc set-cdr! caar cadr cdar cddr caaar caadr cadar caddr
syn keyword schemeFunc cdaar cdadr cddar cdddr caaaar caaadr caadar caaddr
syn keyword schemeFunc cadaar cadadr caddar cadddr cdaaar cdaadr cdadar cdaddr
syn keyword schemeFunc cddaar cddadr cdddar cddddr null? list? list length
syn keyword schemeFunc append reverse list-ref memq memv member assq assv assoc
syn keyword schemeFunc symbol? symbol->string string->symbol number? complex?
syn keyword schemeFunc real? rational? integer? exact? inexact? = < > <= >=
syn keyword schemeFunc zero? positive? negative? odd? even? max min + * - / abs
syn keyword schemeFunc quotient remainder modulo gcd lcm numerator denominator
syn keyword schemeFunc floor ceiling truncate round rationalize exp log sin cos
syn keyword schemeFunc tan asin acos atan sqrt expt make-rectangular make-polar
syn keyword schemeFunc real-part imag-part magnitude angle exact->inexact
syn keyword schemeFunc inexact->exact number->string string->number char=?
syn keyword schemeFunc char-ci=? char<? char-ci<? char>? char-ci>? char<=?
syn keyword schemeFunc char-ci<=? char>=? char-ci>=? char-alphabetic? char?
syn keyword schemeFunc char-numeric? char-whitespace? char-upper-case?
syn keyword schemeFunc char-lower-case?
syn keyword schemeFunc char->integer integer->char char-upcase char-downcase
syn keyword schemeFunc string? make-string string string-length string-ref
syn keyword schemeFunc string-set! string=? string-ci=? string<? string-ci<?
syn keyword schemeFunc string>? string-ci>? string<=? string-ci<=? string>=?
syn keyword schemeFunc string-ci>=? substring string-append vector? make-vector
syn keyword schemeFunc vector vector-length vector-ref vector-set! procedure?
syn keyword schemeFunc apply map for-each call-with-current-continuation
syn keyword schemeFunc call-with-input-file call-with-output-file input-port?
syn keyword schemeFunc output-port? current-input-port current-output-port
syn keyword schemeFunc open-input-file open-output-file close-input-port
syn keyword schemeFunc close-output-port eof-object? read read-char peek-char
syn keyword schemeFunc write display newline write-char call/cc
syn keyword schemeFunc list-tail string->list list->string string-copy
syn keyword schemeFunc string-fill! vector->list list->vector vector-fill!
syn keyword schemeFunc force with-input-from-file with-output-to-file
syn keyword schemeFunc char-ready? load transcript-on transcript-off eval
syn keyword schemeFunc dynamic-wind port? values call-with-values
syn keyword schemeFunc scheme-report-environment null-environment
syn keyword schemeFunc interaction-environment

" SISC extensions
syn keyword schemeSyntax require-library module import

"R6RS libraries
syn keyword schemeSyntax library export only except rename

syn keyword schemeFunc _ ...

" Synchronization and the wrapping up...

syn sync match matchPlace grouphere NONE "^[^ \t]"
" syn sync match matchPlace grouphere NONE "(define"
" ... i.e. synchronize on a line that starts at the left margin

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_scheme_syntax_inits")
  if version < 508
    let did_scheme_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink schemeSyntax    Statement
  HiLink schemeFunc      Function

  HiLink schemeString    String
  HiLink schemeChar      Character
  HiLink schemeNumber    Number
  HiLink schemeBoolean   Boolean
  HiLink schemeStringEscape Special
  HiLink schemeInlineHexEscape Special

  HiLink schemeDelimiter Delimiter
  HiLink schemeIdentifierGlobal  Constant
  HiLink schemeIdentifierSpecial  Special

  HiLink schemePragma PreProc

  HiLink schemeCommentSL   Comment
  HiLink schemeCommentML   Comment
  HiLink schemeCommentExprAtom   Comment

  HiLink schemeQuoteAtom   PreProc
  HiLink schemeUnquoteAtom Special

  "highlight schemeList guibg=#cccccc
  "highlight schemeQuoteList guibg=#eeeeee
  "highlight schemeUnquoteList guibg=#dddddd
  highlight Delimiter guifg=#888888

  HiLink schemeError     Error

  delcommand HiLink
endif

let b:current_syntax = "scheme"
