function! KillRingComplete(findstart, base) 
    if a:findstart
        return col('.')
    else
        let res = [@-]
        for i in range(0, 9)
            let str = getreg(string(i))
            "let len = strlen(str)
            "while stridx("\x00\x0A\x0D", strpart(str, strlen(str)-1, 1)) >= 0
            "while strpart(str, len-1, 1) == "\x0A" || strpart(str, len-1, 1) == "\x0D" || strpart(str, len-1, 1) == "\x00"
            "    let str = strpart(str, 0, strlen(str)-1)
            "endwhile
            let m = match("[\x0a\x0d]+$", str)
            if m >= 0
                let str = strpart(0, m)
            end
            call add(res, str)
        endfor
        return res
    end
endfunction

set completefunc=KillRingComplete

