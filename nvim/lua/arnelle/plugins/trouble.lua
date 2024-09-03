return {
    'folke/trouble.nvim',
    opts = {
        focus = true,
    },
    cmd = 'Trouble',
    keys = {
        {
            '<leader>xx',
            ':Trouble diagnostics toggle<CR>',
            desc = 'Toggle diagnostics',
            silent = true,
        },
        {
            '<leader>xb',
            ':Trouble diagnostics toggle filter.buf=0<CR>',
            desc = 'Toggle diagnostics for current buffer',
            silent = true,
        },
    },
}
