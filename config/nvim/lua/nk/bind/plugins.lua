-- [ MAPPING FOR PLUGINS ]
if not vim.fn.exists('packer') then return end

local utils = require 'nk.utils'
local map = utils.bind


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

map('n', '<Leader>', [[:<c-u>WhichKey '<Space>'<CR>]])
map('n', '<LocalLeader>', [[:<c-u>WhichKey  ','<CR>]])

