-- [ AUTOCMD ]
local utils = require 'my.utils'

local autocmd = {
  -- Auto close popup menu when finish completion
  CompletAuto = {{'CompleteDone', '*', 'if pumvisible() == 0 | pclose | endif'}},
  HighlightYank = {
    {
      'TextYankPost',
      '*',
      'silent! lua require"vim.highlight".on_yank {higroup="Comment", timeout=500}',
    },
  },
  Compe = {
    {'BufEnter', '*', 'let g:compe_enabled = v:true'},
    {'FileType', 'TelescopePrompt', 'let g:compe_enabled = v:false'},
  },
}

utils.create_augroups(autocmd)

