local utils = {}

utils.bg = function(group, color)
    vim.cmd('highlight ' .. group .. ' guibg=' .. color)
end

utils.fg = function(group, color)
    vim.cmd('highlight ' .. group .. ' guifg=' .. color)
end

utils.fg_bg = function(group, fg_color, bg_color)
    vim.cmd('highlight ' .. group .. ' guifg=' .. fg_color .. ' guibg=' .. bg_color)
end

utils.bold = function(group)
    vim.cmd('highlight ' .. group .. ' gui=bold')
end

return utils
