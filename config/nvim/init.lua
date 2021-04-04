-- [ Neovim general settings ]
local options = require 'nk.options'
local autocmd = require 'nk.autocmd'

-- [ Keybind ]
local bind = require 'nk.bind.default'

-- [ Plugins settings ]
local plugins = require 'nk.plugins'

return {
    options = options,
    autocmd = autocmd,
    bind = bind,
    plugins = plugins,
}

