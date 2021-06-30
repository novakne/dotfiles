-- [ NEOVIM ]
vim.g.mapleader      = ' '  -- Change leader key to '<space>'
vim.g.maplocalleader = ','  -- Change local leader to ','

local plugins = require 'nk.plugins'

return { plugins = plugins }

