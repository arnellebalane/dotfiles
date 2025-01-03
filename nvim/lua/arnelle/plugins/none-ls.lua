return {
    'nvimtools/none-ls.nvim',
    config = function()
        local null_ls = require('null-ls')
        local formatting = null_ls.builtins.formatting

        local augroup = vim.api.nvim_create_augroup('LspFormatting', {})

        null_ls.setup({
            sources = {
                -- actions.eslint,
                -- diagnostics.eslint,
                -- diagnostics.markdownlint,
                -- diagnostics.tsc,
                -- formatting.eslint,
                formatting.black,
                formatting.prettier,
                -- formatting.stylelint,
                -- formatting.trim_newlines,
                -- formatting.trim_whitespace,
            },
            on_attach = function(client, bufnr)
                if client.supports_method('textDocument/formatting') then
                    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
                    vim.api.nvim_create_autocmd('BufWritePre', {
                        group = augroup,
                        buffer = bufnr,
                        callback = function()
                            vim.lsp.buf.format({ bufnr = bufnr })
                        end,
                    })
                end
            end,
        })
    end
}
