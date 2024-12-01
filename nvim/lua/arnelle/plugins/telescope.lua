return {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
        'nvim-lua/plenary.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
        'nvim-tree/nvim-web-devicons',
    },
    config = function()
        local telescope = require('telescope')
        local actions = require('telescope.actions')
        local builtin = require('telescope.builtin')
        local layouts = require('telescope.pickers.layout_strategies')

        layouts.custom = function(picker, max_columns, max_lines, layout_config)
            local layout = layouts.horizontal(picker, max_columns, max_lines, layout_config)
            layout.prompt.title = ''
            layout.results.title = ''
            layout.preview.title = ''
            return layout
        end

        telescope.setup({
            defaults = {
                prompt_title = '',
                prompt_prefix = '› ',
                selection_caret = '› ',
                path_display = { 'smart' },
                get_status_text = function() return '' end,
                mappings = {
                    i = {
                        ['<C-k>'] = actions.move_selection_previous, -- move to previous result
                        ['<C-j>'] = actions.move_selection_next,     -- move to next  result
                    },
                },
                sorting_strategy = 'ascending',
                layout_strategy = 'custom',
                layout_config = {
                    horizontal = {
                        prompt_position = 'top',
                        width = 0.75,
                        height = 0.5,
                    },
                },
            },
        })

        telescope.load_extension('fzf')

        -- set keymaps
        vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Find files in cwd', silent = true })
        vim.keymap.set('n', '<leader>fs', builtin.live_grep, { desc = 'Find string in cwd', silent = true })
        vim.keymap.set('n', '<leader>fc', builtin.grep_string,
            { desc = 'Find string under cursor in  cwd', silent = true })
        vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Find buffers', silent = true })
        vim.keymap.set('n', '<leader>fg', builtin.git_files, { desc = 'Find files in git project', silent = true })
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Find string in help pages', silent = true })
        vim.keymap.set('n', '<leader>fr', builtin.lsp_references, { desc = 'Find references', silent = true })
        vim.keymap.set('n', '<leader>fm', builtin.resume, { desc = 'Resume last search', silent = true })
    end
}
