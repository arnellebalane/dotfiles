return {
    'goolord/alpha-nvim',
    event = 'VimEnter',
    config = function()
        local alpha = require('alpha')
        local dashboard = require('alpha.themes.dashboard')

        -- set header
        dashboard.section.header.val = {
            '                                                     ',
            '  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ',
            '  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ',
            '  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ',
            '  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ',
            '  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ',
            '  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ',
            '                                                     ',
        }

        -- set menu
        dashboard.section.buttons.val = {
            dashboard.button('e', '  > New File', ':ene<CR>'),
            dashboard.button('SPC ee', '  > Toggle file explorer', ':NvimTreeToggle<CR>'),
            dashboard.button('SPC ff', '󰱼  > Find File', ':Telescope find_files<CR>'),
            dashboard.button('SPC fs', '  > Find Word', ':Telescope live_grep<CR>'),
            dashboard.button('SPC wr', '󰁯  > Restore Session For Current Directory', ':SessionRestore<CR>'),
            dashboard.button('q', '  > Quit NVIM', ':qa<CR>'),
        }

        -- send config to alpha
        alpha.setup(dashboard.opts)

        -- disable folding on alpha buffer
        vim.cmd([[auto FileType alpha setlocal nofoldenable]])
    end
}
