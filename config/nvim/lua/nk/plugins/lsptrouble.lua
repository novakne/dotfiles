-- [ Lsp-trouble ]
if packer_plugins['lsp-trouble.nvim'] and
    packer_plugins['lsp-trouble.nvim'].loaded then

    local map = require'nk.utils'.bind

    require'trouble'.setup {
        height = 10, -- height of the trouble list
        icons = true, -- use dev-icons for filenames
        mode = 'document', -- "workspace" or "document"
        fold_open = '', -- icon used for open folds
        fold_closed = '', -- icon used for closed folds
        action_keys = { -- key mappings for actions in the trouble list
            close = 'q', -- close the list
            cancel = '<esc>', -- cancel the preview and get back to your last window / buffer / cursor
            refresh = 'r', -- manually refresh
            jump = { '<cr>', '<tab>' }, -- jump to the diagnostic or open / close folds
            toggle_mode = 'm', -- toggle between "workspace" and "document" mode
            toggle_preview = 'P', -- toggle auto_preview
            hover = "K", -- opens a small poup with the full multiline message
            preview = 'p', -- preview the diagnostic location
            close_folds = { 'zM', 'zm' }, -- close all folds
            open_folds = { 'zR', 'zr' }, -- open all folds
            toggle_fold = { 'zA', 'za' }, -- toggle fold of current file
            previous = 'k', -- preview item
            next = 'j', -- next item
        },
        indent_lines = true, -- add an indent guide below the fold icons
        auto_open = false, -- automatically open the list when you have diagnostics
        auto_close = true, -- automatically close the list when you have no diagnostics
        auto_preview = true, -- automatically preview the location of the diagnostic. <esc> to close preview and go back
        auto_fold = false, -- automatically fold a file trouble list at creation
        signs = {
            -- icons / text used for a diagnostic
            error = '',
            warning = '',
            hint = '',
            information = '',
            other = '',
        },
        use_lsp_diagnostic_signs = true, -- enabling this will use the signs defined in your lsp client
    }

    map('n', '<Leader>xw', '<CMD>LspTroubleToggle lsp_workspace_diagnostics<CR>')
    map('n', '<Leader>xd', '<CMD>LspTroubleToggle lsp_document_diagnostics<CR>')
    map('n', '<Leader>xl', '<CMD>LspTroubleToggle loclist<CR>')
    map('n', '<Leader>xq', '<CMD>LspTroubleToggle quickfix<CR>')
    map('n', '<Leader>xr', '<CMD>LspTroubleToggle lsp_references<CR>')

end

