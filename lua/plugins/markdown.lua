local gh = require("config.utils").gh

vim.pack.add({
	gh("MeanderingProgrammer/render-markdown.nvim"),
	-- run this manually, once after installing the plugin 'markdown-preview.nvim'
	-- vim cmd: call mkdp#util#install()
	gh("iamcco/markdown-preview.nvim"),
})

require("render-markdown").setup({})

local map = vim.keymap.set
map("n", "<leader>mp", "<cmd>MarkdownPreviewToggle<cr>", { desc = "[M]arkdown [P]review Toggle" })
