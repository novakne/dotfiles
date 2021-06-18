-- [ Fzf ]
if packer_plugins['fzf.vim'] and packer_plugins['fzf.vim'].loaded then
    local map = require'nk.utils'.bind

    -- An action can be a reference to a function that processes selected lines
    local build_quickfix_list = function( lines )
        vim.call.setqflist(vim.fn.map(vim.fn.copy(lines),
            '{ "filename": v:val }'))
        vim.cmd [[copen]]
        vim.cmd [[cc]]
    end

    local exit_fzf = function()
        vim.cmd[[quit]]
    end

    vim.g.fzf_layout = { window = { width = 0.9, height = 0.9 } }
    vim.g.fzf_buffers_jump = 1
    vim.g.fzf_action = {
        ['ctrl-q'] = build_quickfix_list,
        ['ctrl-x'] = exit_fzf,
        ['ctrl-t'] = 'tab split',
        ['ctrl-h'] = 'split',
        ['ctrl-v'] = 'vsplit',
    }

    map('n', '<Leader>o', '<CMD>Files<CR>') -- Search files recursively
    map('n', '<Leader>b', '<CMD>Buffers<CR>') -- Search between open files
    map('n', '<Leader>r', '<CMD>RG<CR>') -- Ripgrep
    map('n', '<Leader>F', '<CMD>:Lines<CR>') -- Search in lines in loaded buffers
    map('n', '<Leader>f', '<CMD>:BLines<CR>') -- Search in lines in current buffer
end

