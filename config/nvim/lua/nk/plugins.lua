-- [ Plugins ]
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

    -- ---------------------------------------------
    -- [ LSP ]
    -- ---------------------------------------------
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
        'glepnir/lspsaga.nvim',
        config = function()
            require 'nk.plugins.lspsaga'
        end,
    }

    -- ---------------------------------------------
    -- [ TREESITTER ]
    -- ---------------------------------------------
    use {
        'nvim-treesitter/nvim-treesitter',
        requires = {
            { 'romgrk/nvim-treesitter-context', after = 'nvim-treesitter' },
            { 'p00f/nvim-ts-rainbow', after = 'nvim-treesitter' },
            {
                'nvim-treesitter/playground',
                cmd = { 'TSPlaygroundToggle', 'TSHighlightCapturesUnderCursor' },
            },
            {
                'nvim-treesitter/nvim-treesitter-refactor',
                after = 'nvim-treesitter',
            },
        },
        run = function()
            vim.cmd [[TSUpdate]]
        end,
        config = function()
            require 'nk.plugins.treesitter'
        end,
    }

    -- ---------------------------------------------
    -- [ FILES ]
    -- ---------------------------------------------
    use {
        'nvim-telescope/telescope.nvim',
        requires = {
            'nvim-lua/popup.nvim',
            'nvim-lua/plenary.nvim',
            'jvgrootveld/telescope-zoxide',
            { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
        },
        config = function()
            require 'nk.plugins.telescope'
        end,
    }

    use {
        'mcchrish/nnn.vim',
        cmd = { 'Np', 'NnnPicker' },
        keys = '<F6>',
        config = function()
            require 'nk.plugins.nnn'
        end,
    }

    use {
        'mhinz/vim-grepper',
        keys = '<Leader>s',
        config = function()
            require 'nk.plugins.grepper'
        end,
    }

    use {
        'TimUntersberger/neogit',
        requires = 'nvim-lua/plenary.nvim',
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

    -- ---------------------------------------------
    -- [ UI ]
    -- ---------------------------------------------
    use {
        '~/.local/share/bld/projects/kosmikoa.nvim',
        -- 'https://git.sr.ht/~novakane/kosmikoa.nvim',
    }

    use {
        '~/.local/share/bld/projects/argi.nvim',
        -- 'https://git.sr.ht/~novakane/argi.nvim',
    }

    use {
        'glepnir/galaxyline.nvim',
        branch = 'main',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
        config = function()
            require 'nk.plugins.galaxyline'
        end,
    }

    use {
        'folke/which-key.nvim',
        config = function()
            require 'nk.plugins.whichkey'
        end,
    }

    use { 'RRethy/vim-illuminate' }

    -- ---------------------------------------------
    -- [ EDITING ]
    -- ---------------------------------------------
    use {
        'terrortylor/nvim-comment',
        keys = 'gc',
        config = function()
            require'nvim_comment'.setup({ comment_empty = false })
        end,
    }

    use {
        'steelsojka/pears.nvim',
        config = function()
            require 'nk.plugins.pears'
        end,
    }

    use {
        'junegunn/vim-easy-align',
        keys = 'ga',
        cmd = 'EasyAlign',
        config = function()
            require 'nk.plugins.easyalign'
        end,
    }

    use {
        'nacro90/numb.nvim',
        config = function()
            require'numb'.setup()
        end,
    }

    use 'machakann/vim-sandwich'
    use 'tpope/vim-repeat'

    -- ---------------------------------------------
    -- [ MISC ]
    -- ---------------------------------------------
    use {
        'lewis6991/gitsigns.nvim',
        requires = 'nvim-lua/plenary.nvim',
        config = function()
            require 'nk.plugins.gitsigns'
        end,
    }

    use {
        'akinsho/nvim-toggleterm.lua',
        keys = '<C-e>',
        cmd = { 'ToggleTerm', 'TermExec' },
        config = function()
            require 'nk.plugins.toggleterm'
        end,
    }

    use {
        'moll/vim-bbye',
        keys = '<Leader>q',
        cmd = 'Bdelete',
        config = function()
            require 'nk.plugins.bbye'
        end,
    }

    use {
        'norcalli/nvim-colorizer.lua',
        keys = '<Leader>h',
        cmd = 'ColorizerToggle',
        config = function()
            require 'nk.plugins.colorizer'
        end,
    }

    use 'matbme/JABS.nvim'

    -- ---------------------------------------------
    -- [ LANG ]
    -- ---------------------------------------------
    use {
        'euclio/vim-markdown-composer',
        opt = true,
        run = 'cargo build --release',
        ft = 'markdown',
        config = function()
            vim.g.markdown_composer_autostart = 0
        end,
    }

    use 'MTDL9/vim-log-highlighting'
    use 'euclidianAce/BetterLua.vim'
    use 'ziglang/zig.vim'
    use 'arzg/vim-sh'

    use { 'sakhnik/nvim-gdb', run = './install.sh', ft = { 'c', 'zig' } }
    use 'editorconfig/editorconfig-vim'

    -- ---------------------------------------------
    -- [ /TMP ]
    -- ---------------------------------------------
    -- use { 'tweekmonster/startuptime.vim', cmd = 'StartupTime' }
    -- use { 'dstein64/vim-startuptime', cmd = 'StartupTime' }

end)

