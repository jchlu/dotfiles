local font_config = require 'config/font_config'

-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
-- config.color_scheme = 'Catppuccin Mocha'
config.color_scheme = 'tokyonight_night'

config.window_background_opacity = 0.9

font_config.apply_to_config(config)
-- and finally, return the configuration to wezterm
return config
