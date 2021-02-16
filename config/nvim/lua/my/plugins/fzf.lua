-- [ FZF ]

if not vim.fn.exists('fzf') then return end

local bind = require 'my.utils'.bind

vim.g.fzf_layout = {window = {width = 0.8, height = 0.9}}
vim.g.fzf_buffers_jump = 1
vim.g.fzf_action = {
  ['ctrl-t'] = 'tab split',
  ['ctrl-h'] = 'split',
  ['ctrl-v'] = 'vsplit',
}

map('n', '<Leader>o', '<CMD>Files<CR>')          -- Search files recursively
map('n', '<Leader>b', '<CMD>Buffers<CR>')        -- Search between open files
map('n', '<Leader>r', '<CMD>Rg<CR>')             -- Ripgrep
map('n', '<Leader>l', '<CMD>BLines<CR>')         -- Search lines in buffer
map('n', '<Leader>L', '<CMD>Lines<CR>')          -- Search lines in dir
map('n', '<Leader>t', '<CMD>BTags<CR>')          -- Search ctags in buffer
map('n', '<Leader>T', '<CMD>Tags<CR>')           -- Search ctags in dir
map('n', '<Leader>k', '<CMD>Rg <C-R><C-W><CR>')  -- Search current word under cursor

-- Vim spelling suggestions with fzf
-- ( https://coreyja.com/blog/2018/11/10/vim-spelling-suggestions-fzf.html )
map('n', 'z=', [[ <CMD>lua require'my.bind.fn'.fzf_spell()<CR> ]])

