-- [ Colorizer ]
if packer_plugins['nvim-colorizer.lua'] then

    local utils = require 'nk.utils'
    local map = utils.bind

    map('n', '<Leader>h', '<CMD>ColorizerToggle<CR>')

end

