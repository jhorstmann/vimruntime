function! JHJump()
    let tmp = search("\\v«[^»]*»","W")
endfunction

inoremap <C-J> <C-O>:call JHJump()<CR><C-O>df»
nnoremap <C-J> :call JHJump()<CR>cf»
