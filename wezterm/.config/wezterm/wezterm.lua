-- local font_config = require 'config/font_config'

-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()
config.set_environment_variables = { NEWT_COLORS_FILE = '/home/jchlu/.config/newt-colors.conf' }
-- This is where you actually apply your config choices

-- For example, changing the color scheme:
-- config.color_scheme = 'Catppuccin Mocha'
config.color_scheme = 'tokyonight_night'

config.window_background_opacity = 0.9
-- local font_family = 'AnonymicePro Nerd Font Mono'
-- local font_family = 'CaskaydiaMono Nerd Font Mono'
-- local font_family = 'FiraCode Nerd Font Mono'
-- local font_family = 'FreeMono'
-- local font_family = 'Hack Nerd Font Mono'
-- local font_family = 'Iosevka Nerd Font Mono'
-- local font_family = 'Liberation Mono'
-- local font_family = 'Monofur Nerd Font Mono'
-- local font_family = 'Monoid'
-- local font_family = 'Nimbus Mono PS'
-- local font_family = 'SauceCodePro Nerd Font Mono'
local font_family = 'SauceCodePro Nerd Font Mono'
-- local font_family = 'SpaceMono Nerd Font'
-- local font_family = 'SpaceMono Nerd Font Mono'
-- local font_family = 'Terminus'
-- local font_family = 'VictorMono Nerd Font Mono' -- Funky Italics
-- local font_family = 'ZedMono Nerd Font Mono' -- Fuzzy?

local font_family_for_italic = 'SauceCodePro Nerd Font Mono' -- Funky Italics
-- local font_family_for_italic = 'VictorMono Nerd Font Mono' -- Funky Italics
local font_weight_for_bold = 'Regular'
local font_style_for_bold_italic = 'Italic'

if font_family == 'VictorMono Nerd Font Mono' then
  font_weight_for_bold = 'Medium'
  font_style_for_bold_italic = 'Normal'
end

config.font = wezterm.font { family = font_family }

config.font_rules = {
  {
    intensity = 'Bold',
    italic = false,
    font = wezterm.font {
      family = font_family,
      weight = font_weight_for_bold,
      style = font_style_for_bold_italic,
    },
  },
  {
    intensity = 'Bold',
    italic = true,
    font = wezterm.font {
      family = font_family_for_italic,
      weight = font_weight_for_bold,
      style = font_style_for_bold_italic,
    },
  },
  {
    italic = true,
    intensity = 'Half',
    font = wezterm.font {
      family = font_family,
      weight = 'DemiBold',
      style = font_style_for_bold_italic,
    },
  },
  {
    italic = true,
    intensity = 'Normal',
    font = wezterm.font {
      family = font_family_for_italic,
      style = 'Italic',
    },
  },
}
if
    font_family == 'Monofur Nerd Font Mono'
    or
    font_family == 'SauceCodePro Nerd Font Mono'
then
  config.font_size = 15.0
elseif
    font_family == 'Monoid'
then
  config.font_size = 13.0
else
  config.font_size = 14.0
end

config.bold_brightens_ansi_colors = false

return config
