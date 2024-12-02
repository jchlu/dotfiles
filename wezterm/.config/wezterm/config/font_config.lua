local wezterm = require 'wezterm'

local module = {}

function module.apply_to_config(config)
  config.font = wezterm.font('Monoid', { weight = 'Regular' })
  config.font_rules = {
    -- For Bold-but-not-italic text, use this relatively bold font, and override
    -- its color to a tomato-red color to make bold text really stand out.
    {
      intensity = 'Bold',
      font = wezterm.font_with_fallback {
        family = 'Monoid',
        weight = 'Light',
      },
    },
  }
  config.font_size = 14.0
  config.bold_brightens_ansi_colors = false
end

return module
