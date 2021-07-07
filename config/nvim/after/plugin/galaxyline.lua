-- -----------------------------------------------
-- [ GALAXYLINE ]
-- -----------------------------------------------
if packer_plugins['galaxyline.nvim'] and
    packer_plugins['galaxyline.nvim'].loaded then
    local gl = require('galaxyline')
    local gls = gl.section

    gl.short_line_list = { 'NvimTree', 'vista', 'dbui' }

    local colors = {
        light00 = '#f1f1f0',
        light01 = '#e4e4e3',
        light02 = '#c2c2c1',

        dark00 = '#252524',
        dark01 = '#464645',
        dark02 = '#656565',
        dark03 = '#7a7a79',

        blue00 = '#2a4d84',
        blue01 = '#3769a4',
        red00 = '#842a4d',
        red01 = '#aa3255',
    }

    local buffer_not_empty = function()
        if vim.fn.empty(vim.fn.expand('%:t')) ~= 1 then return true end
        return false
    end

    local checkwidth = function()
        local squeeze_width = vim.fn.winwidth(0) / 2
        if squeeze_width > 40 then return true end
        return false
    end

    -- -------------------------------------------
    -- [ LEFT ]
    -- -------------------------------------------
    gls.left[1] = {
        ViMode = {
            provider = function()
                local mode = {
                    n = { color = colors.blue00, name = 'N' },
                    i = { color = colors.red00, name = 'I' },
                    v = { color = colors.blue01, name = 'V' },
                    [''] = { color = colors.blue01, name = 'V' },
                    V = { color = colors.blue01, name = 'V' },
                    c = { color = colors.red01, name = 'C' },
                    no = { color = colors.red01, name = 'No' },
                    s = { color = colors.red01, name = 'S' },
                    S = { color = colors.red01, name = 'S' },
                    [''] = { color = colors.red01, name = 'S' },
                    ic = { color = colors.red01, name = 'Ic' },
                    R = { color = colors.red01, name = 'R' },
                    Rv = { color = colors.red01, name = 'R' },
                    cv = { color = colors.red01, name = 'Cv' },
                    ce = { color = colors.red01, name = 'Ce' },
                    r = { color = colors.red01, name = 'R' },
                    rm = { color = colors.red01, name = 'Rm' },
                    ['r?'] = { color = colors.red01, name = 'R?' },
                    ['!'] = { color = colors.red01, name = '!' },
                    t = { color = colors.red01, name = 'T' },
                }

                vim.api.nvim_command('hi GalaxyViMode guifg=' ..
                                         mode[vim.fn.mode()].color)
                return ' ' .. mode[vim.fn.mode()].name .. '  '
            end,

            highlight = { colors.blue00, colors.light00, 'bold' },
        },
    }

    gls.left[2] = {
        FileName = {
            provider = function()
                local fileinfo = require('galaxyline.provider_fileinfo')
                local filename = fileinfo.get_current_file_name()
                return string.format('[ %s]', filename)
            end,
            condition = buffer_not_empty,
            highlight = { colors.dark00, colors.light00 },
        },
    }

    gls.left[3] = {
        GitStart = {
            provider = function()
                return '  ( '
            end,
            condition = require('galaxyline.provider_vcs').check_git_workspace,
            highlight = { colors.dark00, colors.light00 },
        },
    }

    gls.left[4] = {
        GitBranch = {
            provider = 'GitBranch',
            condition = require('galaxyline.provider_vcs').check_git_workspace,
            icon = ' ',
            highlight = { colors.dark01, colors.light00 },
        },
    }

    gls.left[5] = {
        DiffAdd = {
            provider = 'DiffAdd',
            condition = checkwidth,
            icon = ' +',
            highlight = { colors.dark00, colors.light00 },
        },
    }
    gls.left[6] = {
        DiffModified = {
            provider = 'DiffModified',
            condition = checkwidth,
            icon = ' »',
            highlight = { colors.dark00, colors.light00 },
        },
    }
    gls.left[7] = {
        DiffRemove = {
            provider = 'DiffRemove',
            condition = checkwidth,
            icon = ' ✗',
            highlight = { colors.dark00, colors.light00 },
        },
    }

    gls.left[8] = {
        GitEnd = {
            provider = function()
                return ' )'
            end,
            condition = require('galaxyline.provider_vcs').check_git_workspace,
            highlight = { colors.dark00, colors.light00 },
        },
    }

    -- -------------------------------------------
    -- [ RIGHT ]
    -- -------------------------------------------
    gls.right[1] = {
        DiagnosticError = {
            provider = 'DiagnosticError',
            icon = '  ',
            highlight = { colors.red00, colors.light00 },
        },
    }
    gls.right[2] = {
        DiagnosticWarn = {
            provider = 'DiagnosticWarn',
            icon = '  ',
            highlight = { colors.red01, colors.light00 },
        },
    }

    gls.right[3] = {
        DiagnosticHint = {
            provider = 'DiagnosticHint',
            icon = '  ',
            highlight = { colors.blue00, colors.light00 },
        },
    }

    gls.right[4] = {
        DiagnosticInfo = {
            provider = 'DiagnosticInfo',
            icon = '  ',
            highlight = { colors.blue01, colors.light00 },
        },
    }

    gls.right[5] = {
        LineTotal = {
            provider = function()
                local line = vim.fn.line('.')
                local col = vim.fn.col('.')
                local total = vim.fn.line('$')
                local str = '   %d/%d  %d'
                return str:format(line, total, col)
            end,
            condition = buffer_not_empty,
            highlight = { colors.dark00, colors.light00 },
        },
    }

    -- -------------------------------------------
    -- [ SHORT ]
    -- -------------------------------------------
    gls.short_line_left[3] = {
        SFileName = {
            provider = function()
                local fileinfo = require('galaxyline.provider_fileinfo')
                local filename = fileinfo.get_current_file_name()
                return string.format('[ %s]', filename)
            end,
            condition = buffer_not_empty,
            highlight = { colors.dark00, colors.light00 },
        },
    }

    gls.short_line_right[1] = {
        BufferIcon = {
            provider = 'BufferIcon',
            highlight = { colors.dark00, colors.light00 },
        },
    }
end

