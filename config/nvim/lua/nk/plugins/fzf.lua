-- [ Fzf ]
if packer_plugins['fzf.vim'] and packer_plugins['fzf.vim'].loaded then
    local map = require'nk.utils'.bind

    vim.g.fzf_layout = { window = { width = 0.9, height = 0.9 } }
    vim.g.fzf_buffers_jump = 1
    vim.g.fzf_action = {
        ['ctrl-t'] = 'tab split',
        ['ctrl-h'] = 'split',
        ['ctrl-v'] = 'vsplit',
    }

    map('n', '<Leader>o', '<CMD>Files<CR>') -- Search files recursively
    map('n', '<Leader>b', '<CMD>Buffers<CR>') -- Search between open files
    map('n', '<Leader>r', '<CMD>Rg<CR>') -- Ripgrep
end

