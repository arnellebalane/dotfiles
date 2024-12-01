return {
    'akinsho/git-conflict.nvim',
    config = function()
        require('git-conflict').setup()

        -- override theme
        local colors = require('base16-colorscheme').colors
        local utils = require('arnelle.core.utils')

        utils.bg('GitConflictCurrent', colors.base12)
        utils.bg('GitConflictCurrentLabel', colors.base01)
        utils.bg('GitConflictIncoming', colors.base13)
        utils.bg('GitConflictIncomingLabel', colors.base13)
        utils.bg('GitConflictAncestor', colors.base02)
        utils.bg('GitConflictAncestorLabel', colors.base01)

        utils.normal('GitConflictCurrent')
        utils.normal('GitConflictIncoming')
        utils.normal('GitConflictAncestor')
    end
}
