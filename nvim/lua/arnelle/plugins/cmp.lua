return {
    'hrsh7th/nvim-cmp',
    dependencies = {
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'saadparwaiz1/cmp_luasnip',
        'L3MON4D3/LuaSnip',
    },
    config = function()
        local cmp = require('cmp')
        local cmp_select = {
            behavior = cmp.SelectBehavior.Select,
        }
        local border_options = {
            winhighlight = 'Normal:CmpDocNormal,FloatBorder:CmpDocBorder',
        }

        cmp.setup({
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'luasnip' },
            }, {
                { name = 'buffer' },
                { name = 'path' },
            }),
            mapping = cmp.mapping.preset.insert({
                ['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<C-j>'] = cmp.mapping.select_next_item(cmp_select),
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<CR>'] = cmp.mapping.confirm({ select = true }),
            }),
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body)
                end,
            },
            completion = {
                keyword_length = 2,
                completeopt = 'menu,menuone,noinsert',
            },
            window = {
                completion = cmp.config.window.bordered(border_options),
                documentation = cmp.config.window.bordered(border_options),
            },
        })

        -- override theme
        local colors = require('arnelle.core.colors')
        local utils = require('arnelle.core.utils')

        utils.bg('PmenuThumb', colors.base02)
        utils.bg('CmpItemAbbr', 'none')
        utils.bg('CmpDocNormal', 'none')
        utils.fg('CmpDocBorder', colors.base02)
    end,
}
