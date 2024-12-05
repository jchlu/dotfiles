# Teej's Advent of Neovim crash course on Lua
local variable_arguments = function( ... )
	local arguments = { ... }
	for i, v in ipairs({ ... }) do print(i, v) end
	return unpack(arguments)
end
--[[ local lost = nil
print("====================")
print("1: ", variable_arguments("Hello", "World", "!"))
print("====================")
print("2: ", variable_arguments("Hello", "World", "!"), { lost })
print("====================")
print(lost)
--]]

local setup = function(opts)
	if opts.default == nil then
		opts.default = 17
	end
	print(opts.default, opts.other)
end
--[[
setup { default = 12 }
setup { default = 12, other = "Sausages" }
setup { other = "For tea" }
--]]
