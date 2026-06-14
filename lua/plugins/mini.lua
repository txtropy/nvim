local gh = require("config.utils").gh

vim.pack.add({ gh("nvim-mini/mini.nvim") })

if vim.g.have_nerd_font then
	require("mini.icons").setup()
	MiniIcons.mock_nvim_web_devicons()
end

require("mini.ai").setup({
	mappings = {
		around_next = "an",
		inside_next = "in",
		around_last = "al",
		inside_last = "il",
	},
	n_lines = 500,
})

require("mini.surround").setup()
