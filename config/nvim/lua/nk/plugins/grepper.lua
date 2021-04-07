-- [ Vim-Grepper ]
if packer_plugins['vim-grepper'] and packer_plugins['vim-grepper'].loaded then

    local map = require'nk.utils'.bind

    vim.g.grepper = {
        tools = {'rg', 'grep', 'git'},
        grepper = 0,
        greppers = 0,
        highlight = 1,
        quickfix = 1, -- 0 = location list
        open = 1,
        switch = 1,
        jump = 0,
        prompt_text = '$t $c => ',
        dir = 'file,repo', -- cwd / file / filecwd / repo
        append = 0,
        searchreg = 1,
    }

    map('n', 'gs', '<plug>(GrepperOperator)', {silent = true})
    map('x', 'gs', '<plug>(GrepperOperator)', {silent = true})
    map('n', '<Leader>sg', '<CMD>Grepper<CR>')
    map('n', '<Leader>sb', '<CMD>Grepper -buffers<CR>')
    map('n', '<Leader>sB', '<CMD>Grepper -buffer<CR>')
    map('n', '<Leader>sw', '<CMD>Grepper -cword<CR>')

end

