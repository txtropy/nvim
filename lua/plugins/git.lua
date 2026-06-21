local gh = require("config.utils").gh

vim.pack.add({ gh("lewis6991/gitsigns.nvim") })
require("gitsigns").setup({
	signs = {
		add = { text = "+" },
		change = { text = "~" },
		delete = { text = "_" },
		topdelete = { text = "‾" },
		changedelete = { text = "~" },
	},
	on_attach = function(bufnr)
		local gitsigns = require("gitsigns")

		local function map(mode, l, r, opts)
			opts = opts or {}
			opts.buffer = bufnr
			vim.keymap.set(mode, l, r, opts)
		end

		-- navigation
		map("n", "]c", function()
			if vim.wo.diff then
				vim.cmd.normal({ "]c", bang = true })
			else
				gitsigns.nav_hunk("next")
			end
		end, { desc = "Next git [c]hange" })

		map("n", "[c", function()
			if vim.wo.diff then
				vim.cmd.normal({ "[c", bang = true })
			else
				gitsigns.nav_hunk("prev")
			end
		end, { desc = "Prev git [c]hange" })

		-- actions
		-- (normal + visual) mode
		map("v", "<leader>ghs", function() gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, { desc = "(Visual) Stage hunk" })
		map("v", "<leader>ghr", function() gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, { desc = "(Visual) Stage hunk" })
		map("n", "<leader>ghs", gitsigns.stage_hunk, { desc = "Stage hunk" })
		map("n", "<leader>ghr", gitsigns.reset_hunk, { desc = "Reset hunk" })
		map("n", "<leader>ghS", gitsigns.stage_buffer, { desc = "Stage buffer" })
		map("n", "<leader>ghR", gitsigns.reset_buffer, { desc = "Reset buffer" })
		map("n", "<leader>ghp", gitsigns.preview_hunk, { desc = "Preview hunk" })
		map("n", "<leader>ghi", gitsigns.preview_hunk_inline, { desc = "Preview hunk inline" })
		map("n", "<leader>ghb", function() gitsigns.blame_line({ full = true }) end, { desc = "Blame line" })
		map("n", "<leader>ghB", gitsigns.blame, { desc = "Blame buffer" })
		map("n", "<leader>ghd", gitsigns.diffthis, { desc = "Diff against index" })
		map("n", "<leader>ghD", function() gitsigns.diffthis("~") end, { desc = "Diff against last commit" })
		-- toggles
		map("n", "<leader>gtb", gitsigns.toggle_current_line_blame, { desc = "Toggle blame line" })
		map("n", "<leader>gtw", gitsigns.toggle_word_diff, { desc = "Toggle word diff" })
		map("n", "<leader>gth", gitsigns.toggle_linehl, { desc = "Toggle line highlight" })
		map("n", "<leader>gts", gitsigns.toggle_signs, { desc = "Toggle signs" })
	end,
})

vim.pack.add({ gh("akinsho/toggleterm.nvim") })
require("toggleterm").setup({
	size = 10,
	open_mapping = [[<c-\>]],
	shell = vim.fn.executable("pwsh") == 1 and "pwsh" or "powershell.exe",
	direction = "float",
})

local Terminal = require("toggleterm.terminal").Terminal

local lazygit = Terminal:new({
	cmd = "lazygit",
	direction = "float",
	hidden = true,
})

vim.keymap.set("n", "<leader>gg", function()
	lazygit:toggle()
end, { desc = "Lazy[G]it" })
