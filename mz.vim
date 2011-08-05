mzscheme << EOF
(require (prefix vim- vimext))

(define *repl-host* "localhost")
(define *repl-port* 5156)
(define *scratch-buffer* (vim-get-buff-by-name "__Scratch__"))

(define *response* '())

(define (vim-redraw)
  (vim-command ":redraw"))

(define send-to-repl 
  (if (vim-buff? *scratch-buffer*)
      (let-values (((inp outp)
                (tcp-connect *repl-host* *repl-port*)))
              (file-stream-buffer-mode outp 'line)
              (thread (lambda ()
                        (let loop ()
                          (let ((response (read-line inp 'any-one)))
                            (set! *response* (append *response* (list response)))
                            (loop)))))
              (lambda (expr)
                (display expr outp)
                (display #\newline outp)
                (flush-output outp)))
        (display "No scratch buffer found")))

(define (display-response)
  (when (not (null? *response*))
    (let ((lines (vim-get-buff-size *scratch-buffer*)))
      (if (= lines 1)
          (vim-insert-buff-line-list 0 *response* *scratch-buffer*)
          (vim-set-buff-line-list 1 lines *response* *scratch-buffer*))
      (cond ((vim-get-win-list *scratch-buffer*) => (lambda (window)
                                                      (vim-set-cursor '(1 . 1) (car window))))))))

EOF

function! SendToRepl(type, ...)
    let sel_save = &selection
    let &selection = "inclusive"
    let reg_save = @@

    if a:0  " Invoked from Visual mode, use '< and '> marks.
        silent exe "normal! `<" . a:type . "`>y"
    elseif a:type == 'line'
        silent exe "normal! '[V']y"
    elseif a:type == 'block'
        silent exe "normal! `[\<C-V>`]y"
    else
        silent exe "normal! `[v`]y"
    endif

    mz (send-to-repl (vim-eval "@@"))

    let &selection = sel_save
    let @@ = reg_save
endfunction

"function! DisplayResponse()
"endfunction

set operatorfunc=SendToRepl
nnoremap <C-M> g@
"nnoremap <C-M><C-M> :mz (display-response)<CR>
"nnoremap <C-M>x :mz (clear-response)<CR>
nnoremap <C-M><C-M> :mz (display-response)<CR>:redraw<CR>
autocmd CursorMoved <buffer> :mz (display-response)

" (* 8 8)
" (* 7 7)
" (make <java.util.Date>)
" (let loop ((i 0)) (when (< i 10) (display i) (display #\newline) (loop (+ 1 i))))
