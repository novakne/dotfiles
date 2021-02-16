-- [ compe & vim-vsnip ]

MUtils.plugin_loaded('compe')

local utils = require 'my.utils'
local map = require 'my.utils'.bind

require'compe'.setup {
  enabled = true,
  -- autocomplete = true,
  debug = false,
  min_length = 2,
  preselect = 'disable',
  throttle_time = 80,
  source_timeout = 200,
  incomplete_delay = 400,
  max_abbr_width = 100,
  max_kind_width = 100,
  max_menu_width = 100,
  documentation = true,
  allow_prefix_unmatch = false,

  source = {
    path = true,
    buffer = true,
    calc = true,
    omni = true,
    vsnip = true,
    nvim_lsp = true,
    nvim_lua = true,
    spell = true,
    tags = true,
    snippetSupport = true,
    treesitter = true,
  },
}

map("i", "<Tab>", "v:lua.MUtils.tab_complete()", {expr = true})
map("s", "<Tab>", "v:lua.MUtils.tab_complete()", {expr = true})
map("i", "<S-Tab>", "v:lua.MUtils.s_tab_complete()", {expr = true})
map("s", "<S-Tab>", "v:lua.MUtils.s_tab_complete()", {expr = true})

local autocmd = {
  InlayHints = {
    {
      'InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost',
      '*.rs',
      'lua require"lsp_extensions".inlay_hints{ prefix = " » ", highlight = "NonText", enabled = {"ChainingHint"} }',
    },
  },
}

utils.create_augroups(autocmd)
