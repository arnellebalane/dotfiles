return {
    'RRethy/base16-nvim',
    priority = 1000,
    config = function()
        vim.cmd('colorscheme base16-darkmoss')

        local colors = require('arnelle.core.colors')
        local utils = require('arnelle.core.utils')

        utils.bg('Normal', 'none')
        utils.bg('NormalNC', 'none')
        utils.fg_bg('NormalFloat', colors.base0F, colors.base00)
        utils.fg_bg('FloatBorder', colors.base02, colors.base00)
        utils.fg_bg('FloatTitle', colors.base05, colors.base02)
        utils.fg_bg('LineNr', colors.base03, 'none')
        utils.fg('WinSeparator', colors.base01)

        -- trouble.nvim
        utils.fg('TroubleCode', colors.base04)
    end
}
