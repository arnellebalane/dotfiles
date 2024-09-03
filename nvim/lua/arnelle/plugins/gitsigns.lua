return {
    'lewis6991/gitsigns.nvim',
    config = function()
        require('gitsigns').setup({
            signs = {
                add = { text = '┃' },
                change = { text = '┃' },
                changedelete = { text = '┃' },
            },
            signs_staged = {
                add = { text = '┃' },
                change = { text = '┃' },
                changedelete = { text = '┃' },
            },
            signs_staged_enable = false,
            current_line_blame_opts = {
                delay = 0,
            },
        })

        -- keymaps
        vim.keymap.set('n', '<leader>gb', ':Gitsigns toggle_current_line_blame<CR>', { desc = 'Toggle current line blame', silent = true })
    end
}
