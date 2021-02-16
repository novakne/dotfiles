-- [ MAPPING FOR PLUGINS ]
if not vim.fn.exists('packer') then return end

local utils = require 'my.utils'
local map = utils.bind

-- FTerm
map('n', '<Leader>c', '<CMD>FTermToggle<CR>')
map('t', '<Leader>c', '<C-\\><C-n><CMD>lua require"FTerm".toggle()<CR>')

-- Hop
map('n', 'fw', '<CMD>lua require"hop".hint_words()<CR>')
map('n', 'fp', '<CMD>lua require"hop".hint_patterns()<CR>')
map('n', 'fc', '<CMD>lua require"hop".hint_char1()<CR>')
map('n', 'f$', '<CMD>lua require"hop".hint_char2()<CR>')

map('n', '<Leader>h', '<CMD>ColorizerToggle<CR>')  -- Nvim Colorizer
map('n', '<Leader>q', '<CMD>Bdelete<CR>')          -- Vim-Bbye

-- Start interactive EasyAlign for a motion/text object (e.g. gaip)
map('n', 'ga', '<Plug>(EasyAlign)', {silent = true})
-- Start interactive EasyAlign in visual mode (e.g. vipga)
map('x', 'ga', '<Plug>(EasyAlign)', {silent = true})

