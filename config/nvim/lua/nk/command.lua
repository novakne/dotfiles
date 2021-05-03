-- [ User commands ]
-- Map :Format to vim.lsp.buf.formatting()
vim.cmd [[command! Format execute 'lua vim.lsp.buf.formatting()']]

-- Make current buffer executable
vim.cmd [[command! Chmodx :!chmod 774 %]]

-- Change to directory of current file
vim.cmd [[command! Cd :cd %:p:h]]
vim.cmd [[command! Cdw :lcd %:p:h]]
vim.cmd [[command! Cdt :tcd %:p:h]]

-- Fix Treesitter
vim.cmd [[command! FixTs write | edit | TSBufEnable highlight]]

-- Grep '[ word ]'
vim.cmd [[command! Gpart :grep '\[{1}\s+\w.*\s+\]{1}$' %]]

