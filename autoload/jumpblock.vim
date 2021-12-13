function! s:jump_block_f()
    let cline = getline(".")
    let lastchar = cline[strlen(cline)-1]
    if lastchar == ":"
        let lnum = line(".")
        let start_indent = indent(line("."))
        while indent((lnum+1)->nextnonblank()) > start_indent
            let lnum = (lnum+1)->nextnonblank()
        endwhile
        :call cursor((lnum)->prevnonblank(),1000)
    endif
endfunction

function! s:rev_jump_block_f()
    if indent(".") != 0
        let cline = getline(".")
        let lastchar = cline[strlen(cline)-1]
        let lnum = line(".")
        let start_indent = indent(line("."))
        while indent((lnum-1)->prevnonblank()) >= start_indent
            let lnum = (lnum-1)->prevnonblank()
        endwhile
        :call cursor((lnum-1)->prevnonblank(),1000)
    endif
endfunction
command! JumpBlock call s:jump_block_f()
command! RjumpBlock call s:rev_jump_block_f()
