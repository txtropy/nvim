local gh = require("config.utils").gh

vim.pack.add({ gh("folke/which-key.nvim") })
require("which-key").setup({
	delay = 0,
	icons = { mappings = vim.g.have_nerd_font },
})

vim.pack.add({ gh("NMAC427/guess-indent.nvim") })
require("guess-indent").setup({})

-- colorschemes
vim.pack.add({ gh("folke/tokyonight.nvim") })
require("tokyonight").setup({
	styles = {
		comments = { italic = false },
	},
})

vim.pack.add({ gh("navarasu/onedark.nvim") })
require("onedark").setup({ style = "darker" })
require("onedark").load()

vim.pack.add({ gh("folke/todo-comments.nvim") })
require("todo-comments").setup({ signs = false })

vim.pack.add({
	gh("nvim-tree/nvim-web-devicons"),
	gh("nvim-lualine/lualine.nvim"),
})

vim.pack.add({ gh("lukas-reineke/indent-blankline.nvim") })
require("ibl").setup({})

vim.pack.add({ gh("sphamba/smear-cursor.nvim") })
require("smear_cursor").setup({})

-- default colorscheme
vim.cmd.colorscheme("onedark")
require("lualine").setup({ options = { theme = "onedark" } })
