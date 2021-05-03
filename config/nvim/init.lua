-- [ Neovim general settings ]
local options = require 'nk.options'
local autocmd = require 'nk.autocmd'
local command = require 'nk.command'

-- [ Keybind ]
local bind = require 'nk.bind.default'

-- [ Plugins settings ]
local plugins = require 'nk.plugins'

return {
    options = options,
    autocmd = autocmd,
    command = command,
    bind = bind,
    plugins = plugins,
}

