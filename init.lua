vim.g._start_time = vim.uv.hrtime()

vim.loader.enable()
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = true

if vim.g.vscode then
	require("config.vscode")
	return
end

require("config")
require("plugins")
