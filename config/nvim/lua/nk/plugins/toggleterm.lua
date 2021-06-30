-- [ Toggleterm ]
if packer_plugins['nvim-toggleterm.lua'] and packer_plugins['nvim-toggleterm.lua'].loaded then
    require'toggleterm'.setup {
        -- size can be a number or function which is passed the current terminal
        size = function( term )
            if term.direction == 'horizontal' then
                return 15
            elseif term.direction == 'vertical' then
                return vim.o.columns * 0.4
            end
        end,
        open_mapping = [[<C-e>]],
        shade_filetypes = {},
        shade_terminals = false,
        -- the degree by which to darken to terminal colour
        -- default: 1 for dark backgrounds, 3 for light
        shading_factor = 1,
        start_in_insert = true,
        persist_size = true,
        close_on_exit = true, -- close the terminal window when the process exits
        direction = 'vertical',
    }
end

