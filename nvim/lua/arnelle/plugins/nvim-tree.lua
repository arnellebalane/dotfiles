return {
    'nvim-tree/nvim-tree.lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        local nvimtree = require('nvim-tree')

        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1

        nvimtree.setup({
            view = {
                width = 40,
            },
            -- change folder arrow icons
            renderer = {
                indent_markers = {
                    enable = false,
                },
                icons = {
                    git_placement = 'after',
                },
                highlight_git = true,
            },
            -- disable window_picker for explorer to work well with window splits
            actions = {
                open_file = {
                    window_picker = {
                        enable = false,
                    },
                },
            },
            git = {
                ignore = false,
                show_on_dirs = false,
            },
        })

        -- set keymaps
        vim.keymap.set('n', '<leader>ee', ':NvimTreeToggle<CR>', { desc = 'Toggle file explorer', silent = true })
        vim.keymap.set('n', '<leader>ef', ':NvimTreeFindFileToggle<CR>', { desc = 'Toggle file explorer on current file', silent = true })
        vim.keymap.set('n', '<leader>ec', ':NvimTreeCollapse<CR>', { desc = 'Collapse file explorer', silent = true })
        vim.keymap.set('n', '<leader>er', ':NvimTreeRefresh<CR>', { desc = 'Refresh file explorer', silent = true })
    end
}
