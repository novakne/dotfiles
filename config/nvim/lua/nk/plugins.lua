-- -----------------------------------------------
-- [ PLUGINS ]
-- -----------------------------------------------
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/opt/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({
        'git',
        'clone',
        'https://github.com/wbthomason/packer.nvim',
        install_path,
    })
    execute 'packadd packer.nvim'
end

-- Only required if you have packer in your `opt` pack
vim.cmd [[packadd packer.nvim]]

return require'packer'.startup(function()
    -- Packer can manage itself as an optional plugin
    use { 'wbthomason/packer.nvim', opt = true }

    -- -------------------------------------------
    -- [ LSP ]
    -- -------------------------------------------
    use {
        'neovim/nvim-lspconfig',
        config = function()
            require'nk.plugins.lsp'.init()
        end,
    }

    use {
        'hrsh7th/nvim-compe',
        config = function()
            require 'nk.plugins.compe'
        end,
    }

    use {
        'gfanto/fzf-lsp.nvim',
        config = function()
            require'fzf_lsp'.setup()
        end,
    }

    use 'ray-x/lsp_signature.nvim'

    -- -------------------------------------------
    -- [ TREESITTER ]
    -- -------------------------------------------
    use {
        'nvim-treesitter/nvim-treesitter',
        requires = {
            {
                'nvim-treesitter/playground',
                cmd = { 'TSPlaygroundToggle', 'TSHighlightCapturesUnderCursor' },
            },
        },
        run = function()
            vim.cmd [[TSUpdate]]
        end,
        config = function()
            require 'nk.plugins.treesitter'
        end,
    }

    -- -------------------------------------------
    -- [ FILES ]
    -- -------------------------------------------
    use {
        'mcchrish/nnn.vim',
        cmd = { 'Np', 'NnnPicker' },
        keys = '<F6>',
        config = function()
            require'nnn'.setup {
                set_default_mappings = false,
                session = 'global',
                layout = {
                    window = { width = 0.5, height = 0.6, highlight = 'Debug' },
                },
                command = 'nnn -eH',
                action = {
                    ['<c-t>'] = 'tab split',
                    ['<c-h>'] = 'split',
                    ['<c-v>'] = 'vsplit',
                },
            }

            require'nk.utils'.bind('n', '<F6>', '<CMD>NnnPicker %:p:h<CR>')
        end,
    }

    use {
        'TimUntersberger/neogit',
        requires = 'nvim-lua/plenary.nvim',
        cmd = 'Neogit',
        config = function()
            require'neogit'.setup()
        end,
    }

    use '~/.local/share/bld/pkg/fzf'
    use {
        'junegunn/fzf.vim',
        config = function()
            require 'nk.plugins.fzf'
        end,
    }

    use 'kevinhwang91/nvim-bqf'

    -- -------------------------------------------
    -- [ UI ]
    -- -------------------------------------------
    use {
        '~/.local/share/bld/projects/kosmikoa.nvim',
        -- 'https://git.sr.ht/~novakane/kosmikoa.nvim',
        '~/.local/share/bld/projects/argi.nvim',
        -- 'https://git.sr.ht/~novakane/argi.nvim',
    }

    use 'glepnir/galaxyline.nvim'
    use 'RRethy/vim-illuminate'

    -- -------------------------------------------
    -- [ EDITING ]
    -- -------------------------------------------
    use {
        'terrortylor/nvim-comment',
        keys = 'gc',
        config = function()
            require'nvim_comment'.setup({ comment_empty = false })
        end,
    }

    use {
        'junegunn/vim-easy-align',
        keys = 'ga',
        cmd = 'EasyAlign',
        config = function()
            require'nk.utils'.bind('n', 'ga', '<Plug>(EasyAlign)',
                { silent = true })
            require'nk.utils'.bind('x', 'ga', '<Plug>(EasyAlign)',
                { silent = true })
        end,
    }

    use {
        'steelsojka/pears.nvim',
        config = function()
            require'pears'.setup(function( conf )
                conf.remove_pair_on_outer_backspace(false)
                conf.on_enter(function( pears_handle )
                    if vim.fn.pumvisible() == 1 and
                        vim.fn.complete_info().selected ~= -1 then
                        return vim.fn['compe#confirm']('<CR>')
                    else
                        pears_handle()
                    end
                end)
            end)
        end,
    }
    use 'machakann/vim-sandwich'
    use 'tpope/vim-repeat'

    -- -------------------------------------------
    -- [ LANG ]
    -- -------------------------------------------
    use { 'MTDL9/vim-log-highlighting', ft = 'log' }
    use { 'ziglang/zig.vim', ft = 'zig' }

    -- Tools
    use 'editorconfig/editorconfig-vim'

    -- -------------------------------------------
    -- [ MISC ]
    -- -------------------------------------------
    use { 'lewis6991/gitsigns.nvim', requires = 'nvim-lua/plenary.nvim' }

    use {
        'norcalli/nvim-colorizer.lua',
        keys = '<Leader>h',
        cmd = 'ColorizerToggle',
        config = function()
            require'nk.utils'.bind('n', '<Leader>h', '<CMD>ColorizerToggle<CR>')
        end,
    }

    use { 'tweekmonster/startuptime.vim', cmd = 'StartupTime' }
end)

