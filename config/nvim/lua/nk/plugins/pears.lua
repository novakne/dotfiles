-- [ Nvim-autopairs ]
if packer_plugins['pears.nvim'] and packer_plugins['pears.nvim'].loaded then

    require'pears'.setup(function( conf )
        conf.remove_pair_on_outer_backspace(false)
        conf.on_enter(function( pears_handle )
            if vim.fn.pumvisible() == 1 and vim.fn.complete_info().selected ~=
                -1 then
                return vim.fn['compe#confirm']('<CR>')
            else
                pears_handle()
            end
        end)
    end)
end
