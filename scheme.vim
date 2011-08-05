" inoreab <buffer> if (if ()<CR>«--then--»<CR>«--else--»)<UP><UP><END><LEFT>
" inoreab <buffer> let (let ([«--binding--»])<CR>«--body--»)<UP><END><C-O>17<LEFT>
" inoreab <buffer> loop (let loop ([«--binding--»])<CR>«--body--»)<UP><END><C-O>17<LEFT>
" inoreab <buffer> cond (cond <CR>(«--test--» «--body--»)<CR>(else «--else--»))<UP><UP><END>
" inoreab <buffer> case (case <CR>(«--test--» «--body--»)<CR>(else «--else--»))<UP><UP><END>
" inoreab <buffer> define (define <CR>«--body--»)<UP><END>
" inoreab <buffer> defun (define ()<CR>«--body--»)<UP><END><LEFT>
" inoreab <buffer> lambda (lambda ()<CR>«--body--»)<UP><END><LEFT>

" scratch.vim is at http://vim.sourceforge.net/scripts/script.php?script_id=664
vnoremap <buffer> <C-M> y:Sscratch<CR>gg"_dGP:.,$!python c:/home/sources/python/networkpipe.py<CR>G<C-W>p
nnoremap <buffer> <C-M> yab:Sscratch<CR>gg"_dGP:.,$!python c:/home/sources/python/networkpipe.py<CR>G<C-W>p

function! JHSchemeBeginSExp()
    call search("[,`@']*\\%#", 'Wb')
endfunction

function! JHSchemeUp()
    "if getline(line('.'))[col('.')-1] == ')'
        call searchpair('(', '', ')', 'Wb') 
    "else
    "    call search('[()]','Wb')
    "endif
    call JHSchemeBeginSExp()
endfunction

function! JHSchemeDown()
    "if getline(line('.'))[col('.')-1] == '('
        call searchpair('(', '', ')', 'W')
    "else
    "    call search('[()]','W')
    "endif
endfunction

function! JHSchemeLeft()
    call search('[()]', 'Wb')
    call JHSchemeBeginSExp()
endfunction

function! JHSchemeRight()
    call search('[()]', 'W')
endfunction

function! JHSchemePerhapsUp()
    if getline(line('.'))[col('.')-1] != '('
        call JHSchemeUp()
    endif
endfunction

function! JHSchemePerhapsDown()
    if getline(line('.'))[col('.')-1] != ')'
        call JHSchemeDown()
    endif
endfunction

nnoremap <M-k> :call JHSchemeUp()<CR>
nnoremap <M-j> :call JHSchemeDown()<CR>
nnoremap <M-h> :call JHSchemeLeft()<CR>
nnoremap <M-l> :call JHSchemeRight()<CR>

inoremap <M-k> <C-O>:call JHSchemeUp()<CR>
inoremap <M-j> <C-O>:call JHSchemeDown()<CR>
inoremap <M-h> <C-O>:call JHSchemeLeft()<CR>
inoremap <M-l> <C-O>:call JHSchemeRight()<CR>

"nnoremap <M-h> :call searchpair('(', '', ')', 'Wb')<CR>
"nnoremap <M-l> :call searchpair('(', '', ')', 'W')<CR>
nnoremap ) ])
nnoremap ( [(
nnoremap =) 99[(=%

"nnoremap <buffer> I :call JHSchemeUp()<CR>i<LEFT>
"nnoremap <buffer> A :call JHSchemeDown()<CR>a

"nnoremap <buffer> O :call JHSchemePerhapsUp()<CR>i<CR><UP><END>
"nnoremap <buffer> o :call JHSchemePerhapsDown()<CR>a<CR>

"vnoremap <buffer> S di(<C-R>")<LEFT><C-O>:call JHSchemeUp()<CR><RIGHT>

"nnoremap <buffer> sb :call JHSchemePerhapsDown()<CR>a)<LEFT><ESC>:call JHSchemeUp()<CR>i(
"nnoremap <buffer> sw ea)<LEFT><ESC>b:call JHSchemeBeginSExp()<CR>i(
