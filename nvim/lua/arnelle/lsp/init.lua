local capabilities = require('cmp_nvim_lsp').default_capabilities()

vim.lsp.config('*', {
    capabilities = capabilities,
})

require('arnelle.lsp.servers.arduino_language_server')
require('arnelle.lsp.servers.biome')
require('arnelle.lsp.servers.clangd')
require('arnelle.lsp.servers.eslint')
require('arnelle.lsp.servers.lua_ls')

-- disable semantic tokens
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('CustomLspConfig', {}),
    callback = function(env)
        local client = vim.lsp.get_client_by_id(env.data.client_id)
        client.server_capabilities.semanticTokensProvider = nil
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
