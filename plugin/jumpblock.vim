if exists('g:loaded_jumpblock')
    finish
endif
let g:loaded_jumpblock = 1
command! JumpBlock call jumpblock#JumpBlock()
command! RjumpBlock call jumpblock#RJumpBlock()

