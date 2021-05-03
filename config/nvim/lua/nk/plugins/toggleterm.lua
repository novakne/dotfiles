-- [ Toggleterm ]
if packer_plugins['nvim-toggleterm.lua'] then

    local tt = require 'toggleterm'

    tt.setup {
        size = 15,
        open_mapping = [[<C-e>]],
        shade_filetypes = {},
        shade_terminals = false,
        -- the degree by which to darken to terminal colour
        -- default: 1 for dark backgrounds, 3 for light
        shading_factor = 1,
        start_in_insert = true,
        persist_size = true,
        close_on_exit = true, -- close the terminal window when the process exits
        direction = 'horizontal',
    }

end

