return {
    'romgrk/barbar.nvim',
    version = '^1.0.0',
    dependencies = {
        'lewis6991/gitsigns.nvim',
        'nvim-tree/nvim-web-devicons',
        'RRethy/base16-nvim',
    },
    init = function()
        vim.g.barbar_auto_setup = false
    end,
    config = function()
        require('barbar').setup({
            animation = false,
            auto_hide = false,
            focus_on_close = 'left',
            icons = {
                separator = {
                    left = '',
                    right = '',
                },
                separator_at_end = false,
                filetype = {
                    -- Hiding icons until support for highlighting them when the file is modified
                    -- becomes available: https://github.com/romgrk/barbar.nvim/issues/199
                    enabled = false,
                    custom_colors = true,
                },
            },
            insert_at_end = true,
            minimum_padding = 1,
            maximum_padding = 1,
            sidebar_filetypes = {
                NvimTree = {
                    text = 'File Explorer',
                    align = 'left',
                },
            },
            no_name_title = '[New Buffer]',
        })

        -- set keymaps
        vim.keymap.set('n', '<C-n>', ':BufferNext<CR>', { desc = 'Go to next buffer', silent = true })
        vim.keymap.set('n', '<C-p>', ':BufferPrevious<CR>', { desc = 'Go to previous buffer', silent = true })
        vim.keymap.set('n', '<leader>bx', ':BufferClose<CR>', { desc = 'Close current buffer', silent = true })
        vim.keymap.set('n', '<leader>bn', ':enew<CR>', { desc = 'Create new buffer', silent = true })

        -- override theme
        local colors = require('arnelle.core.colors')
        local utils = require('arnelle.core.utils')

        utils.fg_bg('BufferDefaultCurrent', colors.base06, colors.base0D)
        utils.bold('BufferDefaultCurrent')
        utils.bg('BufferDefaultInactive', 'none')
        utils.fg_bg('BufferDefaultInactiveSign', colors.base00, 'none')
        utils.fg_bg('BufferDefaultInactiveSignRight', 'none', 'none')
        utils.fg_bg('BufferOffset', colors.base03, 'none')
        utils.bg('BufferTabpageFill', 'none')
        utils.fg_bg('BufferDefaultCurrentMod', colors.base05, colors.base08)
        utils.bold('BufferDefaultCurrentMod')
        utils.fg_bg('BufferDefaultCurrentModIcon', colors.base05, colors.base08)
        utils.bg('TablineFill', 'none')
    end
}
