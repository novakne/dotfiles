-- [ LOAD CONFIG ]
-- [ Neovim general settings ]
local options = require 'my.options'
local autocmd = require 'my.autocmd'

-- [ Keybind ]
local bind = require 'my.bind.default'
local bind_plugins = require 'my.bind.plugins'

-- [ Plugins settings ]
local plugins = require 'my.plugins'

return {
  options = options,
  autocmd = autocmd,
  bind = bind,
  bind_plugins = bind_plugins,
  plugins = plugins,
}

