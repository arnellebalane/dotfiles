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
                'python',
                'sql',
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

        -- Neovim 0.12 changed query match[id] from a single TSNode to a list
        -- of TSNodes, but nvim-treesitter's query_predicates.lua still treats
        -- it as a single node in these directives, crashing the highlighter
        -- with "attempt to call method 'range' (a nil value)" (e.g. on any
        -- fenced markdown code block with a language, like ```lua).
        -- Upstream: https://github.com/neovim/neovim/issues/39032
        --           https://github.com/nvim-treesitter/nvim-treesitter/issues/8636
        -- Remove once upstream fixes it.
        do
            local ts_query = require('vim.treesitter.query')
            local html_script_type_languages = {
                importmap = 'json',
                module = 'javascript',
                ['application/ecmascript'] = 'javascript',
                ['text/ecmascript'] = 'javascript',
            }
            local non_filetype_match_injection_language_aliases = {
                ex = 'elixir',
                pl = 'perl',
                sh = 'bash',
                uxn = 'uxntal',
                ts = 'typescript',
            }

            local function get_node(match, id)
                local val = match[id]
                if type(val) == 'table' then
                    return val[1]
                end
                return val
            end

            local function get_parser_from_markdown_info_string(injection_alias)
                local match = vim.filetype.match({ filename = 'a.' .. injection_alias })
                return match or non_filetype_match_injection_language_aliases[injection_alias] or injection_alias
            end

            ts_query.add_directive('set-lang-from-mimetype!', function(match, _, bufnr, pred, metadata)
                local node = get_node(match, pred[2])
                if not node then
                    return
                end
                local type_attr_value = vim.treesitter.get_node_text(node, bufnr)
                local configured = html_script_type_languages[type_attr_value]
                if configured then
                    metadata['injection.language'] = configured
                else
                    local parts = vim.split(type_attr_value, '/', {})
                    metadata['injection.language'] = parts[#parts]
                end
            end, { force = true })

            ts_query.add_directive('set-lang-from-info-string!', function(match, _, bufnr, pred, metadata)
                local node = get_node(match, pred[2])
                if not node then
                    return
                end
                local injection_alias = vim.treesitter.get_node_text(node, bufnr):lower()
                metadata['injection.language'] = get_parser_from_markdown_info_string(injection_alias)
            end, { force = true })

            ts_query.add_directive('downcase!', function(match, _, bufnr, pred, metadata)
                local id = pred[2]
                local node = get_node(match, id)
                if not node then
                    return
                end
                local text = vim.treesitter.get_node_text(node, bufnr, { metadata = metadata[id] }) or ''
                if not metadata[id] then
                    metadata[id] = {}
                end
                metadata[id].text = string.lower(text)
            end, { force = true })
        end

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
        utils.fg('TSPunctSpecial', colors.base04)
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

        utils.normal('TSComment')
        utils.normal('TSVariableBuiltin')
        utils.normal('TSFuncBuiltin')
        utils.normal('TSTypeBuiltin')

        vim.api.nvim_set_hl(0, '@constant.builtin', { link = 'TSBoolean' })
        vim.api.nvim_set_hl(0, '@keyword.exception', { link = 'TSKeyword' })
        vim.api.nvim_set_hl(0, '@string.special.url', { link = 'TSString' })
        vim.api.nvim_set_hl(0, '@tag.delimiter', { link = 'TSPunctDelimiter' })
        vim.api.nvim_set_hl(0, '@variable.css', { link = 'TSField' })
        vim.api.nvim_set_hl(0, '@property.css', { link = 'TSField' })
        vim.api.nvim_set_hl(0, '@tag.attribute.css', { link = 'TSTitle' })
        vim.api.nvim_set_hl(0, '@property.json', { link = 'TSField' })
        vim.api.nvim_set_hl(0, '@tag.builtin.tsx', { link = 'TSTag' })
    end
}
