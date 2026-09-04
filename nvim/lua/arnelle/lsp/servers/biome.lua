vim.lsp.config('biome', {
    root_dir = function(bufnr, on_dir)
        local fname = vim.api.nvim_buf_get_name(bufnr)
        on_dir(vim.fs.root(fname, { 'biome.json' }))
    end,
})
