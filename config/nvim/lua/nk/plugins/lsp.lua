-- -----------------------------------------------
-- [ LSP ]
-- -----------------------------------------------
if packer_plugins['nvim-lspconfig'] and packer_plugins['nvim-lspconfig'].loaded then
    local lspconfig = require 'lspconfig'
    local configs = require 'lspconfig/configs'
    local utils = require 'nk.utils'
    local bmap = utils.bind_bufnr

    local M = {}

    -- vim.lsp.set_log_level("debug")

    -- [ Custom handlers ]
    M.handler_init = function()
        vim.lsp.handlers['textDocument/publishDiagnostics'] =
            vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
                underline = false,
                virtual_text = true,
                update_in_insert = false,
                -- Use a function to dynamically turn signs off
                -- and on, using buffer local variables
                signs = function( bufnr, client_id )
                    local ok, result = pcall(vim.api.nvim_buf_get_var, bufnr,
                        'show_signs')

                    -- No buffer local variable set, so just enable by default
                    if not ok then return true end

                    return result
                end,
            })
    end

    local on_attach = function( client )
        M.handler_init()
        vim.lsp.diagnostic.set_loclist({ open_loclist = false })

        -- ---------------------------------------
        -- [ MAPPINGS ]
        -- ---------------------------------------
        -- Lspsaga.nvim
        bmap('n', '<Leader>lk',
            [[<CMD>lua require'lspsaga.hover'.render_hover_doc()<CR>]])
        bmap('n', '<Leader>lf',
            [[<CMD>lua require'lspsaga.provider'.lsp_finder()<CR>]])
        bmap('n', '<Leader>lK',
            [[<CMD>lua require'lspsaga.signaturehelp'.signature_help()<CR>]])
        bmap('n', '<Leader>lt',
            [[<CMD>lua require'lspsaga.provider'.preview_definition()<CR>]])
        bmap('n', '<Leader>le',
            [[<CMD>lua require'lspsaga.diagnostic'.show_line_diagnostics()<CR>]])
        bmap('n', '<Leader>lp',
            [[<CMD>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<CR>]])
        bmap('n', '<Leader>ln',
            [[<CMD>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>]])

        -- Fzf-lsp
        bmap('n', '<Leader>ld', ':Diagnostics<CR>')
        bmap('n', '<Leader>lD', ':DiagnosticsAll<CR>')
        bmap('n', '<Leader>lc', ':CodeActions<CR>')
        bmap('v', '<Leader>lc', ':RangeCodeActions<CR>')
        bmap('n', '<Leader>lr', ':References<CR>')
        bmap('n', '<Leader>ls', ':DocumentSymbols<CR>')
        bmap('n', '<Leader>lS', ':WorkspaceSymbols<CR>')

        -- Set some keybinds conditional on server capabilities
        if client.resolved_capabilities.document_formatting then
            bmap('n', '<Leader>lf', '<CMD>lua vim.lsp.buf.formatting()<CR>')
        elseif client.resolved_capabilities.document_range_formatting then
            bmap('n', '<Leader>lf', '<CMD>lua vim.lsp.buf.formatting()<CR>')
        end

        vim.fn.sign_define('LspDiagnosticsSignError',
            { text = '', texthl = 'LspDiagnosticsSignError' })
        vim.fn.sign_define('LspDiagnosticsSignWarning', {
            text = '',
            texthl = 'LspDiagnosticsSignWarning',
        })
        vim.fn.sign_define('LspDiagnosticsSignInformation', {
            text = '',
            texthl = 'LspDiagnosticsSignInformation',
        })
        vim.fn.sign_define('LspDiagnosticsSignHint',
            { text = '', texthl = 'LspDiagnosticsSignHint' })

        vim.api.nvim_exec([[
          augroup DiagnosticRefresh
            autocmd!
            autocmd BufWinEnter,TabEnter <buffer>, lua require'nk.plugins.lsp'.handler_init()
          augroup END
        ]], false)
    end

    -- -------------------------------------------
    -- [ SERVERS ]
    -- -------------------------------------------
    M.init = function()
        local lsp_dir = os.getenv('HOME') .. '/.local/lib/lsp/'
        local lua_bin = lsp_dir .. 'lua/bin/Linux/lua-language-server'
        local lua_main = lsp_dir .. 'lua/main.lua'

        configs = {
            bashls = {},
            clangd = {
                cmd = {
                    'clangd',
                    '--background-index',
                    '--suggest-missing-includes',
                    '--clang-tidy',
                    '--fallback-style=google',
                    '--header-insertion=iwyu',
                },
            },

            sumneko_lua = {
                cmd = { lua_bin, '-E', lua_main },
                settings = {
                    Lua = {
                        runtime = {
                            version = 'LuaJIT',
                            path = vim.split(package.path, ';'),
                        },
                        diagnostics = {
                            globals = {
                                'vim',
                                'awesome',
                                'client',
                                'tag',
                                'screen',
                                'use',
                                'packer_plugins',
                            },
                        },
                    },
                    workspace = {
                        library = {
                            [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                            [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
                        },
                    },
                },
            },

            vimls = {},
            yamlls = {},
            zls = { cmd = { lsp_dir .. 'zls/zig-out/bin/zls' } },
        }

        for server, config in pairs(configs) do
            config.on_attach = on_attach
            lspconfig[server].setup(config)
        end

    end

    return M

end

