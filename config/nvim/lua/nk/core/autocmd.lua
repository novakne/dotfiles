-- [ Autocmd ]
local ex = vim.api.nvim_exec

-- Auto close popup menu after completion
ex([[
  augroup CompletAuto
    autocmd!
    autocmd CompleteDone * if pumvisible() == 0 | pclose | endif
    augroup END
]], false)

-- Fix Neovim opening at te wrong size
-- e.g. `footclient nvim`
ex([[
  augroup FixNvim
    autocmd!
    autocmd VimEnter * :silent exec "!kill -s SIGWINCH $PPID"
    augroup END
]], false)

-- Highlight on yank
vim.api.nvim_exec([[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="Visual", timeout=500}()
  augroup END
]], false)

ex([[
  augroup Compe
    autocmd!
    autocmd BufEnter * let g:compe_enabled = v:true
    autocmd FileType TelescopePrompt let g:compe_enabled = v:false
    augroup END
]], false)

ex([[
  augroup FtDetect
    autocmd!
    autocmd BufRead,BufNewFile *.conf setlocal filetype=cfg
    autocmd BufRead,BufNewFile *.jsx setlocal filetype=javascript.jsx
    autocmd BufRead,BufNewFile *.log,*_log,*.LO,G*_LOG set filetype=log
    autocmd BufRead,BufNewFile *.rasi setlocal filetype=css
    augroup END
]], false)

ex([[
  augroup Illuminate
    autocmd!
    autocmd VimEnter * hi link illuminatedWord underline
    augroup END
]], false)

-- Remap escape to leave terminal mode
ex([[
  augroup Terminal
    autocmd!
    autocmd TermOpen * tnoremap <buffer> <Esc> <c-\><c-n>
    autocmd TermOpen * set nonu
  augroup END
]], false)

ex([[
  augroup Grepper
    autocmd!
    autocmd User Grepper call setqflist([], 'r', {'context': {'bqf': {'pattern_hl': histget('/')}}}) | botright copen
  augroup END
]], false)

