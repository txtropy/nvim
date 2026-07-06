local gh = require("config.utils").gh

-- view custom keybindings in a preview panel
vim.pack.add({ gh("folke/which-key.nvim") })
require("which-key").setup({
	delay = 0,
	icons = { mappings = vim.g.have_nerd_font },
})

-- indentation
vim.pack.add({ gh("lukas-reineke/indent-blankline.nvim") })
require("ibl").setup({})
vim.pack.add({ gh("NMAC427/guess-indent.nvim") })
require("guess-indent").setup({})

-- colorschemes
---- tokyonight
vim.pack.add({ gh("folke/tokyonight.nvim") })
require("tokyonight").setup({
	styles = {
		comments = { italic = false },
	},
})

---- onedark
vim.pack.add({ gh("navarasu/onedark.nvim") })
require("onedark").setup({ style = "darker" })
require("onedark").load()

---- gruvbox
vim.pack.add({ gh("ellisonleao/gruvbox.nvim") })
require("gruvbox").setup({ contrast = "hard" })

---- kanagawa
vim.pack.add({ gh("rebelot/kanagawa.nvim") })

-- background transparency
vim.pack.add({ gh("xiyaowong/transparent.nvim") })
vim.keymap.set("n", "<leader>tt", "<CMD>TransparentToggle<CR>", { desc = "[T]oggle background [t]ransparency" })

-- cursor animation
vim.pack.add({ gh("sphamba/smear-cursor.nvim") })
require("smear_cursor").setup({})

-- highlight tags like TODO, HACK, BUG, NOTE, etc.
vim.pack.add({ gh("folke/todo-comments.nvim") })
require("todo-comments").setup({ signs = false })

-- statusline and dev icons
vim.pack.add({
	gh("nvim-tree/nvim-web-devicons"),
	gh("nvim-lualine/lualine.nvim"),
})

-- default colorscheme
vim.o.background = "dark"
vim.cmd.colorscheme("gruvbox")
require("lualine").setup({ options = { theme = "gruvbox" } })
