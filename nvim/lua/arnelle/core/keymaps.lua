vim.g.mapleader = ' '

vim.keymap.set('n', '<leader>nh', ':nohl<CR>', { desc = 'Clear search highlights' })
vim.keymap.set('n', 'U', ':redo<CR>', { desc = 'Redo change', noremap = true, silent = true })

-- navigation
vim.keymap.set('i', '<C-h>', '<Left>')
vim.keymap.set('i', '<C-j>', '<Down>')
vim.keymap.set('i', '<C-k>', '<Up>')
vim.keymap.set('i', '<C-l>', '<Right>')
vim.keymap.set('n', '<C-d>', '<C-d>zz', { noremap = false })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { noremap = false })
vim.keymap.set('n', '{', '{zz', { noremap = false })
vim.keymap.set('n', '}', '}zz', { noremap = false })

vim.keymap.set('n', '<leader>mj', ':move +1<CR>', { noremap = false, silent = true })
vim.keymap.set('n', '<leader>mk', ':move -2<CR>', { noremap = false, silent = true })

-- window management
vim.keymap.set('n', '<leader>se', ':vsplit<CR>', { desc = 'Split window vertically', silent = true })
vim.keymap.set('n', '<leader>so', ':split<CR>', { desc = 'Split window horizontally', silent = true })
vim.keymap.set('n', '<leader>s=', '<C-w>=', { desc = 'Make splits equal size', silent = true })
vim.keymap.set('n', '<leader>sx', ':close<CR>', { desc = 'Close current split', silent = true })

-- refactoring
vim.keymap.set('n', '<leader>rs', vim.lsp.buf.rename, { desc = 'Rename symbol' })
