-- [ Vim-bbye ]
if packer_plugins['vim-bbye'] then
    local map = require'nk.utils'.bind
    map('n', '<Leader>q', '<CMD>Bdelete<CR>')
end

