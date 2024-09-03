return {
    'nvim-treesitter/nvim-treesitter',
    event = { 'BufReadPre', 'BufNewFile' },
    build = ':TSUpdate',
    dependencies = {
        'RRethy/base16-nvim',
        'windwp/nvim-ts-autotag',
    },
    config = function()
        require('nvim-treesitter.configs').setup({
            highlight = {
                enable = true,
            },
            indent = {
                enable = true,
            },
            autotag = {
                enable = true,
            },
            ensure_installed = {
                'json',
                'jsonc',
                'javascript',
                'typescript',
                'tsx',
                'yaml',
                'html',
                'css',
                'svelte',
                'vue',
                'markdown',
                'markdown_inline',
                'bash',
                'lua',
                'vim',
                'gitignore',
                'git_config',
                'c',
                'cpp',
                'arduino',
                'astro',
            },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = '<C-Space>',
                    node_incremental = '<C-Space>',
                    scope_incremental = false,
                    node_decremental = '<BS>'
                },
            },
        })

        -- set keymaps
        vim.keymap.set('n', '<C-e>', function()
            -- local result = vim.treesitter.get_captures_at_cursor(0)
            -- print(vim.inspect(result))
            vim.cmd(':Inspect')
        end)

        -- override syntax highlighting
        local colors = require('arnelle.core.colors')
        local utils = require('arnelle.core.utils')

        utils.fg('Define', colors.base0D)
        utils.fg('PreProc', colors.base0D)
        utils.fg('TSVariable', colors.base0A)
        utils.fg('TSVariableBuiltin', colors.base0A)
        utils.fg('TSParameter', colors.base0A)
        utils.fg('TSConstant', colors.base0A)
        utils.fg('TSFuncMacro', colors.base0A)
        utils.fg('TSPunctDelimiter', colors.base04)
        utils.fg('TSPunctBracket', colors.base04)
        utils.fg('TSNumber', colors.base0B)
        utils.fg('TSFloat', colors.base0B)
        utils.fg('TSBoolean', colors.base0B)
        utils.fg('TSField', colors.base09)
        utils.fg('TSProperty', colors.base09)
        utils.fg('TSOperator', colors.base04)
        utils.fg('TSFunction', colors.base0F)
        utils.fg('TSFuncBuiltin', colors.base0F)
        utils.fg('TSConstructor', colors.base0F)
        utils.fg('TSMethod', colors.base0F)
        utils.fg('TSKeyword', colors.base0D)
        utils.fg('TSKeywordOperator', colors.base0D)
        utils.fg('TSKeywordFunction', colors.base0D)
        utils.fg('TSRepeat', colors.base0D)
        utils.fg('TSConditional', colors.base0D)
        utils.fg('TSString', colors.base0E)
        utils.fg('TSTag', colors.base0A)
        utils.fg('TSAttribute', colors.base09)
        utils.fg('TSType', colors.base04)
        utils.fg('TSNamespace', colors.base04)
        utils.fg('TSTypeBuiltin', colors.base04)

        vim.api.nvim_set_hl(0, '@constant.builtin', { link = 'TSBoolean' })
        vim.api.nvim_set_hl(0, '@keyword.exception', { link = 'TSKeyword' })
        vim.api.nvim_set_hl(0, '@string.special.url', { link = 'TSString' })
        vim.api.nvim_set_hl(0, '@tag.delimiter', { link = 'TSPunctDelimiter' })
        vim.api.nvim_set_hl(0, '@variable.css', { link = 'TSField' })
        vim.api.nvim_set_hl(0, '@property.css', { link = 'TSField' })
        vim.api.nvim_set_hl(0, '@tag.attribute.css', { link = 'TSTitle' })
        vim.api.nvim_set_hl(0, '@property.json', { link = 'TSField' })
    end
}
