-- [ Utils ]
local M = {}
_G.MUtils = {}

-- [ Global ]
-- Inspect api & co
MUtils.inspect = function( stuff )
    return print(vim.inspect(stuff))
end

-- Vim-compe
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
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
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

-- [ Bind key ]
M.bind = function( mode, lhs, rhs, opts )
    opts = opts or { noremap = true, silent = true }
    vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
end

M.bind_bufnr = function( mode, lhs, rhs, opts )
    opts = opts or { noremap = true, silent = true }
    vim.api.nvim_buf_set_keymap(0, mode, lhs, rhs, opts)
end

return M

