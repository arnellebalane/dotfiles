local lspconfig = require('lspconfig')

vim.lsp.config('biome', {
    root_dir = lspconfig.util.root_pattern('biome.json'),
})
