local gh = require("config.utils").gh

vim.pack.add({ gh("stevearc/conform.nvim") })
require("conform").setup({
	notify_on_error = false,

	format_on_save = function(bufnr)
		local enabled_filetypes = {}
		if enabled_filetypes[vim.bo[bufnr].filetype] then
			return { timeout_ms = 500 }
		else
			return nil
		end
	end,

	default_format_opts = {
		lsp_format = "fallback",
	},

	formatters_by_ft = {
		-- python = { "isort", "black" },
		javascript = { "biome", "prettier", stop_after_first = true },
		javascriptreact = { "biome", "prettier", stop_after_first = true },
		typescript = { "biome", "prettier", stop_after_first = true },
		typescriptreact = { "biome", "prettier", stop_after_first = true },
		css = { "biome", "prettier", stop_after_first = true },
		scss = { "prettier" },
		less = { "prettier" },
		-- html formatter is disabled by default because it is still experimental -> I prefer prettier as of now
		-- html = { "biome", "prettier", stop_after_first = true },
		html = { "prettier", "biome", stop_after_first = true },
		json = { "biome", "jq", stop_after_first = true },
		jsonc = { "biome" },
		lua = { "stylua" },
	},
})

vim.keymap.set({ "n", "v" }, "<leader>f", function()
	require("conform").format({ async = true, lsp_format = "fallback" })
end, { desc = "[F]ormat buffer" })
