return {
    'williamboman/mason.nvim',
    dependencies = {
        'williamboman/mason-lspconfig.nvim',
        'neovim/nvim-lspconfig',
    },
    config = function()
        require('mason').setup({
            ui = {
                border = 'rounded',
            },
        })
        require('mason-lspconfig').setup({
            ensure_installed = {
                'astro',
                'arduino_language_server',
                'biome',
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
                'pyright',
                'svelte',
                'tailwindcss',
                'ts_ls',
                'vuels',
            },
        })
    end,
}
