local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.default_prog = { '/opt/homebrew/bin/tmux', 'new-session', '-As', 'default' }

config.color_scheme = 'darkmoss (base16)'
config.enable_tab_bar = false
config.window_decorations = 'RESIZE'
config.window_padding = {
    left = 20,
    right = 20,
    top = 20,
    bottom = 10,
}

config.font = wezterm.font('Fira Code')
config.font_size = 15.5


config.harfbuzz_features = { 'zero', 'cv01', 'cv02', 'cv06', 'ss01', 'onum', 'ss05', 'cv31', 'cv30', 'cv18' }

return config
