vim.lsp.config('arduino_language_server', {
    cmd = {
        'arduino-language-server',
        '-cli-config',
        '$HOME/Library/Arduino15/arduino-cli.yaml',
    },
})
