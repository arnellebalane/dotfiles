return {
    'folke/trouble.nvim',
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
    config = function ()
        require('trouble').setup({
            focus = true,
        })

        -- auto commands
        local group = vim.api.nvim_create_augroup('TroubleAutoCmd', { clear = true })
        vim.api.nvim_create_autocmd('BufEnter', {
            group = group,
            callback = function ()
                if vim.bo.filetype == 'trouble' then
                    vim.wo.wrap = true
                end
            end,
        })
    end,
}
