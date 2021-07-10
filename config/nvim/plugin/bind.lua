-- -----------------------------------------------
-- [ MAPPING ]
-- -----------------------------------------------
local map = require'nk.utils'.bind

-- Normal mode with 'jk' or 'kj'
map('i', 'jk', '<esc>')
map('i', 'kj', '<esc>')

-- Move updown by visual (wrapped) lines
map('n', 'j', [[v:count == 0 ? 'gj' : 'j']], { noremap = true, expr = true })
map('n', 'k', [[v:count == 0 ? 'gk' : 'k']], { noremap = true, expr = true })

-- Easier start & end of the line
map('n', 'H', '^')
map('n', 'L', '$')

-- -----------------------------------------------
-- [ EDITING ]
-- -----------------------------------------------
map('n', '<Leader>w', '<CMD>w<CR>')
map('n', '<Leader>z', '<CMD>q<CR>')
map('n', '<Leader>!', '<CMD>q!<CR>')

-- Apend ;/, at the end of the line
map('n', '<Leader>;', '<CMD>normal A;<CR>')
map('n', '<Leader>,', '<CMD>normal A,<CR>')
map('i', '<C-;>', '<CMD>normal A;<CR>')
map('i', '<C-,>', '<CMD>normal A,<CR>')

map('n', 'yc', 'vawy') -- Yank the world under the cursor
map('n', 's', '"_d')   -- Make s act like d, except it doesn’t save the cut text to a register
map('n', 'Y', 'y$')    -- Make Y act like D and C

-- Quickly move current line or visual selection
map('n', 'mm', '<CMD>m .+1<CR>==')
map('n', 'MM', '<CMD>m .-2<CR>==')
map('v', '<A-j>', [[<CMD>m '>+1<CR>gv=gv]])
map('v', '<A-k>', [[<CMD>m '<-2<CR>gv=gv]])

-- Don't lose selection when shifting sidewards
map('x', '<', '<gv')
map('x', '>', '>gv')

-- -----------------------------------------------
-- [ WINDOWS ]
-- -----------------------------------------------
-- Move to the split in the direction shown, or create a new split
-- ( https://aonemd.github.io/blog/handy-keymaps-in-vim )
map('n', '<C-h>', [[<CMD>lua require'nk.utils'.win_move('h')<CR>]])
map('n', '<C-j>', [[<CMD>lua require'nk.utils'.win_move('j')<CR>]])
map('n', '<C-k>', [[<CMD>lua require'nk.utils'.win_move('k')<CR>]])
map('n', '<C-l>', [[<CMD>lua require'nk.utils'.win_move('l')<CR>]])

-- Intelligent windows resizing using ctrl + arrow keys
map('n', '<C-Right>',
    [[<CMD>lua require'nk.utils'.vertical_resize('right')<CR>]])
map('n', '<C-Left>',
    [[<CMD>lua require'nk.utils'.vertical_resize('left')<CR>]])
map('n', '<C-Up>', '<CMD>resize -1<CR>')
map('n', '<C-Down>', '<CMD>resize +1<CR>')

-- -----------------------------------------------
-- -----------------------------------------------
map('n', '+', '<CMD>bn<CR>') -- Next buffers
map('n', '_', '<CMD>bp<CR>') -- Prev buffers

map('n', '<esc>', '<CMD>noh<CR>') -- Clear search results

-- Quickfix window
map('n', '<Leader>cc', ':cclose<CR>')
map('n', '<Leader>co', ':copen<CR>')
map('n', '<Leader>cp', ':cprev<CR>')
map('n', '<Leader>cn', ':cnext<CR>')

-- Spell
map('n', '<F9>', '<CMD>setlocal spell! spelllang=en<CR>')
map('n', '<F10>', '<CMD>setlocal spell! spelllang=fr<CR>')

-- Get color group name of the syntax group where the cursor is
map('n', '<F12>', [[<CMD>TSHighlightCapturesUnderCursor<CR>]])

