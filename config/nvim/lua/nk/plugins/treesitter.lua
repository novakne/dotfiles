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
            select = {
                enable = true,
                keymaps = {
                    -- You can use the capture groups defined in textobjects.scm
                    ['af'] = '@function.outer',
                    ['if'] = '@function.inner',
                    ['ac'] = '@class.outer',
                    ['ic'] = '@class.inner',
                },
            },
            move = {
                enable = true,
                goto_next_start = {
                    [']m'] = '@function.outer',
                    [']]'] = '@class.outer',
                },
                goto_next_end = {
                    [']M'] = '@function.outer',
                    [']['] = '@class.outer',
                },
                goto_previous_start = {
                    ['[m'] = '@function.outer',
                    ['[['] = '@class.outer',
                },
                goto_previous_end = {
                    ['[M'] = '@function.outer',
                    ['[]'] = '@class.outer',
                },
            },
            indent = { enable = true },
            rainbow = { enable = true },
            refactor = {
                highlight_definitions = { enable = true },
                highlight_current_scope = { enable = true },
            },
        },
    }

end

