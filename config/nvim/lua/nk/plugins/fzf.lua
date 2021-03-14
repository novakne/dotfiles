-- [ FZF ]

if not vim.fn.exists('fzf') then return end

local map = require 'nk.utils'.bind

vim.g.fzf_layout = {window = {width = 0.8, height = 0.9}}
vim.g.fzf_buffers_jump = 1
vim.g.fzf_action = {
  ['ctrl-t'] = 'tab split',
  ['ctrl-h'] = 'split',
  ['ctrl-v'] = 'vsplit',
}

map('n', '<Leader>fo', '<CMD>Files<CR>')          -- Search files recursively
map('n', '<Leader>fb', '<CMD>Buffers<CR>')        -- Search between open files
map('n', '<Leader>fr', '<CMD>Rg<CR>')             -- Ripgrep
map('n', '<Leader>fl', '<CMD>BLines<CR>')         -- Search lines in buffer
map('n', '<Leader>fL', '<CMD>Lines<CR>')          -- Search lines in dir
map('n', '<Leader>ft', '<CMD>BTags<CR>')          -- Search ctags in buffer
map('n', '<Leader>fT', '<CMD>Tags<CR>')           -- Search ctags in dir
map('n', '<Leader>fk', '<CMD>Rg <C-R><C-W><CR>')  -- Search current word under cursor

-- Vim spelling suggestions with fzf
-- ( https://coreyja.com/blog/2018/11/10/vim-spelling-suggestions-fzf.html )
map('n', '<Leader>fz=', [[ <CMD>lua require'nk.bind.fn'.fzf_spell()<CR> ]])

