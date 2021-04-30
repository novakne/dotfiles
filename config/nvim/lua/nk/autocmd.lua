-- [ Autocmd ]
local utils = require 'nk.utils'

local autocmd = {
    -- Auto close popup menu after completion
    CompletAuto = {
        { 'CompleteDone', '*', 'if pumvisible() == 0 | pclose | endif' },
    },
    -- Fix Neovim opening at te wrong size
    -- e.g. `footclient nvim`
    FixNvim = { { 'VimEnter', '*', ':silent exec "!kill -s SIGWINCH $PPID"' } },
    HighlightYank = {
        {
            'TextYankPost',
            '*',
            'silent! lua require"vim.highlight".on_yank {higroup="Comment", timeout=500}',
        },
    },
    Compe = {
        { 'BufEnter', '*', 'let g:compe_enabled = v:true' },
        { 'FileType', 'TelescopePrompt', 'let g:compe_enabled = v:false' },
    },
    FtDetect = {
        { 'BufRead,BufNewFile', '*.conf', 'setlocal filetype=cfg' },
        { 'BufRead,BufNewFile', '*.jsx', 'setlocal filetype=javascript.jsx' },
        { 'BufRead,BufNewFile', '*.log,*_log,*.LO,G*_LOG', 'set filetype=log' },
        { 'BufRead,BufNewFile', '*.rasi', 'setlocal filetype=css' },
    },
    Illuminate = {
      { 'VimEnter', '*', 'hi link illuminatedWord underline'}
    }
}

utils.create_augroups(autocmd)

