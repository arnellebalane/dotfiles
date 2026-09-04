local capabilities = require('cmp_nvim_lsp').default_capabilities()

vim.lsp.config('*', {
    capabilities = capabilities,
})

require('arnelle.lsp.servers.arduino_language_server')
require('arnelle.lsp.servers.biome')
require('arnelle.lsp.servers.clangd')
require('arnelle.lsp.servers.eslint')
require('arnelle.lsp.servers.lua_ls')
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
                if #vim.lsp.get_clients({ bufnr = env.buf, method = 'textDocument/formatting' }) > 0 then
                    vim.lsp.buf.format({ bufnr = env.buf })
                end
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
