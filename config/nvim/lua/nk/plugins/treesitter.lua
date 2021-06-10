-- [ Treesitter ]
if packer_plugins['nvim-treesitter'] and
    packer_plugins['nvim-treesitter'].loaded then
    local ts = require 'nvim-treesitter.configs'

    ts.setup {
        ensure_installed = {
            'bash',
            'c',
            'zig',
            'toml',
            'query',
            'comment',
            'regex',
            'yaml',
            'lua',
            'fennel',
            'rust',
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
    }
end

