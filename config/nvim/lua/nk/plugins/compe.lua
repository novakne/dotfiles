-- [ Compe ]
if packer_plugins['nvim-compe'] and packer_plugins['nvim-compe'].loaded then
    local utils = require 'nk.utils'
    local map = utils.bind

    require'compe'.setup {
        enabled = true,
        autocomplete = true,
        debug = false,
        min_length = 1,
        preselect = 'disable',
        throttle_time = 80,
        source_timeout = 200,
        incomplete_delay = 400,
        max_abbr_width = 100,
        max_kind_width = 100,
        max_menu_width = 100,
        documentation = true,

        source = {
            buffer = true,
            calc = false,
            emoji = false,
            luasnip = false,
            nvim_lsp = true,
            nvim_lua = true,
            nvim_treesitter = false,
            omni = false,
            path = true,
            snippets_nvim = false,
            spell = false,
            tags = true,
            ultisnips = false,
            vim_lsc = false,
            vim_lsp = false,
            vsnip = false,
        },
    }

    map('i', '<Tab>', 'v:lua.MUtils.tab_complete()', { expr = true })
    map('s', '<Tab>', 'v:lua.MUtils.tab_complete()', { expr = true })
    map('i', '<S-Tab>', 'v:lua.MUtils.s_tab_complete()', { expr = true })
    map('s', '<S-Tab>', 'v:lua.MUtils.s_tab_complete()', { expr = true })
end

