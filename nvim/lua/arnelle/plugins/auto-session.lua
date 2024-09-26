return {
    'rmagatti/auto-session',
    config = function()
        local auto_session = require('auto-session')

        auto_session.setup({
            auto_restore_enabled = true,
            auto_session_suppress_dirs = {
                '~/',
                '~/dev/',
            },
        })

        -- set keymaps
        vim.keymap.set('n', '<leader>ws', ':SessionSave<CR>', { desc = 'Save session for auto session root dir', silent = true })
        vim.keymap.set('n', '<leader>wr', ':SessionRestore<CR>', { desc = 'Restore session for cwd', silent = true })
    end
}
