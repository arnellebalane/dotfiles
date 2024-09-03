local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        'git',
        'clone',
        'https://github.com/folke/lazy.nvim.git',
        '--filter=blob:none',
        '--branch=stable',
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup('arnelle.plugins', {
    ui = {
        border = 'rounded',
    },
    checker = {
        enabled = true,
        notify = false,
    },
    change_detection = {
        notify = false,
    },
})

vim.api.nvim_set_hl(0, 'LazyButton', { link = 'SpecialChar' })
vim.api.nvim_set_hl(0, 'LazyButtonActive', { link = 'LazyH1' })
vim.api.nvim_set_hl(0, 'LazySpecial', { link = 'Comment' })
