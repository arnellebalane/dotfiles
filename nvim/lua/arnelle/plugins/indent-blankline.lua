return {
    'lukas-reineke/indent-blankline.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    main = 'ibl',
    config = function ()
        local colors = require('base16-colorscheme').colors
        local utils = require('arnelle.core.utils')

        utils.fg('IblIndentCustom', colors.base01)
        utils.fg('IblScopeCustom', colors.base03)

        require('ibl').setup({
            indent = {
                char = '┊',
                highlight = 'IblIndentCustom',
            },
            scope = {
                show_start = false,
                show_end = false,
                highlight = 'IblScopeCustom',
            },
        })
    end
}
