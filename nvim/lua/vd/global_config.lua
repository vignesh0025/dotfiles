local test = function ()
    print("config.lua loaded")
end

local ultisnips_init = function ()
    -- https://github.com/hrsh7th/nvim-cmp/wiki/Example-mappings
    vim.g.UltiSnipsExpandTrigger = '<Plug>(ultisnips_expand)'
    vim.g.UltiSnipsJumpForwardTrigger = '<Plug>(ultisnips_jump_forward)'
    vim.g.UltiSnipsJumpBackwardTrigger = '<Plug>(ultisnips_jump_backward)'
    vim.g.UltiSnipsListSnippets = '<c-x><c-s>'
    vim.g.UltiSnipsRemoveSelectModeMappings = 0

end

local ale_init = function ()
    vim.g.ale_disable_lsp = 1
    vim.g.ale_set_quickfix = 1
    vim.g.ale_fixers = {['cpp'] = {'clang-format'}, ['python'] = {'autopep8'}}

    vim.api.nvim_set_keymap("n", "<leader>lf", ":ALEFix<CR>", {noremap=true})

    vim.api.nvim_set_keymap("n", "]l", "<Plug>(ale_next_wrap)",{silent=true})
    vim.api.nvim_set_keymap("n", "[l", "<Plug>(ale_previous_wrap)",{silent=true})
end

local fugitive_init = function ()
    require('vd.keymaps').fugitive_keymaps()
    require('vd.autocmds').fugitive_autocmds()
end

local coc_init = function ()
    vim.cmd [[
    let g:coc_global_extensions = [
    \'coc-sumneko-lua',
    \'coc-ultisnips',
    \'coc-snippets',
    \'coc-marketplace',
    \'coc-lists',
    \'coc-gitignore',
    \'coc-git',
    \'coc-actions',
    \'coc-python',
    \'coc-json',
    \'coc-cmake',
    \'coc-clangd'
    \]
    ]]

    require("vd.keymaps").coc_keymaps()
    require("vd.autocmds").coc_cmds()

    -- ]]
end

local airline_init = function ()
    -- setting global variables
    vim.api.nvim_set_var("airline_powerline_fonts", 1)

    -- Buffers at top is shown by the below
    -- vim.api.nvim_set_var("airline#extensions#coc#stl_format_err", '%E{[%e(#%fe)]}')
    vim.api.nvim_set_var("airline#extensions#tabline#enabled", 1)
    vim.api.nvim_set_var("airline#extensions#tabline#buffer_nr_show", 1)
    vim.api.nvim_set_var("airline#extensions#ale#enabled", 1)
    vim.api.nvim_set_var("airline#extensions#gutentags#enabled", 1)
    vim.api.nvim_set_var("airline#extensions#fugitiveline#enabled", 1)
    vim.api.nvim_set_var("airline#extensions#fzf#enabled", 1)
    vim.api.nvim_set_var("airline#extensions#vimtex#enabled", 1)
end

local telescope_init = function ()
    require('telescope').setup{
        -- see :help telescope.setup()
        defaults = {
            mappings = {
                i = {
                    ["<Esc>"] = require('telescope.actions').close
                }
            },
            -- The below pattern is lua regex and not wildcard
            file_ignore_patterns = {"node_modules","%.out", "plugged"},
            prompt_prefix = "🔍 ",
        },
        pickers = {
            file_browser = {
                -- find_command = {"rg","--ignore","--hidden","--files"}
            }
        }
    }

    require('vd.keymaps').telescope_keymaps()
    require('vd.autocmds').telescope_autocmds()

    -- require('telescope').load_extension('fzf')
end


local treesitter_init = function ()
    require "nvim-treesitter.configs".setup {
        ensure_installed = {"c", "cpp", "python", "lua", "verilog","cmake"},
        playground = {
            enable = true,
            disable = {},
            updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
            persist_queries = false -- Whether the query persists across vim sessions
        },
        indent = {
            enable = true
        },
        highlight = {
            enable = true,
        },
        query_linter = {
            enable = true,
            use_virtual_text = true,
            lint_events = {"BufWrite", "CursorHold"},
        },
    }
end

local lsp_server_init = function ()
    local lsp_installer = require("nvim-lsp-installer")

    require('vd.autocmds').lsp_autocmds()

    -- On Attach Function
    local on_attach = function(client, bufnr)
        local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
        local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

        buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

        -- Mappings.
        local opts = { noremap=true, silent=true }

        if client.name == "clangd" then
            buf_set_keymap('n', '<F4>', '<cmd>ClangdSwitchSourceHeader<CR>', opts)
            -- else
            --   print(vim.inspect(client.resolved_capabilities))
        end

        buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
        buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
        buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
        buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
        buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
        buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
        buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
        buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
        buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
        buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)

        -- Code Action
        buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
        buf_set_keymap('v', '<space>f', '<cmd>lua vim.lsp.buf.range_code_action()<CR>', {noremap=true})
        buf_set_keymap('x', '<space>f', '<cmd>lua vim.lsp.buf.range_code_action()<CR>', {noremap=true})

        -- buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts) -- Set in Telescope
        buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
        buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
        buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
        buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

        -- Set some keybinds conditional on server capabilities
        if client.resolved_capabilities.document_formatting then
            -- TODO: vim.lsp.formatexpr() doesn't seem to be supported yet ! Check again later
            -- vim.api.nvim_buf_set_option(bufnr, 'formatexpr' , 'v:lua.vim.lsp.formatexpr()')
            buf_set_keymap("n", "<space>=", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
        elseif client.resolved_capabilities.document_range_formatting then
            buf_set_keymap("v", "<space>=", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
        end

        if client.resolved_capabilities.document_highlight then
            vim.cmd [[
            augroup lsp_document_highlight
            autocmd!
            autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
            autocmd CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()
            autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
            augroup END
            ]]
        end
    end

    -- Setup lspconfig.
    local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

    local server_ready = function (server)
        --print(vim.inspect(server))
        local opts = {
                on_attach = on_attach,
                capabilities=capabilities
        }

        if server.name == "cmake" then
            -- Def
        elseif server.name == "clangd" then
            opts = vim.tbl_extend("force", opts, {
                default_config = {
                    init_options = {arguments="-header-insertion=never"}
                }
            })
        elseif server.name == "sumneko_lua" then
            opts = vim.tbl_extend("force", opts, {
                on_attach = on_attach,
                capabilities=capabilities,
                settings = {
                    Lua = {
                        diagnostics = {
                            -- Get the language server to recognize the `vim` global
                            globals = {'vim'},
                        },
                        workspace = {
                            -- Make the server aware of Neovim runtime files
                            library = vim.api.nvim_get_runtime_file("", true),
                        },
                        -- Do not send telemetry data containing a randomized but unique identifier
                        telemetry = {
                            enable = false,
                        },
                    }
                }
            })
        end

        -- local coq = require "coq" -- add this
        -- server:setup(coq.lsp_ensure_capabilities(opts))
        server:setup(opts)

        -- This function reads the diagnostics from lsp server and puts in quickfix.
        -- Also, this performs the default actions as well
        do
            local method = "textDocument/publishDiagnostics"
            local default_handler = vim.lsp.handlers[method]
            vim.lsp.handlers[method] = function(err, method, result, client_id, lbufnr, config)
                default_handler(err, method, result, client_id, lbufnr, config)
                local diagnostics = vim.lsp.diagnostic.get_all()
                local qflist = {}
                for lbufnr, diagnostic in pairs(diagnostics) do
                    for _, d in ipairs(diagnostic) do
                        d.bufnr = lbufnr
                        d.lnum = d.range.start.line + 1
                        d.col = d.range.start.character + 1
                        d.text = d.message
                        table.insert(qflist, d)
                    end
                end
                vim.lsp.util.set_qflist(qflist)
            end
        end

        require "lsp_signature".on_attach({floating_window=false})

    end

    lsp_installer.on_server_ready(server_ready)
end

-- Disabled LSP INIT {{{
local lsp_init = function ()
    local lspconfig = require'lspconfig'
    local on_attach = function(client, bufnr)

        local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
        local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

        buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

        -- Mappings.
        local opts = { noremap=true, silent=true }

        if client.name == "clangd" then
            buf_set_keymap('n', '<F4>', '<cmd>ClangdSwitchSourceHeader<CR>', opts)
            -- else
            --   print(vim.inspect(client.resolved_capabilities))
        end

        buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
        buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
        buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
        buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
        buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
        buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
        buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
        buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
        buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
        buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
        buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
        -- buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts) -- Set in Telescope
        buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
        buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
        buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
        buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

        -- Set some keybinds conditional on server capabilities
        -- if client.resolved_capabilities.document_formatting then
        --   buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
        -- elseif client.resolved_capabilities.document_range_formatting then
        --   buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
        -- end

        if client.resolved_capabilities.document_highlight then
            vim.cmd [[
            augroup lsp_document_highlight
            autocmd!
            autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
            autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
            augroup END
            ]]
        end

    end

    -- Setup lspconfig.
    local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

    -- Activate venv from ~/.local/share/nvim/lsp_servers/cmake/venv/bin/
    lspconfig["cmake"].setup({
        on_attach = on_attach,
        capabilities=capabilities
    })

    lspconfig["pyright"].setup({
        on_attach = on_attach,
        capabilities=capabilities
    })

    lspconfig["clangd"].setup({
        on_attach = on_attach,
        capabilities=capabilities,
        default_config = {
            init_options = {arguments="-header-insertion=never"}
        }
    })

    -- set the path to the sumneko installation; if you previously installed via the now deprecated :LspInstall, use
    local sumneko_root_path = vim.fn.stdpath('data')..'/lsp_servers/sumneko_lua/extension/server'
    local sumneko_binary = sumneko_root_path.."/bin/Linux/lua-language-server"

    local runtime_path = vim.split(package.path, ';')
    table.insert(runtime_path, "lua/?.lua")
    table.insert(runtime_path, "lua/?/init.lua")

    require'lspconfig'.sumneko_lua.setup {
        on_attach = on_attach, capabilities=capabilities,
        cmd = {sumneko_binary, "-E", sumneko_root_path .. "/bin/Linux/main.lua"};
        settings = {
            Lua = {
                runtime = {
                    -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                    version = 'LuaJIT',
                    -- Setup your lua path
                    path = runtime_path,
                },
                diagnostics = {
                    -- Get the language server to recognize the `vim` global
                    globals = {'vim'},
                },
                workspace = {
                    -- Make the server aware of Neovim runtime files
                    library = vim.api.nvim_get_runtime_file("", true),
                },
                -- Do not send telemetry data containing a randomized but unique identifier
                telemetry = {
                    enable = false,
                },
            },
        },
    }
end
-- }}}

local nvim_cmp_init = function ()

    local cmp=require'cmp'
    local lspkind = require('lspkind')

    cmp.setup({
        formatting = {
            format = lspkind.cmp_format(),
        },
        snippet = {
            -- REQUIRED - you must specify a snippet engine
            expand = function(args)
                vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
            end,
        },
        mapping = require("vd.keymaps").nvim_cmp_keymaps(cmp),
        sources = cmp.config.sources({
            { name = 'nvim_lsp' },
            { name = 'ultisnips' }, -- For ultisnips users.
        }, {
                { name = 'buffer' },
                { name = 'path'}
            })
    })

    -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline('/', {
        sources = {
            { name = 'buffer' }
        }
    })

    -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline(':', {
        sources = cmp.config.sources({
            { name = 'path' }
        }, {
                { name = 'cmdline' }
            })
    })

end

local function polyglot_init()
    vim.g.polyglot_is_disabled = {autoindent=false}
end

return {
    polyglot_init = polyglot_init,
    lsp_init = lsp_init,
    nvim_cmp_init = nvim_cmp_init,
    telescope_init = telescope_init,
    treesitter_init = treesitter_init,
    fugitive_init = fugitive_init,
    airline_init = airline_init,
    coc_init = coc_init,
    ale_init = ale_init,
    lsp_server_init = lsp_server_init,
    ultisnips_init = ultisnips_init,
    test = test
}
