"function! JHTest()
"    let l = getline(line('.'))
"    let c = col('.')
"    return l[c-2] . l[c-1]
"endfunction

function! JHBackspace()
    let r = line('.')
    let l = getline(r)
    let c = col('.')
    if ((l[c-2] == '"') && (l[c-1] == '"')) || (l[c-2] == '(' && l[c-1] == ')')
        call cursor(r, c+1)
        return "\x08\x08"
    else
        return "\x08"
    endif
endfunction

function! JHQuoteOrMove()
    let r = line('.')
    let l = getline(r)
    let c = col('.')
    if l[c-1] == '"'
        call cursor(r, c+1)
        return ''
    else
        return '"'
    endif
endfunction

function! JHCloseBraceOrMove()
    let r = line('.')
    let l = getline(r)
    let c = col('.')
    if l[c-1] == ')'
        call cursor(r, c+1)
        return ''
    else
        return ')'
    endif
endfunction

inoremap <BS> <C-R>=JHBackspace()<CR>
inoremap <C-H> <C-R>=JHBackspace()<CR>
inoremap " <C-R>=JHQuoteOrMove()<CR>
inoremap ) <C-R>=JHCloseBraceOrMove()<CR>

"inoremap <C-X> <C-R>=JHTest()<CR>

"inoreabb <C-R>=JHQuoteOrMove
"aabbcdeffggggasdfasd))))a""""""""
