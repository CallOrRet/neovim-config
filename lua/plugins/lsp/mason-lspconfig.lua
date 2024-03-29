return {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
        "williamboman/mason.nvim",
        "neovim/nvim-lspconfig",
        "hrsh7th/cmp-nvim-lsp",
    },
    event = "VeryLazy",
    config = function()
        local lspconfig = require("lspconfig")
        local mason_lspconfig = require("mason-lspconfig")

        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

        require("lspconfig.ui.windows").default_options.border = "rounded"
        vim.diagnostic.config({ float = { border = 'rounded' } })
        vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
        vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help,
            { border = "rounded" })

        local on_attach = function(_, bufnr)
            local keymap = vim.keymap.set
            local opts = { noremap = true, silent = true }

            opts.buffer = bufnr

            -- set keybinds
            opts.desc = "Go to declaration"
            keymap("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

            opts.desc = "Show LSP definitions"
            keymap("n", "gd", vim.lsp.buf.definition, opts) -- show lsp definitions

            opts.desc = "Show LSP references"
            keymap("n", "gr", vim.lsp.buf.references, opts) -- show definition, references

            opts.desc = "Show LSP implementations"
            keymap("n", "gi", vim.lsp.buf.implementation, opts) -- show lsp implementations

            opts.desc = "Show LSP type definitions"
            keymap("n", "gt", vim.lsp.buf.type_definition, opts) -- show lsp type definitions

            opts.desc = "See available code actions"
            keymap({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

            opts.desc = "Formatting code"
            keymap('n', '<leader>cf', function()
                vim.lsp.buf.format { async = true }
            end, opts)

            opts.desc = "Smart rename"
            keymap("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

            opts.desc = "Show buffer diagnostics"
            keymap("n", "<leader>D", vim.diagnostic.show, opts) -- show  diagnostics for file

            opts.desc = "Show line diagnostics"
            keymap("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

            opts.desc = "Go to previous diagnostic"
            keymap("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

            opts.desc = "Go to next diagnostic"
            keymap("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

            opts.desc = "Show documentation for what is under cursor"
            keymap("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

            opts.desc = "Show documentation for what is under cursor"
            keymap("n", "<C-k>", vim.lsp.buf.signature_help, opts) -- show documentation for what is under cursor

            opts.desc = "Restart LSP"
            keymap("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
        end


        mason_lspconfig.setup({
            handlers = {
                function(server_name)
                    if server_name == "lua_ls" then
                        require("neodev").setup()
                        lspconfig[server_name].setup({
                            capabilities = capabilities,
                            on_attach = on_attach,
                            {
                                settings = {
                                    Lua = {
                                        format = {
                                            enable = false,
                                        },
                                        diagnostics = {
                                            globals = { "vim", "spec" },
                                        },
                                        runtime = {
                                            version = "LuaJIT",
                                            special = {
                                                spec = "require",
                                            },
                                        },
                                        workspace = {
                                            checkThirdParty = false,
                                            library = {
                                                [vim.fn.expand "$VIMRUNTIME/lua"] = true,
                                                [vim.fn.stdpath "config" .. "/lua"] = true,
                                            },
                                        },
                                        telemetry = {
                                            enable = false,
                                        },
                                    },
                                },
                            }
                        })
                    else
                        lspconfig[server_name].setup({
                            capabilities = capabilities,
                            on_attach = on_attach,
                        })
                    end
                end,
            }
        })
    end
}
