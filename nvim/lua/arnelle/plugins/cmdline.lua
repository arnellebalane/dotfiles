return {
    'hrsh7th/cmp-cmdline',
    dependencies = {
        'hrsh7th/nvim-cmp',
    },
    config = function()
        local cmp = require('cmp')
        local cmp_select = {
            behavior = cmp.SelectBehavior.Select,
        }

        cmp.setup.cmdline(':', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = 'cmdline' },
            }),
            matching = {
                disallow_symbol_nonprefix_matching = false,
            },
            formatting = {
                format = function(entry, item)
                    item.kind = ''
                    return item
                end
            }
        })
    end,
}
