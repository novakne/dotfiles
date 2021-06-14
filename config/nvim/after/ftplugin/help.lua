vim.call.wincmd('J')
vim.call.resize(15)

require'nk.utils'.bind_bufnr('n', 'q', '<CMD>q<CR>')
