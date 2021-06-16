vim.cmd('wincmd J')
vim.cmd('resize 15')

require'nk.utils'.bind_bufnr('n', 'q', '<CMD>q<CR>')
