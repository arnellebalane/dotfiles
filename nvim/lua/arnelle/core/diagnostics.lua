vim.diagnostic.config({
    signs = {
        severity = {
            vim.diagnostic.severity.ERROR,
            vim.diagnostic.severity.WARN,
            vim.diagnostic.severity.INFO,
        },
    },
    virtual_text = {
        severity = {
            vim.diagnostic.severity.ERROR,
            vim.diagnostic.severity.WARN,
        },
    },
    float = {
        header = '',
        close_events = {
            'CursorMoved',
            'BufHidden',
            'LspDetach',
        },
        suffix = function (diagnostic)
            return ' ' .. diagnostic.source .. '(' .. diagnostic.code .. ')'
        end,
    },
})

-- keymaps
vim.keymap.set('n', 'J', vim.diagnostic.open_float)
