-- [ Vim-bbye ]
if packer_plugins['vim-bbye'] then

    local utils = require 'nk.utils'
    local map = utils.bind

    map('n', '<Leader>q', '<CMD>Bdelete<CR>')

end

