vim.api.nvim_create_autocmd('VimEnter', {
    callback = function()
        local cwd = vim.fn.getcwd()
        vim.fn.system({ '/opt/homebrew/bin/watchman', 'watch-project', cwd })

        -- Register trigger to send checktime on file changes
        vim.fn.system({
            '/opt/homebrew/bin/watchman',
            '--',
            'trigger',
            cwd,
            'file-change',
            '**/*',
            '--',
            'nvim',
            '--server',
            './nvim.sock',
            '--remote-send',
            ':checktime<CR>',
        })
    end,
    once = true,
})

vim.api.nvim_create_autocmd('VimLeave', {
    callback = function()
        local cwd = vim.fn.getcwd()
        vim.fn.system({ 'watchman', 'watch-del', cwd })
    end,
})
