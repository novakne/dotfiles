-- [ Neovim general settings ]
local options = require 'nk.options'
local autocmd = require 'nk.autocmd'

-- [ Keybind ]
local bind = require 'nk.bind.default'
local bind_plugins = require 'nk.bind.plugins'

-- [ Plugins settings ]
local plugins = require 'nk.plugins'

return {
    options = options,
    autocmd = autocmd,
    bind = bind,
    bind_plugins = bind_plugins,
    plugins = plugins,
}

