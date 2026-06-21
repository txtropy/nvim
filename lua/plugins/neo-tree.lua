vim.pack.add({
	{ src = "https://github.com/nvim-neo-tree/neo-tree.nvim", version = vim.version.range("*") },
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/MunifTanjim/nui.nvim",
})

vim.keymap.set("n", "\\", function()
	if vim.bo.filetype == "ministarter" then
		vim.cmd("Neotree toggle filesystem")
	else
		vim.cmd("Neotree reveal")
	end
end, { desc = "NeoTree toggle", silent = true })

require("neo-tree").setup({
	filesystem = {
		window = {
			mappings = {
				["\\"] = "close_window",
			},
		},
	},
})
