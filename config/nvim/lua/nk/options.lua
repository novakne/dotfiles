-- [ Options ]
local opts_info = vim.api.nvim_get_all_options_info()

local opt = setmetatable({}, {
    __newindex = function( self, key, value )
        vim.o[key] = value
        local scope = opts_info[key].scope
        if scope == 'win' then
            vim.wo[key] = value
        elseif scope == 'buf' then
            vim.bo[key] = value
        end
    end,
})

-- [ General ] ( :help nvim-defaults )
vim.g.mapleader = ' ' -- Change leader key to '<space>'
vim.g.maplocalleader = ',' -- Change local leader to ','

opt.scrolloff = 5 -- Always 5 lines at the bottom
opt.backup = false -- No backup file
opt.undofile = true
opt.hidden = true -- Enables to switch between unsaved buffers and keep undo history
opt.splitbelow = true -- Puts new split windows to the bottom of the current
opt.splitright = true -- Puts new vsplit windows to the right of the current
opt.equalalways = false
opt.clipboard = 'unnamedplus' -- Use the clipboard for all operations
opt.inccommand = 'nosplit' -- Show preview of substitute command
opt.mouse = 'a' -- Enable mouse
opt.shortmess = 'filnxtToOFc' -- Don't give |ins-completion-menu| messages.
opt.pyxversion = 3 -- Use python 3
opt.selection = 'exclusive' -- Dont select newline in visual mode ( v$ )
opt.lazyredraw = true -- Do not redraw screen in the middle of a macro
opt.swapfile = false -- No swap file
opt.updatetime = 100 -- Smaller updatetime for CursorHold & CursorHoldI
opt.modelines = 1
-- opt.foldmethod = 'expr'
-- opt.foldexpr = 'nvim_treesitter#foldexpr()'

-- [ Completion ] ( :help 'complete' )
opt.wildignorecase = true -- Ignore case when completing file and directory
opt.completeopt = 'menuone,noselect,noinsert' -- options for Insert mode completion ins-completion
opt.pumheight = 10 -- Maximum number of items to show in the popup menu

-- [ Search ]
opt.hlsearch = false
opt.ignorecase = true -- Case insensitive searching
opt.smartcase = true -- Override ignorecase if upper case typed
opt.grepprg = [[rg --vimgrep --no-heading --smart-case --only-matching]]
opt.grepformat = [[%f:%l:%c:%m,%f:%l:%m]]

-- [ Ui ]
opt.termguicolors = true
opt.showmode = false
opt.showcmd = false
opt.cmdheight = 2 -- Better display for messages
opt.number = true -- Show line number
opt.relativenumber = true
opt.linebreak = true -- Don't insert line breaks in the middle of a word
opt.signcolumn = 'yes:2' -- Always show signcolumns
opt.textwidth = 100 -- Break line after 100 characters

-- [ Indent ]
-- Use 4 spaces instead of tab
-- Copy indent from current line when starting a new line
opt.cindent = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true

-- [ Wrap ]
opt.breakindent = true
opt.showbreak = string.rep(' ', 3) -- Make it so that long lines wrap smartly
opt.linebreak = true

-- Disable some providers and plugins
vim.g.loaded_node_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python_provider = 0
vim.g.python3_host_prog = '/usr/bin/python3'
vim.g.loaded_gzip = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_tar = 1
vim.g.loaded_zipPlugin = 1
vim.g.loaded_zip = 1
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.cmd [[colorscheme argi]]

