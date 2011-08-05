" This is a simple script. It extends the syntax highlighting to
" highlight each matching set of parens in different colors, to make
" it visually obvious what matches which.

" Obviously, most useful when working with lisp. But it's also nice othe
" times.

" I don't intend to maintain this script. I hacked it together for my
" own purposes, and it is sufficient to the day. If you want to improve it,
" knock yourself out.

" This file is public domain.


" define colors. Note that the one numbered '16' is the outermost pair,
" keep that in mind if you want to change the colors.
" Also, if this script doesn't work on your terminal, you may need to add
" guifg=xx or ever termfg=, though what good this script will do on a 
" black and white terminal I don't know.
hi level1c  guibg=NONE guifg=#000000 gui=bold
hi level2c  guibg=NONE guifg=#aaaaaa gui=bold
hi level3c  guibg=NONE guifg=#888888 gui=bold
hi level4c  guibg=NONE guifg=#666666 gui=bold
hi level5c  guibg=NONE guifg=#444444 gui=bold
hi level6c  guibg=NONE guifg=#000000 gui=bold
hi level7c  guibg=NONE guifg=#aaaaaa gui=bold
hi level8c  guibg=NONE guifg=#888888 gui=bold
hi level9c  guibg=NONE guifg=#666666 gui=bold
hi level10c guibg=NONE guifg=#444444 gui=bold
hi level11c guibg=NONE guifg=#000000 gui=bold
hi level12c guibg=NONE guifg=#aaaaaa gui=bold
hi level13c guibg=NONE guifg=#888888 gui=bold
hi level14c guibg=NONE guifg=#666666 gui=bold
hi level15c guibg=NONE guifg=#444444 gui=bold
hi level16c guibg=NONE guifg=#000000 gui=bold
hi specialc guibg=NONE guifg=#553300 gui=bold

" R5RS Scheme Functions and Syntax:

if version < 600
    set iskeyword=33,35-39,42-58,60-90,94,95,97-122,126,_
else
    setlocal iskeyword=33,35-38,42,43,45-58,60-63,65-90,94,95,97-122,126,_
endif

" These are the regions for each pair.
" This could be improved, perhaps, by makeing them match [ and { also,
" but I'm not going to take the time to figure out haw to make the
" end pattern match only the proper type.
syn region level1  matchgroup=level1c  start=/['`,#@]*(/ end=/)/ contains=TOP,level1,level2,level3,level4,level5,level6,level7,level8,level9,level10,level11,level12,level13,level14,level15, level16,NoInParens
syn region level2  matchgroup=level2c  start=/['`,#@]*(/ end=/)/ contains=TOP,level2,level3,level4,level5,level6,level7,level8,level9,level10,level11,level12,level13,level14,level15, level16,NoInParens
syn region level3  matchgroup=level3c  start=/['`,#@]*(/ end=/)/ contains=TOP,level3,level4,level5,level6,level7,level8,level9,level10,level11,level12,level13,level14,level15, level16,NoInParens
syn region level4  matchgroup=level4c  start=/['`,#@]*(/ end=/)/ contains=TOP,level4,level5,level6,level7,level8,level9,level10,level11,level12,level13,level14,level15, level16,NoInParens
syn region level5  matchgroup=level5c  start=/['`,#@]*(/ end=/)/ contains=TOP,level5,level6,level7,level8,level9,level10,level11,level12,level13,level14,level15, level16,NoInParens
syn region level6  matchgroup=level6c  start=/['`,#@]*(/ end=/)/ contains=TOP,level6,level7,level8,level9,level10,level11,level12,level13,level14,level15, level16,NoInParens
syn region level7  matchgroup=level7c  start=/['`,#@]*(/ end=/)/ contains=TOP,level7,level8,level9,level10,level11,level12,level13,level14,level15, level16,NoInParens
syn region level8  matchgroup=level8c  start=/['`,#@]*(/ end=/)/ contains=TOP,level8,level9,level10,level11,level12,level13,level14,level15, level16,NoInParens
syn region level9  matchgroup=level9c  start=/['`,#@]*(/ end=/)/ contains=TOP,level9,level10,level11,level12,level13,level14,level15, level16,NoInParens
syn region level10 matchgroup=level10c start=/['`,#@]*(/ end=/)/ contains=TOP,level10,level11,level12,level13,level14,level15, level16,NoInParens
syn region level11 matchgroup=level11c start=/['`,#@]*(/ end=/)/ contains=TOP,level11,level12,level13,level14,level15, level16,NoInParens
syn region level12 matchgroup=level12c start=/['`,#@]*(/ end=/)/ contains=TOP,level12,level13,level14,level15, level16,NoInParens
syn region level13 matchgroup=level13c start=/['`,#@]*(/ end=/)/ contains=TOP,level13,level14,level15, level16,NoInParens
syn region level14 matchgroup=level14c start=/['`,#@]*(/ end=/)/ contains=TOP,level14,level15, level16,NoInParens
syn region level15 matchgroup=level15c start=/['`,#@]*(/ end=/)/ contains=TOP,level15, level16,NoInParens
syn region level16 matchgroup=level16c start=/['`,#@]*(/ end=/)/ contains=TOP,level16,NoInParens

syn region bracket matchgroup=specialc start=/['`,#@]*\[/ end=/\]/ contains=TOP,level16,NoInParens

syn keyword schemeSyntax lambda and or if cond case define let let* letrec
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

" Modules require stmt
syn keyword schemeExtSyntax module require dynamic-require lib prefix all-except prefix-all-except rename
" modules provide stmt
syn keyword schemeExtSyntax provide struct all-from all-from-except all-defined all-defined-except
" Other from MzScheme
syn keyword schemeExtSyntax with-handlers when unless instantiate define-struct case-lambda syntax-case
syn keyword schemeExtSyntax free-identifier=? bound-identifier=? module-identifier=? syntax-object->datum
syn keyword schemeExtSyntax datum->syntax-object
syn keyword schemeExtSyntax let-values let*-values letrec-values set!-values fluid-let parameterize begin0
syn keyword schemeExtSyntax error raise opt-lambda define-values unit unit/sig define-signature 
syn keyword schemeExtSyntax invoke-unit/sig define-values/invoke-unit/sig compound-unit/sig import export
syn keyword schemeExtSyntax link syntax quasisyntax unsyntax with-syntax

syn keyword schemeExtFunc format system-type current-extension-compiler current-extension-linker
syn keyword schemeExtFunc use-standard-linker use-standard-compiler
syn keyword schemeExtFunc find-executable-path append-object-suffix append-extension-suffix
syn keyword schemeExtFunc current-library-collection-paths current-extension-compiler-flags make-parameter
syn keyword schemeExtFunc current-directory build-path normalize-path current-extension-linker-flags
syn keyword schemeExtFunc file-exists? directory-exists? delete-directory/files delete-directory delete-file
syn keyword schemeExtFunc system compile-file system-library-subpath getenv putenv current-standard-link-libraries
syn keyword schemeExtFunc remove* file-size find-files fold-files directory-list shell-execute split-path
syn keyword schemeExtFunc current-error-port process/ports process printf fprintf open-input-string open-output-string
syn keyword schemeExtFunc get-output-string
" exceptions
syn keyword schemeExtFunc exn exn:application:arity exn:application:continuation exn:application:fprintf:mismatch
syn keyword schemeExtFunc exn:application:mismatch exn:application:type exn:application:mismatch exn:break exn:i/o:filesystem exn:i/o:port
syn keyword schemeExtFunc exn:i/o:port:closed exn:i/o:tcp exn:i/o:udp exn:misc exn:misc:application exn:misc:unsupported exn:module exn:read
syn keyword schemeExtFunc exn:read:non-char exn:special-comment exn:syntax exn:thread exn:user exn:variable exn:application:mismatch
syn keyword schemeExtFunc exn? exn:application:arity? exn:application:continuation? exn:application:fprintf:mismatch? exn:application:mismatch?
syn keyword schemeExtFunc exn:application:type? exn:application:mismatch? exn:break? exn:i/o:filesystem? exn:i/o:port? exn:i/o:port:closed?
syn keyword schemeExtFunc exn:i/o:tcp? exn:i/o:udp? exn:misc? exn:misc:application? exn:misc:unsupported? exn:module? exn:read? exn:read:non-char?
syn keyword schemeExtFunc exn:special-comment? exn:syntax? exn:thread? exn:user? exn:variable? exn:application:mismatch?
" Command-line parsing
syn keyword schemeExtFunc command-line current-command-line-arguments once-any help-labels multi once-each 

" Simple literals:
syn region schemeString start=+\%(\\\)\@<!"+ skip=+\\[\\"]+ end=+"+

" Comments:

syn match	schemeComment	";.*$"

syn match schemeKeyword oneline /\k\+/
syn match schemeSymbol  oneline /'\k\+/
syn match schemeSpecial oneline /,\k\+/

" This is a useful lax approximation:
syn match	schemeNumber	oneline    "[-#+0-9.][-#+/0-9a-f@i.boxesfdl]*"

syn match	schemeBoolean	oneline    "#[tf]"

syn match	schemeChar	oneline    "#\\"
syn match	schemeChar	oneline    "#\\."
syn match	schemeChar	oneline    "#\\space"
syn match	schemeChar	oneline    "#\\newline"

" #%xxx are the special MzScheme identifiers
syn match schemeOther oneline    "#%[-a-z!$%&*/:<=>?^_~0-9+.@#%]\+"
" anything limited by |'s is identifier
syn match schemeOther oneline    "|[^|]\+|"

syn match	schemeChar	oneline    "#\\\%(return\|tab\)"

hi link schemeKeyword		Normal
hi link schemeSymbol            Preproc
hi link schemeSpecial           specialc

hi link schemeSyntax		Statement
hi link schemeFunc		Function

hi link schemeString		String
hi link schemeChar		Character
hi link schemeNumber		Number
hi link schemeBoolean		Boolean

hi link schemeDelimiter	Delimiter
hi link schemeConstant		Constant

hi link schemeComment		Comment
hi link schemeMultilineComment	Comment

hi link schemeExtSyntax	Type
hi link schemeExtFunc		PreProc
