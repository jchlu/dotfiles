return { 
  'echasnovski/mini.nvim',
  version = false,
  config = function()
    require('mini.align').setup()
    require('mini.icons').setup()
    require('mini.pairs').setup()
    require('mini.statusline').setup { use_icons = true }
    require('mini.surround').setup()
    require('mini.files').setup({  -- Customization of explorer windows
      windows = {
	-- Maximum number of windows to show side by side
	max_number = 3,
	-- Whether to show preview of file/directory under cursor
	preview = true,
	-- Width of focused window
	width_focus = 50,
	-- Width of non-focused window
	width_nofocus = 15,
	-- Width of preview window
	width_preview = 70,
      }
    })
  end
}
