return {
    'nvim-lualine/lualine.nvim',
    dependencies = {
        'RRethy/base16-nvim',
        'nvim-tree/nvim-web-devicons',
    },
    config = function()
        local lualine = require('lualine')
        local lazy_status = require('lazy.status')

        -- configure custom theme
        local colors = require('arnelle.core.colors')

        local theme = {
            normal = {
                a = { bg = colors.base0D, fg = colors.base06, gui = 'bold' },
                b = { bg = colors.base00, fg = colors.base06 },
                c = { bg = colors.base00, fg = colors.base06 },
                z = { bg = colors.base00, fg = colors.base06 }
            },
            insert = {
                a = { bg = colors.base0B, fg = colors.base06, gui = 'bold' },
                b = { bg = colors.base00, fg = colors.base06 },
                c = { bg = colors.base00, fg = colors.base06 },
                z = { bg = colors.base00, fg = colors.base06 },
            },
            visual = {
                a = { bg = colors.base0F, fg = colors.base06, gui = 'bold' },
                b = { bg = colors.base00, fg = colors.base06 },
                c = { bg = colors.base00, fg = colors.base06 },
                z = { bg = colors.base00, fg = colors.base06 },
            },
            command = {
                a = { bg = colors.base09, fg = colors.base00, gui = 'bold' },
                b = { bg = colors.base00, fg = colors.base06 },
                c = { bg = colors.base00, fg = colors.base06 },
                z = { bg = colors.base00, fg = colors.base06 },
            },
            replace = {
                a = { bg = colors.base08, fg = colors.base06, gui = 'bold' },
                b = { bg = colors.base00, fg = colors.base06 },
                c = { bg = colors.base00, fg = colors.base06 },
                z = { bg = colors.base00, fg = colors.base06 },
            },
            inactive = {
                a = { bg = colors.base00, fg = colors.base03, gui = 'bold' },
                b = { bg = colors.base00, fg = colors.base03 },
                c = { bg = colors.base00, fg = colors.base03 },
            },
        }

        -- configure lualine
        lualine.setup({
            options = {
                theme = theme,
                section_separators = { left = '', right = '' },
                component_separators = { left = '', right = '' },
            },
            sections = {
                lualine_x = {
                    {
                        lazy_status.updates,
                        cond = lazy_status.has_updates,
                        color = { fg = colors.base0F },
                    },
                    { 'filetype' },
                },
                lualine_y = { 'searchcount', 'progress' },
            },
            inactive_sections = {
                lualine_x = {},
                lualine_y = {},
            },
        })
    end
}
