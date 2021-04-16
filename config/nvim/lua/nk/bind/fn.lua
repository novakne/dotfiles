-- [ Function to bind ]
local M = {}

-- Toggle between relativenumber and number
M.toggle_number = function()
    if vim.wo.relativenumber then
        vim.wo.relativenumber = false
        vim.wo.number = true
    else
        vim.wo.relativenumber = true
    end
end

-- Get color group name of the syntax group where the cursor is
-- Don't work with treesitter
M.syntax_group = function()
    local line = vim.fn.line('.')
    local col = vim.fn.col('.')
    local group = vim.fn.synID(line, col, 1)
    local id_attr = vim.fn.synIDattr(group, 'name')
    local id_trans = vim.fn.synIDtrans(group)

    print(id_attr .. ' => ' .. vim.fn.synIDattr(id_trans, 'name'))
end

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

