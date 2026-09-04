local capabilities = require('cmp_nvim_lsp').default_capabilities()

vim.lsp.config('*', {
    capabilities = capabilities,
})

require('arnelle.lsp.servers.arduino_language_server')
require('arnelle.lsp.servers.biome')
require('arnelle.lsp.servers.clangd')
require('arnelle.lsp.servers.eslint')
require('arnelle.lsp.servers.lua_ls')
require('arnelle.lsp.servers.oxfmt')
require('arnelle.lsp.servers.ruff')

local formatting_augroup = vim.api.nvim_create_augroup('LspFormatting', {})

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('CustomLspConfig', {}),
    callback = function(env)
        local client = vim.lsp.get_client_by_id(env.data.client_id)

        -- disable semantic tokens
        client.server_capabilities.semanticTokensProvider = nil

        -- format on save
        -- (checked again at write-time, not here: some servers like ruff and
        -- pyright register formatting support dynamically, shortly after
        -- LspAttach fires, so client:supports_method(...) is unreliable here)
        vim.api.nvim_clear_autocmds({ group = formatting_augroup, buffer = env.buf })
        vim.api.nvim_create_autocmd('BufWritePre', {
            group = formatting_augroup,
            buffer = env.buf,
            callback = function()
                local formatters = vim.lsp.get_clients({ bufnr = env.buf, method = 'textDocument/formatting' })
                if #formatters == 0 then
                    return
                end
                -- biome takes precedence over oxfmt: both can attach to the
                -- same buffer (oxfmt falls back to single-file mode outside
                -- projects it recognizes), so pick one explicitly instead of
                -- letting vim.lsp.buf.format() run every attached formatter.
                local priority = { biome = 1, oxfmt = 2 }
                table.sort(formatters, function(a, b)
                    return (priority[a.name] or 99) < (priority[b.name] or 99)
                end)
                vim.lsp.buf.format({ bufnr = env.buf, name = formatters[1].name })
            end,
        })
    end
})

-- keymaps
vim.keymap.set('n', 'gd', '<C-]>', { desc = 'Go to definition' })

-- enable floating window borders
local open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, options, ...)
    options = options or {}
    options.border = options.border or 'rounded'
    return open_floating_preview(contents, syntax, options, ...)
end
