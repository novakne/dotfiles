-- [ Treesitter ]
if packer_plugins['nvim-treesitter'] and
    packer_plugins['nvim-treesitter'].loaded then
    local ts = require 'nvim-treesitter.configs'

    ts.setup {
        ensure_installed = {
            'bash',
            'c',
            'zig',
            'query',
            'comment',
            'regex',
            'lua',
            'fennel',
            'zig',
        },
        highlight = {
            enable = true, -- false will disable the whole extension
            disable = {},
        },
        textobjects = {
            select = { enable = false },
            move = { enable = false },
            indent = { enable = true },
            rainbow = { enable = true },
            refactor = {
                highlight_definitions = { enable = true },
                highlight_current_scope = { enable = true },
            },
        },
        query_linter = {
            enable = true,
            use_virtual_text = true,
            lint_events = { 'BufWrite', 'CursorHold' },
        },
    }
end

