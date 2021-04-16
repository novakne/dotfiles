-- [ Which-Key]
if packer_plugins['vim-which-key'] and packer_plugins['vim-which-key'].loaded then

    vim.fn['which_key#register']('<Space>', 'g:which_key_map')

    vim.g.which_key_sep = ' ﰲ '
    vim.g.which_key_hspace = 2
    vim.g.which_key_use_floating_win = 1

    local M = {}

    M = {
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
    }

    M.c =
        { name = '+Quickfix', c = 'Close', o = 'Open', p = 'Prev', n = 'Next' }

    M.f = {
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
    }

    M.g = {
        name = '+GitSign',
        p = 'Previous hunk',
        n = 'Next hunk',
        s = 'Stage hunk',
        u = 'Undo stage hunk',
        r = 'Reset hunk',
        h = 'Preview hunk',
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

    M.s = {
        name = '+Grepper',
        g = 'Grepper',
        b = 'Grepper -buffers',
        B = 'Grepper -buffer',
        w = 'Grepper -cword',
    }

    M.t = {
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
    }

    -- Define prefix dictionary
    vim.g.which_key_map = M

end

