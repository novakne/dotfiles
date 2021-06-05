-- [ Telescope ]
if packer_plugins['telescope.nvim'] and packer_plugins['telescope.nvim'].loaded then

    local telescope = require 'telescope'
    local actions = require 'telescope.actions'
    local utils = require 'nk.utils'
    local map = utils.bind

    -- -----------------------------------------------
    -- [ Options ]
    -- -----------------------------------------------
    telescope.setup {
        defaults = {
            vimgrep_arguments = {
                'rg',
                '--color=never',
                '--no-heading',
                '--with-filename',
                '--line-number',
                '--column',
                '--smart-case',
            },
            prompt_position = 'bottom',
            prompt_prefix = '  ',
            selection_strategy = 'reset',
            sorting_strategy = 'ascending',
            layout_strategy = 'horizontal',
            layout_defaults = {},
            file_sorter = require'telescope.sorters'.get_fuzzy_file,
            file_ignore_patterns = {},
            generic_sorter = require'telescope.sorters'.get_generic_fuzzy_sorter,
            shorten_path = true,
            winblend = 0,
            width = 0.75,
            preview_cutoff = 120,
            results_height = 1,
            results_width = 0.8,
            border = {},
            borderchars = {
                '─',
                '│',
                '─',
                '│',
                '╭',
                '╮',
                '╯',
                '╰',
            },
            color_devicons = true,
            use_less = true,
            set_env = { ['COLORTERM'] = 'truecolor' },
            scroll_strategy = 'cycle',
            file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
            grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep
                .new,
            qflist_previewer = require'telescope.previewers'.vim_buffer_qflist
                .new,

            -- Global remapping
            mappings = {
                i = {
                    ['<C-h>'] = actions.select_horizontal,
                    ['<Esc>'] = actions.close, -- Close instead of normal mode
                },
                n = { ['<C-h>'] = actions.select_horizontal },
            },

        },
        extensions = {
            fzf = {
                override_generic_sorter = false, -- override the generic sorter
                override_file_sorter = true, -- override the file sorter
                case_mode = 'smart_case', -- or "ignore_case" or "respect_case"
            },
        },
    }

    telescope.load_extension('fzf')
    telescope.load_extension('zoxide')

    -- -----------------------------------------------
    -- [ Mapping ]
    -- -----------------------------------------------
    -- file pickers
    map('n', '<Leader>o',
        [[<CMD>lua require'telescope.builtin'.find_files({find_command = {'fd', '-i', '-t', 'file', '-H', '-L', '-E', '.git'}})<CR>]])
    map('n', '<Leader>r',
        [[<CMD>lua require'telescope.builtin'.live_grep()<CR>]])
    map('n', '<Leader>k',
        [[<CMD>lua require'telescope.builtin'.grep_string()<CR>]])

    -- vim pickers
    map('n', '<Leader>b', [[<CMD>lua require'telescope.builtin'.buffers()<CR>]])
    map('n', '<Leader>tvo',
        [[<CMD>lua require'telescope.builtin'.oldfiles()<CR>]])
    map('n', '<Leader>tvc',
        [[<CMD>lua require'telescope.builtin'.commands()<CR>]])
    map('n', '<Leader>tvt', [[<CMD>lua require'telescope.builtin'.tags()<CR>]])
    map('n', '<Leader>tvq',
        [[<CMD>lua require'telescope.builtin'.quickfix()<CR>]])
    map('n', '<Leader>tvl',
        [[<CMD>lua require'telescope.builtin'.loclist()<CR>]])
    map('n', '<Leader>tv=',
        [[<CMD>lua require'telescope.builtin'.spell_suggest()<CR>]])
    map('n', '<Leader>tvr',
        [[<CMD>lua require'telescope.builtin'.current_buffer_fuzzy_find()<CR>]])
    map('n', '<Leader>tvp',
        [[<CMD>lua require'telescope.builtin'.registers()<CR>]])

    -- lsp pickers
    map('n', '<Leader>tlr',
        [[<CMD>lua require'telescope.builtin'.lsp_references()<CR>]])
    map('n', '<Leader>tls',
        [[<CMD>lua require'telescope.builtin'.lsp_document_symbols()<CR>]])
    map('n', '<Leader>tlw',
        [[<CMD>lua require'telescope.builtin'.lsp_workspace_symbols()<CR>]])
    map('n', '<Leader>tlc',
        [[<CMD>lua require'telescope.builtin'.lsp_code_actions()<CR>]])
    map('n', '<Leader>tla',
        [[<CMD>lua require'telescope.builtin'.lsp_range_code_actions()<CR>]])
    map('n', '<Leader>tld',
        [[<CMD>lua require'telescope.builtin'.lsp_definitions()<CR>]])
    map('n', '<Leader>tle',
        [[<CMD>lua require'telescope.builtin'.lsp_document_diagnostics()<CR>]])
    map('n', '<Leader>tlE',
        [[<CMD>lua require'telescope.builtin'.lsp_workspace_diagnostics()<CR>]])

    -- git pickers
    map('n', '<Leader>tgc',
        [[<CMD>lua require'telescope.builtin'.git_commits()<CR>]])
    map('n', '<Leader>tgr',
        [[<CMD>lua require'telescope.builtin'.git_bcommits()<CR>]])
    map('n', '<Leader>tgb',
        [[<CMD>lua require'telescope.builtin'.git_branches()<CR>]])
    map('n', '<Leader>tgs',
        [[<CMD>lua require'telescope.builtin'.git_status()<CR>]])

    -- treesitter pickers
    map('n', '<Leader>ttf',
        [[<CMD>lua require'telescope.builtin'.treesitter()<CR>]])

    -- Extensions
    map('n', '<Leader>tez',
        [[<CMD>lua require'telescope'.extensions.zoxide.list{}<CR>]])

end

