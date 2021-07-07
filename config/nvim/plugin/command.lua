-- -----------------------------------------------
-- [ USER COMMANDS ]
-- -----------------------------------------------
-- Map :Format to vim.lsp.buf.formatting()
vim.cmd [[command! Format execute 'lua vim.lsp.buf.formatting()']]

-- Make current buffer executable
vim.cmd [[command! Chmodx :!chmod 774 %]]

-- Change to directory of current file
vim.cmd [[command! Cd :cd %:p:h]]
vim.cmd [[command! Cdw :lcd %:p:h]]

-- Fix Treesitter
vim.cmd [[command! FixTs write | edit | TSBufEnable highlight]]

-- Remove consecutive empty lines
vim.cmd [[command! Dline :%s/\n\{3,}/\r\r/e]]

-- -----------------------------------------------
-- [ GREP ]
-- -----------------------------------------------
-- '[ word ]'
vim.cmd [[command! Gpart :grep '\[{1}\s+\w.*\s+\]{1}$' %]]

-- 'TODO/FIXME'
vim.cmd [[command! Gtodo :grep '\(TODO\|FIXME\)']]

-- Search with ripgrep, open in fzf, select, and display in quickfix to use `cfdo`
vim.cmd [[command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --follow --hidden --glob "!{.git/*,*.lock}" --color "always" -- ' . shellescape(<q-args>), 1, <bang>0)]]

