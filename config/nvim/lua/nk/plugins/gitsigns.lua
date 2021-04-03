-- [ Gitsigns ]
MUtils.plugin_loaded('gitsigns')

local gitsigns = require 'gitsigns'

gitsigns.setup {
    signs = {
        add = {hl = 'SignifyLineAdd', text = '+', show_count = true},
        change = {hl = 'SignifyLineChange', text = '»', show_count = true},
        delete = {
            hl = 'SignifySignChangeDelete',
            text = '✗',
            show_count = true,
        },
        topdelete = {
            hl = 'SignifySignChangeDelete',
            text = '✗',
            show_count = true,
        },
        changedelete = {
            hl = 'SignifyLineChange',
            text = '»',
            show_count = true,
        },
    },
    numhl = false,
    keymaps = {
        -- Default keymap options
        noremap = true,
        buffer = true,

        ['n <leader>gs'] = '<CMD>lua require"gitsigns".stage_hunk()<CR>',
        ['n <leader>gu'] = '<CMD>lua require"gitsigns".undo_stage_hunk()<CR>',
        ['n <leader>gr'] = '<CMD>lua require"gitsigns".reset_hunk()<CR>',
        ['n <leader>gp'] = '<CMD>lua require"gitsigns".preview_hunk()<CR>',
        ['n <leader>gb'] = '<CMD>lua require"gitsigns".blame_line()<CR>',

        -- Text objects
        ['o ih'] = ':<C-U>lua require"gitsigns".text_object()<CR>',
        ['x ih'] = ':<C-U>lua require"gitsigns".text_object()<CR>',
    },
    watch_index = {interval = 1000},
    sign_priority = 6,
    status_formatter = nil, -- Use default
}

