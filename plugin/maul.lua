if vim.g.loaded_maul == 1 then
	return
end
vim.g.loaded_maul = 1

vim.api.nvim_create_user_command("MaulList", function()
	local registry = require("maul.registry")
	for name, _ in pairs(registry) do
		print(name)
	end
end, {})

vim.api.nvim_create_user_command("MaulLoad", function(opts)
	require("maul").load(opts.args)
end, {
	nargs = 1,
	complete = function()
		return vim.tbl_keys(require("maul.registry"))
	end,
})
