local gh = require("config.utils").gh

vim.pack.add({ gh("folke/which-key.nvim") })
require("which-key").setup({
	delay = 0,
	icons = { mappings = vim.g.have_nerd_font },
})

vim.pack.add({ gh("lewis6991/gitsigns.nvim") })
require("gitsigns").setup({
	signs = {
		add = { text = "+" },
		change = { text = "~" },
		delete = { text = "_" },
		topdelete = { text = "‾" },
		changedelete = { text = "~" },
	},
})

vim.pack.add({ gh("NMAC427/guess-indent.nvim") })
require("guess-indent").setup({})

vim.pack.add({ gh("folke/tokyonight.nvim") })
require("tokyonight").setup({
	styles = {
		comments = { italic = false },
	},
})
vim.cmd.colorscheme("tokyonight-storm")

vim.pack.add({ gh("folke/todo-comments.nvim") })
require("todo-comments").setup({ signs = false })

vim.pack.add({
	gh("nvim-tree/nvim-web-devicons"),
	gh("nvim-lualine/lualine.nvim"),
})
require("lualine").setup({ options = { theme = "tokyonight" } })
