function! SchemeEvalOp(type, ...)
    mzscheme << ENDMZ
        (require (prefix vim- vimext))
    let posstart = getpos("'[")
    let posend   = getpos("']")
ENDMZ
endfunction
