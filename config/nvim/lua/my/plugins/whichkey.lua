-- [ Which-Key]

vim.fn['which_key#register']('<Space>', "g:which_key_map")

vim.g.which_key_sep = ' ﰲ '
vim.g.which_key_hspace = 2
vim.g.which_key_use_floating_win = 1
-- vim.g.which_key_floating_relative_win = 1
-- vim.g.which_key_floating_opts = {
--   row = '-1',
--   col = '-1',
--   width = 300,
--   height = 40,
-- }

local M = {}

M = {
  w = 'Save',
  z = 'Quit',
  x = 'Quit all',
  o = 'Open files',
  r = 'Live grep',
  k = 'Grep String',
  ['!'] = 'Quit without saving',
  [';'] = 'Append ; at the end of line',
  [','] = 'Append , at the end of line',
  h = 'Colorizer',
  q = 'Bdelete',
  e = 'Toggle term',
  ['à'] = 'Toggle Number',
}

M.c = {
  name = '+Quickfix',
  c = 'Close',
  o = 'Open',
  p = 'Prev',
  n = 'Next',
}

M.g = {
  name = '+GitSign',
  s = 'Stage hunk',
  u = 'Undo stage hunk',
  r = 'Reset hunk',
  p = 'Preview hunk',
  b = 'Blame line',
}

M.l = {
  name = '+LSP',
  k = 'Hover doc',
  d = 'Finder',
  c = 'Code action',
  K = 'Range code action',
  t = 'Signature help',
  l = 'Preview definition',
  e = 'Show line diagnostic',
  p = 'Next diagnostic',
  n = 'Prev diagnostic',
  D = 'Declaration',
  i = 'Implementation',
  r = 'Reference',
  s = 'Document Symbol',
  f = 'Format',
  q = 'Set loclist',
}

M.t = {
  name = '+Telescope',

  v = {
    name = '+Vim',
    o = 'Old files',
    b = 'Buffers',
    r = 'Current buffer fuzzy find',
    c = 'Commands',
    t = 'Tags',
    q = 'Quickfix',
    l = 'Loclist',
    ['='] = 'Spell suggest',
  },

  l = {
    name = '+Lsp',
    r = 'Reference',
    s = 'Document symbol',
    w = 'Workspace symbol',
    c = 'Code action',
    a = 'Range code action',
  },

  g = {
    name = '+Git',
    c = 'Commits',
    r = 'Commits ( buffer )',
    b = 'Branches',
    s = 'Status',
  },

  t = {
    name = '+Treesitter',
    f = 'Treesitter',
  },
}

-- Define prefix dictionary
vim.g.which_key_map = M

