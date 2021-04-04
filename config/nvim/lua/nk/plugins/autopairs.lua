-- [ Nvim-autopairs ]
if packer_plugins['nvim-autopairs'] and packer_plugins['nvim-autopairs'].loaded then

    local npairs = require 'nvim-autopairs'
    local map = require'nk.utils'.bind

    npairs.setup {
        break_line_filetype = nil, -- enable this rule for all filetypes
        pairs_map = {
            ['\''] = '\'',
            ['"'] = '"',
            ['('] = ')',
            ['['] = ']',
            ['{'] = '}',
            ['`'] = '`',
        },
        disable_filetype = {'TelescopePrompt'},
        html_break_line_filetype = {
            'html',
            'vue',
            'typescriptreact',
            'svelte',
            'javascriptreact',
        },
        -- ignore alphanumeric, operators, quote, curly brace, and square bracket
        ignored_next_char = '[%w%.%+%-%=%/%,"\'{%[]',
    }

    vim.g.completion_confirm_key = ''

    map('i', '<CR>', 'v:lua.MUtils.completion_confirm()',
        {expr = true, noremap = true})

end

