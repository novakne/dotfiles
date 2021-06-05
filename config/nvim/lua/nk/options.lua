-- [ Options ]
-- [ General ] ( :help nvim-defaults )
vim.g.mapleader = ' ' -- Change leader key to '<space>'
vim.g.maplocalleader = ',' -- Change local leader to ','

vim.o.scrolloff = 5 -- Always 5 lines at the bottom
vim.o.backup = false -- No backup file
vim.o.undofile = true
vim.o.hidden = true -- Enables to switch between unsaved buffers and keep undo history
vim.o.splitbelow = true -- Puts new split windows to the bottom of the current
vim.o.splitright = true -- Puts new vsplit windows to the right of the current
vim.o.equalalways = false
vim.o.clipboard = 'unnamedplus' -- Use the clipboard for all operations
vim.o.inccommand = 'nosplit' -- Show preview of substitute command
vim.o.mouse = 'a' -- Enable mouse
vim.o.shortmess = 'filnxtToOFc' -- Don't give |ins-completion-menu| messages.
vim.o.pyxversion = 3 -- Use python 3
vim.o.selection = 'exclusive' -- Dont select newline in visual mode ( v$ )
vim.o.lazyredraw = true -- Do not redraw screen in the middle of a macro
vim.o.swapfile = false -- No swap file
vim.o.updatetime = 100 -- Smaller updatetime for CursorHold & CursorHoldI
-- vim.o.modelines = 1

-- [ Completion ] ( :help 'complete' )
vim.o.wildignorecase = true -- Ignore case when completing file and directory
vim.o.completeopt = 'menuone,noselect,noinsert' -- options for Insert mode completion ins-completion
vim.o.pumheight = 10 -- Maximum number of items to show in the popup menu

-- [ Search ]
vim.o.hlsearch = false
vim.o.ignorecase = true -- Case insensitive searching
vim.o.smartcase = true -- Override ignorecase if upper case typed
vim.o.grepprg = [[rg --vimgrep --no-heading --smart-case --only-matching]]
vim.o.grepformat = [[%f:%l:%c:%m,%f]]

-- [ Ui ]
vim.o.termguicolors = true
vim.o.showmode = false
vim.o.showcmd = false
vim.o.cmdheight = 2 -- Better display for messages
vim.o.number = true -- Show line number
vim.o.relativenumber = true
vim.o.linebreak = true -- Don't insert line breaks in the middle of a word
vim.o.signcolumn = 'yes:2' -- Always show signcolumns
vim.o.textwidth = 100 -- Break line after 100 characters

-- [ Indent ]
-- Use 4 spaces instead of tab
-- Copy indent from current line when starting a new line
vim.o.cindent = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.expandtab = true

-- [ Wrap ]
vim.o.breakindent = true
vim.o.showbreak = string.rep(' ', 3) -- Make it so that long lines wrap smartly
vim.o.linebreak = true

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

-- Load colorscheme
vim.cmd [[colorscheme argi]]

