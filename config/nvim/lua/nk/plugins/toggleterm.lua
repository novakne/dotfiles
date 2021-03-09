-- [ Toggleterm ]

MUtils.plugin_loaded('toggleterm')
local tt = require 'toggleterm'

tt.setup{
  size = 15,
  open_mapping = [[<Leader>e]],
  shade_filetypes = {},
  shade_terminals = false,
  -- the degree by which to darken to terminal colour
    -- default: 1 for dark backgrounds, 3 for light
  shading_factor = 1,
  start_in_insert = true,
  persist_size = true,
  direction = 'horizontal',
}

