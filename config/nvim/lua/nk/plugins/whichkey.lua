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
                motions = true, -- adds help for motions
                text_objects = true, -- help for text objects triggered after entering an operator
                windows = true, -- default bindings on <c-w>
                nav = true, -- misc bindings to work with windows
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
        w = 'Save',
        z = 'Quit',
        x = 'Quit all',
        o = 'Open files',
        b = 'Buffers',
        r = 'Live grep',
        k = 'Grep String',
        ['!'] = 'Quit without saving',
        [';'] = 'Append ; at the end of line',
        [','] = 'Append , at the end of line',
        h = 'Colorizer',
        q = 'Bdelete',
        e = 'Toggle term',
        ['à'] = 'Toggle Number',

        c = {
            name = '+Quickfix',
            c = 'Close',
            o = 'Open',
            p = 'Prev',
            n = 'Next',
        },

        f = {
            name = '+Fzf',
            o = 'Search files recursively',
            b = 'Search between open buffers',
            r = 'Ripgrep',
            l = 'Search lines in buffer',
            L = 'Search lines in dir',
            t = 'Search tags in buffer',
            T = 'Search tags in dir',
            k = 'Search current word',
            ['z='] = 'Spell suggestions',
        },

        g = {
            name = '+GitSign',
            p = 'Previous hunk',
            n = 'Next hunk',
            s = 'Stage hunk',
            u = 'Undo stage hunk',
            r = 'Reset hunk',
            h = 'Preview hunk',
            b = 'Blame line',
        },

        l = {
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
        },

        s = {
            name = '+Grepper',
            g = 'Grepper',
            b = 'Grepper -buffers',
            B = 'Grepper -buffer',
            w = 'Grepper -cword',
        },

        t = {
            name = '+Telescope',

            v = {
                name = '+Vim',
                o = 'Old files',
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
                d = 'Definitions',
                e = 'Document diagnostics',
                E = 'Workspaces diagnostics',
            },

            g = {
                name = '+Git',
                c = 'Commits',
                r = 'Commits ( buffer )',
                b = 'Branches',
                s = 'Status',
            },

            t = { name = '+Treesitter', f = 'Treesitter' },
        },
    }, { prefix = '<leader>' })

end

