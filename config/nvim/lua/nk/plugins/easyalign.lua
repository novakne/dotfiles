-- [ EasyAlign ]
if packer_plugins['vim-easy-align'] then
    local map = require'nk.utils'.bind

    -- Start interactive EasyAlign for a motion/text object (e.g. gaip)
    map('n', 'ga', '<Plug>(EasyAlign)', {silent = true})
    -- Start interactive EasyAlign in visual mode (e.g. vipga)
    map('x', 'ga', '<Plug>(EasyAlign)', {silent = true})

end

