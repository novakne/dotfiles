-- [ Gitsigns ]

MUtils.plugin_loaded('gitsigns')

local gitsigns = require 'gitsigns'

gitsigns.setup {
  signs = {
    add = {hl = 'SignifyLineAdd', text = '+', show_count = true},
    change = {hl = 'SignifyLineChange', text = '»', show_count = true},
    delete = {hl = 'SignifySignChangeDelete', text = '✗', show_count = true},
    topdelete = {
      hl = 'SignifySignChangeDelete',
      text = '✗',
      show_count = true,
    },
    changedelete = {hl = 'SignifyLineChange', text = '»', show_count = true},
  },
}
