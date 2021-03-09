-- [ PLUGINS ]
local execute = vim.api.nvim_command

-- Ensure that packer.nvim is installed
local install_path = vim.fn.stdpath('data')
                       .. '/site/pack/packer/opt/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  execute(
    '!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
  execute 'packadd packer.nvim'
end

-- Only required if you have packer in your `opt` pack
vim.cmd [[packadd packer.nvim]]


return require'packer'.startup(function()
  -- Packer can manage itself as an optional plugin
  use {'wbthomason/packer.nvim', opt = true}


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
    requires = {
      {'hrsh7th/vim-vsnip', after = 'nvim-compe'},
      {'hrsh7th/vim-vsnip-integ', after = 'nvim-compe'}
    },
    config = function()
      require 'nk.plugins.compe'
    end,
  }

  use {
    'glepnir/lspsaga.nvim',
    config = function()
      require'lspsaga'.init_lsp_saga()
    end,
  }

  use {
    'kosayoda/nvim-lightbulb',
    config = function()
      vim.cmd [[autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()]]
      vim.fn.sign_define("LightBulbSign",
        {text = "", texthl = "", linehl = "", numhl = ""})
    end,
  }

  use 'nvim-lua/lsp_extensions.nvim'


  -- ---------------------------------------------
  -- [ TREESITTER ]
  -- ---------------------------------------------
  use {
    'nvim-treesitter/nvim-treesitter',
    requires = {
      {'romgrk/nvim-treesitter-context', after = 'nvim-treesitter'},
      {'p00f/nvim-ts-rainbow', after = 'nvim-treesitter'},
      {'nvim-treesitter/nvim-treesitter-refactor', after = 'nvim-treesitter'},
      {'nvim-treesitter/playground', cmd = 'TSPlaygroundToggle'},
      {'nvim-treesitter/nvim-treesitter-textobjects', after = 'nvim-treesitter'},
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
    requires = {'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim'},
    config = function()
      require 'nk.plugins.telescope'
    end,
  }

  use {
    'mcchrish/nnn.vim',
    cmd = {'Np', 'NnnPicker'},
    keys = '<F6>',
    config = function()
      require 'nk.plugins.nnn'
    end,
  }

  -- use '~/.local/share/bld/fzf'
  -- use {'junegunn/fzf.vim', config = function() require 'nk.plugins.fzf' end}


  -- ---------------------------------------------
  -- [ UI ]
  -- ---------------------------------------------
  use {
    '~/dev/_personnal/kosmikoa.nvim',
    config = function()
      require'kosmikoa'.setup()
    end,
  }
  -- use {
  --   'novakne/kosmikoa.nvim',
  --   branch = 'main',
  --   config = function()
  --     require'kosmikoa'.setup()
  --   end,
  -- }

  use {
    'glepnir/galaxyline.nvim',
    branch = 'main',
    requires = {'kyazdani42/nvim-web-devicons', opt = true},
    config = function()
      require 'nk.plugins.galaxyline'
    end,
  }

  use {
    'liuchengxu/vim-which-key',
    config = function()
      require 'nk.plugins.whichkey'
    end,
  }


  -- ---------------------------------------------
  -- [ EDITING ]
  -- ---------------------------------------------
  use {
    'terrortylor/nvim-comment',
    keys = 'gc',
    config = function()
      require'nvim_comment'.setup({comment_empty = false})
    end,
  }

  use {
    'windwp/nvim-autopairs',
    config = function()
      require 'nk.plugins.autopairs'
    end,
  }

  use {'junegunn/vim-easy-align', keys = '<Plug>(EasyAlign)', cmd = 'EasyAlign'}
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
    keys = '<Leader>e',
    cmd = {'ToggleTerm', 'TermExec'},
    config = function()
      require 'nk.plugins.toggleterm'
    end,
  }

  use {'moll/vim-bbye', cmd = 'Bdelete'}
  use {'norcalli/nvim-colorizer.lua', cmd = 'ColorizerToggle'}
  use 'phaazon/hop.nvim'


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

  use 'sheerun/vim-polyglot'
  use 'editorconfig/editorconfig-vim'


  -- [ /tmp ]
  use 'dahu/VimRegexTutor'
  -- use 'dstein64/vim-startuptime'
  -- use 'tweekmonster/startuptime.vim'


end)

