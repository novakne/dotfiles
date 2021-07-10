-- -----------------------------------------------
-- [ USER COMMANDS ]
-- -----------------------------------------------
-- Make current buffer executable
vim.cmd [[command! Chmodx :!chmod 774 %]]

-- Change to directory of current file
vim.cmd [[command! Cd :cd %:p:h]]
vim.cmd [[command! Cdw :lcd %:p:h]]

-- Remove consecutive empty lines
vim.cmd [[command! Dline :%s/\n\{3,}/\r\r/e]]

-- -----------------------------------------------
-- [ GREP ]
-- -----------------------------------------------
-- '[ word ]'
vim.cmd [[command! Gpart :grep '\[{1}\s+\w.*\s+\]{1}$' %]]

-- 'TODO/FIXME'
vim.cmd [[command! Gtodo :grep '\(TODO\|FIXME\)']]
