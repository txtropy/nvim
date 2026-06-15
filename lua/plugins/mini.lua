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

require("mini.indentscope").setup({
	draw = {
		delay = 50,
	},
	options = {
		try_as_border = true,
	},
	symbol = "│",
})

-- dashboard/startup page
local starter = require("mini.starter")
starter.setup({
	header = table.concat({
		"                                                     ",
		"  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
		"  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
		"  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
		"  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
		"  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
		"  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
		"                                                     ",
	}, "\n"),
	items = {
		starter.sections.recent_files(5, false, true),
		{ name = "New File", action = "ene | startinsert", section = "Actions" },
		{ name = "Quit Neovim", action = "qa", section = "Actions" },
	},
	content_hooks = {
		starter.gen_hook.adding_bullet("    "),
		starter.gen_hook.indexing("all", {}),
		starter.gen_hook.aligning("center", "center"),
	},
	footer = function()
		local elapsed = (vim.uv.hrtime() - (vim.g._start_time or vim.uv.hrtime())) / 1e6
		return ("⚡ Loaded in %.2fms"):format(elapsed)
	end,
	evaluate_single = true,
})
