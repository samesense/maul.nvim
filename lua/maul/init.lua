local M = {}

local registry = require("maul.registry")

function M.setup()
	-- optional: nothing required here, but keep for API symmetry
end

function M.load(name)
	local theme = registry[name]
	if not theme then
		error("Unknown theme: " .. name)
	end

	local cp = require("catppuccin")

	cp.setup({
		flavour = theme.flavour,
		color_overrides = {
			[theme.flavour] = theme.palette,
		},
	})

	vim.cmd.colorscheme("catppuccin-" .. theme.flavour)
	vim.cmd("redraw!")
end

return M
