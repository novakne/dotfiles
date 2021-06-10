-- [ Nnn ]
if packer_plugins['nnn.vim'] and packer_plugins['nnn.vim'].loaded then
    local map = require'nk.utils'.bind

    require'nnn'.setup {
        set_default_mappings = false,
        session = 'global',
        layout = { window = { width = 0.5, height = 0.6, highlight = 'Debug' } },
        command = 'nnn -eH',
        action = {
            ['<c-t>'] = 'tab split',
            ['<c-h>'] = 'split',
            ['<c-v>'] = 'vsplit',
        },
    }

    -- Start in the current file's directory
    map('n', '<F6>', '<CMD>NnnPicker %:p:h<CR>')
end

