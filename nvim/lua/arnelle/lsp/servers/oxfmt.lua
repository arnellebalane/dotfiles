-- Relax the default root_dir (which only activates in projects with an
-- .oxfmtrc.json) so oxfmt formats any project, falling back to the nearest
-- package.json or .git, similar to how prettier used to work via none-ls.
vim.lsp.config('oxfmt', {
    root_dir = function(bufnr, on_dir)
        local fname = vim.api.nvim_buf_get_name(bufnr)
        on_dir(vim.fs.root(fname, {
            '.oxfmtrc.json',
            '.oxfmtrc.jsonc',
            'oxfmt.config.ts',
            'package.json',
            '.git',
        }))
    end,
})
