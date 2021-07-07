-- -----------------------------------------------
-- [ UTILS ]
-- -----------------------------------------------
local M = {}
_G.MUtils = {}

-- -----------------------------------------------
-- [ GLOBAL ]
-- -----------------------------------------------
-- Inspect api & co
MUtils.inspect = function( stuff )
    return print(vim.inspect(stuff))
end

-- -----------------------------------------------
-- [ VIM-COMPE ]
-- -----------------------------------------------
local t = function( str )
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

-- Use (s-)tab to:
-- move to prev/next item in completion menuone
-- jump to prev/next snippet's placeholder
MUtils.tab_complete = function()
    if vim.fn.pumvisible() == 1 then
        return t '<C-n>'
    elseif check_back_space() then
        return t '<Tab>'
    else
        return vim.fn['compe#complete']()
    end
end

MUtils.s_tab_complete = function()
    if vim.fn.pumvisible() == 1 then
        return t '<C-p>'
    else
        return t '<S-Tab>'
    end
end

-- -----------------------------------------------
-- [ BIND KEY ]
-- -----------------------------------------------
M.bind = function( mode, lhs, rhs, opts )
    opts = opts or { noremap = true, silent = true }
    vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
end

M.bind_bufnr = function( mode, lhs, rhs, opts )
    opts = opts or { noremap = true, silent = true }
    vim.api.nvim_buf_set_keymap(0, mode, lhs, rhs, opts)
end

-- -----------------------------------------------
-- [ FUNCTIONS TO BIND ]
-- -----------------------------------------------
-- [ Window management ]
-- Be aware of whether you are right or left vertical split
-- so you can use arrows more naturally.
-- Inspired by https://github.com/ethagnawl
M.vertical_resize = function( direction )
    local window_resize_count = 5
    local current_window = vim.call('winnr')
    local last_window = vim.call('winnr', '$')
    local modifier, modifier_1, modifier_2 = nil, nil, nil

    if direction == 'left' then
        modifier_1, modifier_2 = '+', '-'
    else
        modifier_1, modifier_2 = '-', '+'
    end

    if current_window == last_window then
        local current_window_is_last_window = true
        if current_window_is_last_window then
            modifier = modifier_1
        else
            modifier = modifier_2
        end
    else
        modifier = modifier_2
    end

    local cmd = ('vertical resize %s%d<CR>'):format(modifier,
        window_resize_count)

    vim.cmd(cmd)
end

-- Move to the split in the direction shown, or create a new split
-- ( https://aonemd.github.io/blog/handy-keymaps-in-vim )
M.win_move = function( key )
    local current_window = vim.call('winnr')
    vim.cmd('wincmd ' .. key)
    if current_window == vim.call('winnr') then
        if string.find(key, '[jk]') then
            vim.cmd('wincmd s')
        else
            vim.cmd('wincmd v')
        end
        vim.cmd('wincmd ' .. key)
    end
end

return M

