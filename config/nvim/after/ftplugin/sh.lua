vim.bo.textwidth  = 80
vim.bo.shiftwidth = 0
vim.bo.expandtab  = false

vim.cmd [[command! FmtSh :!shfmt -fn -ci -w %]]
