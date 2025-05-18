return {
    'goolord/alpha-nvim',
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
            dashboard.button('e', '  New file', ':ene<CR>'),
            dashboard.button('SPC ee', '  Toggle file explorer', ':NvimTreeToggle<CR>'),
            dashboard.button('SPC ff', '󰱼  Find file', ':Telescope find_files<CR>'),
            dashboard.button('SPC fs', '  Find word', ':Telescope live_grep<CR>'),
            dashboard.button('SPC wr', '󰁯  Restore session for current directory', ':SessionRestore<CR>'),
            dashboard.button('q', '  Quit Neovim', ':qa<CR>'),
        }

        -- send config to alpha
        alpha.setup(dashboard.opts)

        -- disable folding on alpha buffer
        vim.cmd([[auto FileType alpha setlocal nofoldenable]])
    end
}
