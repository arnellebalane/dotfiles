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
})
