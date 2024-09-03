return {
    'neovim/nvim-lspconfig',
    dependencies = {
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        'hrsh7th/nvim-cmp',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'saadparwaiz1/cmp_luasnip',
        'L3MON4D3/LuaSnip',
    },
    config = function()
        local lspconfig = require('lspconfig')
        local capabilities = require('cmp_nvim_lsp').default_capabilities()

        require('mason').setup({
            ui = {
                border = 'rounded',
            },
        })
        require('mason-lspconfig').setup({
            ensure_installed = {
                'astro',
                'arduino_language_server',
                'clangd',
                'cssls',
                'css_variables',
                'cssmodules_ls',
                'emmet_language_server',
                'eslint',
                'html',
                'jsonls',
                'lua_ls',
                'marksman',
                'svelte',
                'tailwindcss',
                'vuels',
            },
            handlers = {
                function(server_name)
                    if server_name == 'tsserver' then
                        -- https://github.com/neovim/nvim-lspconfig/pull/3232#issuecomment-2331025714
                        server_name = 'ts_ls'
                    end
                    lspconfig[server_name].setup({
                        capabilities = capabilities,
                    })
                end,
                arduino_language_server = function()
                    lspconfig.arduino_language_server.setup({
                        capabilities = capabilities,
                        cmd = {
                            'arduino-language-server',
                            '-cli-config',
                            '$HOME/Library/Arduino15/arduino-cli.yaml',
                        },
                    })
                end,
                clangd = function()
                    lspconfig.clangd.setup({
                        capabilities = capabilities,
                        filetypes = { 'arduino', 'c', 'cpp', 'objc', 'objcpp', 'cuda', 'proto' },
                    })
                end,
                lua_ls = function()
                    lspconfig.lua_ls.setup({
                        capabilities = capabilities,
                        settings = {
                            Lua = {
                                runtime = {
                                    version = 'LuaJIT',
                                },
                                diagnostics = {
                                    globals = { 'vim' },
                                },
                            },
                        },
                    })
                end,
            },
        })

        local cmp = require('cmp')
        local cmp_select = {
            behavior = cmp.SelectBehavior.Select,
        }
        local border_options = {
            winhighlight = 'Normal:CmpDocNormal,FloatBorder:CmpDocBorder',
        }

        cmp.setup({
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'luasnip' },
            }, {
                { name = 'buffer' },
                { name = 'path' },
            }),
            mapping = cmp.mapping.preset.insert({
                ['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<C-j>'] = cmp.mapping.select_next_item(cmp_select),
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<CR>'] = cmp.mapping.confirm({ select = true }),
            }),
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body)
                end,
            },
            completion = {
                keyword_length = 2,
                completeopt = 'menu,menuone,noinsert',
            },
            window = {
                completion = cmp.config.window.bordered(border_options),
                documentation = cmp.config.window.bordered(border_options),
            },
        })

        -- override theme
        local colors = require('arnelle.core.colors')
        local utils = require('arnelle.core.utils')

        utils.bg('PmenuThumb', colors.base02)
        utils.bg('CmpItemAbbr', 'none')
        utils.bg('CmpDocNormal', 'none')
        utils.fg('CmpDocBorder', colors.base02)

        -- disable semantic tokens
        vim.api.nvim_create_autocmd('LspAttach', {
            group = vim.api.nvim_create_augroup('CustomLspConfig', {}),
            callback = function(env)
                local client = vim.lsp.get_client_by_id(env.data.client_id)
                client.server_capabilities.semanticTokensProvider = nil
            end
        })
    end,
}
