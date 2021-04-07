-- [ Colorizer ]
if packer_plugins['nvim-colorizer.lua'] then
    local map = require'nk.utils'.bind
    map('n', '<Leader>h', '<CMD>ColorizerToggle<CR>')
end

