setlocal shiftwidth=2

" Lua-Formatter
noremap <buffer> <silent> <LocalLeader>f :LF<CR>
command! LF !lua-format -i %

