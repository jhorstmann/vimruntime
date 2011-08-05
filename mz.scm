(require (prefix vim- vimext))

(define *scratch-buffer* (vim-get-buff-by-name "__Scratch__"))

(define send-to-repl 
  (let-values (((inp outp)
                (tcp-connect "localhost" 5156)))
              (file-stream-buffer-mode outp 'line)
              (thread (lambda ()
                        (let loop ()
                          (let ((response (read-line inp 'any)))
                            (vim-set-buff-line 1 response *scratch-buffer*)
                            (vim-command ":redraw")
                            ;(display response)
                            ;(display #\newline)
                            (loop)))))
              (lambda (expr)
                (display expr outp)
                (display #\newline outp))))

(send-to-repl "(+ 1 2)")
