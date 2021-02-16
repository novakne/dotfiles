-- [ Telescope ]

MUtils.plugin_loaded('telescope')

local telescope = require 'telescope'
local actions = require 'telescope.actions'
local utils = require 'my.utils'
local map = utils.bind

-- [ options ]
telescope.setup {
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
    },
    prompt_position = 'top',
    prompt_prefix = ' ',
    selection_strategy = 'reset',
    sorting_strategy = 'ascending',
    layout_strategy = 'horizontal',
    layout_defaults = {},
    file_sorter = require'telescope.sorters'.get_fuzzy_file,
    file_ignore_patterns = {},
    generic_sorter = require'telescope.sorters'.get_generic_fuzzy_sorter,
    shorten_path = true,
    winblend = 0,
    width = 0.75,
    preview_cutoff = 120,
    results_height = 1,
    results_width = 0.8,
    border = {},
    borderchars = {'─', '│', '─', '│', '╭', '╮', '╯', '╰'},
    color_devicons = true,
    use_less = true,
    set_env = {['COLORTERM'] = 'truecolor'},
    file_previewer = require'telescope.previewers'.cat.new,
    grep_previewer = require'telescope.previewers'.vimgrep.new,
    qflist_previewer = require'telescope.previewers'.qflist.new,

    -- Global remapping
    mappings = {
      i = {
        ['<C-h>'] = actions.goto_file_selection_split,
        ['<Esc>'] = actions.close, -- Close instead of normal mode
      },
      n = {['<C-h>'] = actions.goto_file_selection_split},
    },

  },
}

-- [ mapping ]
-- file pickers
map('n', '<Leader>o',
  [[<CMD>lua require'telescope.builtin'.find_files({find_command = {'fd', '-i', '-t', 'file', '-H', '-L', '-E', '.git'}})<CR>]])
map('n', '<Leader>r', [[<CMD>lua require'telescope.builtin'.live_grep()<CR>]])
map('n', '<Leader>k', [[<CMD>lua require'telescope.builtin'.grep_string()<CR>]])

-- vim pickers
map('n', '<Leader>b', [[<CMD>lua require'telescope.builtin'.buffers()<CR>]])
map('n', '<Leader>to', [[<CMD>lua require'telescope.builtin'.oldfiles()<CR>]])
map('n', '<Leader>tc', [[<CMD>lua require'telescope.builtin'.commands()<CR>]])
map('n', '<Leader>tt', [[<CMD>lua require'telescope.builtin'.tags()<CR>]])
map('n', '<Leader>tq', [[<CMD>lua require'telescope.builtin'.quickfix()<CR>]])
map('n', '<Leader>tl', [[<CMD>lua require'telescope.builtin'.loclist()<CR>]])
map('n', '<Leader>t=',
  [[<CMD>lua require'telescope.builtin'.spell_suggest()<CR>]])
map('n', '<Leader>tr',
  [[<CMD>lua require'telescope.builtin'.current_buffer_fuzzy_find()<CR>]])

-- lsp pickers
map('n', '<Leader>tlr',
  [[<CMD>lua require'telescope.builtin'.lsp_references()<CR>]])
map('n', '<Leader>tls',
  [[<CMD>lua require'telescope.builtin'.lsp_document_symbols()<CR>]])
map('n', '<Leader>tlw',
  [[<CMD>lua require'telescope.builtin'.lsp_workspace_symbols()<CR>]])
map('n', '<Leader>tlc',
  [[<CMD>lua require'telescope.builtin'.lsp_code_actions()<CR>]])
map('n', '<Leader>tla',
  [[<CMD>lua require'telescope.builtin'.lsp_range_code_actions()<CR>]])

-- git pickers
map('n', '<Leader>tgc',
  [[<CMD>lua require'telescope.builtin'.git_commits()<CR>]])
map('n', '<Leader>tgr',
  [[<CMD>lua require'telescope.builtin'.git_bcommits()<CR>]])
map('n', '<Leader>tgb',
  [[<CMD>lua require'telescope.builtin'.git_branches()<CR>]])
map('n', '<Leader>tgs', [[<CMD>lua require'telescope.builtin'.git_status()<CR>]])

-- treesitter pickers
map('n', '<Leader>tf', [[<CMD>lua require'telescope.builtin'.treesitter()<CR>]])

-- spell
map('n', 'z=', [[<CMD>lua require'telescope.builtin'.spell_suggest()<CR>]])

