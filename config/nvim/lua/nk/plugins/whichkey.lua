-- [ Which-Key]
if packer_plugins['which-key.nvim'] and packer_plugins['which-key.nvim'].loaded then

    local wk = require 'which-key'
    wk.setup {
        plugins = {
            marks = true, -- shows a list of your marks on ' and `
            registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
            -- the presets plugin, adds help for a bunch of default keybindings in Neovim
            -- No actual key bindings are created
            presets = {
                operators = true, -- adds help for operators like d, y, ...
                motions = false, -- adds help for motions
                text_objects = false, -- help for text objects triggered after entering an operator
                windows = false, -- default bindings on <c-w>
                nav = false, -- misc bindings to work with windows
                z = true, -- bindings for folds, spelling and others prefixed with z
                g = true, -- bindings for prefixed with g
            },
        },
        icons = {
            breadcrumb = '', -- symbol used in the command line area that shows your active key combo
            separator = 'ﰲ', -- symbol used between a key and it's label
            group = '+', -- symbol prepended to a group
        },
        window = {
            border = 'single', -- none, single, double, shadow
            position = 'bottom', -- bottom, top
            margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
            padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
        },
        layout = {
            height = { min = 4, max = 25 }, -- min and max height of the columns
            width = { min = 20, max = 50 }, -- min and max width of the columns
            spacing = 3, -- spacing between columns
        },
        hidden = {
            '<silent>',
            '<cmd>',
            '<Cmd>',
            '<CR>',
            'call',
            'lua',
            '^:',
            '^ ',
        }, -- hide mapping boilerplate
        show_help = true, -- show help message on the command line when the popup is visible
    }

    wk.register({
        ['!'] = 'Quit without saving',
        [','] = 'Append , at the end of line',
        [';'] = 'Append ; at the end of line',
        ['à'] = 'Toggle Number',
        b = 'Buffers',
        h = 'Colorizer',
        k = 'Grep String',
        o = 'Open files',
        q = 'Bdelete',
        r = 'Live grep',
        w = 'Save',
        z = 'Quit',

        c = {
            name = '+Quickfix',
            c = 'Close',
            n = 'Next',
            o = 'Open',
            p = 'Prev',
        },

        g = {
            name = '+GitSign',
            b = 'Blame line',
            h = 'Preview hunk',
            n = 'Next hunk',
            p = 'Previous hunk',
            r = 'Reset hunk',
            s = 'Stage hunk',
            u = 'Undo stage hunk',
        },

        l = {
            name = '+LSP',
            D = 'Declaration',
            K = 'Range code action',
            c = 'Code action',
            d = 'Finder',
            e = 'Show line diagnostic',
            f = 'Format',
            i = 'Implementation',
            k = 'Hover doc',
            l = 'Preview definition',
            n = 'Prev diagnostic',
            p = 'Next diagnostic',
            q = 'Set loclist',
            r = 'Reference',
            s = 'Document Symbol',
            t = 'Signature help',
        },

        s = {
            name = '+Grepper',
            B = 'Grepper -buffer',
            b = 'Grepper -buffers',
            g = 'Grepper',
            w = 'Grepper -cword',
        },

        t = {
            name = '+Telescope',

            v = {
                name = '+Vim',
                ['='] = 'Spell suggest',
                c = 'Commands',
                l = 'Loclist',
                o = 'Old files',
                q = 'Quickfix',
                r = 'Current buffer fuzzy find',
                t = 'Tags',
                p = 'Registers',
            },

            l = {
                name = '+Lsp',
                E = 'Workspaces diagnostics',
                a = 'Range code action',
                c = 'Code action',
                d = 'Definitions',
                e = 'Document diagnostics',
                r = 'Reference',
                s = 'Document symbol',
                w = 'Workspace symbol',
            },

            g = {
                name = '+Git',
                b = 'Branches',
                c = 'Commits',
                r = 'Commits ( buffer )',
                s = 'Status',
            },

            t = { name = '+Treesitter', f = 'Treesitter' },

            x = {
                name = '+LspTrouble',
                d = 'Document diagnostics',
                l = 'Loclist',
                q = 'Quickfix',
                r = 'Lsp Reference',
                w = 'Workspace diagnostics',
            },

        },
    }, { prefix = '<leader>' })

end

