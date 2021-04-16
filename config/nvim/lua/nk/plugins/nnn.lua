-- [ Nnn ]
if packer_plugins['nnn.vim'] then

    local map = require'nk.utils'.bind

    vim.g['nnn#layout'] = {
        window = { width = 0.5, height = 0.6, highlight = 'Debug' },
    }
    vim.g['nnn#set_default_mappings'] = 0
    vim.g['nnn#action'] = {
        ['<c-t>'] = 'tab split',
        ['<c-h>'] = 'split',
        ['<c-v>'] = 'vsplit',
    }
    vim.g['nnn#command'] = 'nnn -eH'

    -- Start in the current file's directory
    map('n', '<F6>', '<CMD>NnnPicker %:p:h<CR>')

end

