local gh = require("config.utils").gh

vim.pack.add({
	gh("mfussenegger/nvim-dap"),
	gh("rcarriga/nvim-dap-ui"),
	gh("nvim-neotest/nvim-nio"),
	gh("mason-org/mason.nvim"),
	gh("jay-babu/mason-nvim-dap.nvim"),
})

local map = vim.keymap.set

map("n", "<leader>b", function()
	require("dap").toggle_breakpoint()
end, { desc = "Debug: Toggle breakpoint" })

map("n", "<leader>B", function()
	require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
end, { desc = "Debug: Set Breakpoint" })

map("n", "<F5>", function()
	require("dap").continue()
end, { desc = "Debug: Start/Continue" })
map("n", "<F1>", function()
	require("dap").step_into()
end, { desc = "Debug: Step Into" })
map("n", "<F2>", function()
	require("dap").step_over()
end, { desc = "Debug: Step Over" })
map("n", "<S-F2>", function()
	require("dap").step_out()
end, { desc = "Debug: Step Out" })
map("n", "<F7>", function()
	require("dapui").toggle()
end, { desc = "Debug: See last session result." })

map("n", "<leader>dh", function()
	require("dapui").eval()
end, { desc = "Debug: Hover/Eval" })
map("v", "<leader>dh", function()
	require("dapui").eval()
end, { desc = "Debug: Hover/Eval" })

local dap = require("dap")
local dapui = require("dapui")

vim.api.nvim_set_hl(0, "DapBreak", { fg = "#e51400" })
vim.api.nvim_set_hl(0, "DapStop", { fg = "#ffcc00" })
local breakpoint_icons = vim.g.have_nerd_font
		and {
			Breakpoint = "",
			BreakpointCondition = "",
			BreakpointRejected = "",
			LogPoint = "",
			Stopped = "",
		}
	or { Breakpoint = "●", BreakpointCondition = "⊜", BreakpointRejected = "⊘", LogPoint = "◆", Stopped = "⭔" }
for type, icon in pairs(breakpoint_icons) do
	local tp = "Dap" .. type
	local hl = (type == "Stopped") and "DapStop" or "DapBreak"
	vim.fn.sign_define(tp, { text = icon, texthl = hl, numhl = hl })
end

dapui.setup()

dap.listeners.after.event_initialized["dapui_config"] = dapui.open
dap.listeners.after.event_terminated["dapui_config"] = dapui.close
dap.listeners.after.event_exited["dapui_config"] = dapui.close

local mason_path = vim.fn.stdpath("data") .. "\\mason\\packages\\netcoredbg\\netcoredbg\\netcoredbg.exe"

dap.adapters.coreclr = {
	type = "executable",
	command = mason_path,
	args = { "--interpreter=vscode" },
}
dap.configurations.cs = {
	{
		type = "coreclr",
		name = "Launch (pick DLL)",
		request = "launch",
		program = function()
			return vim.fn.input("Path to DLL", vim.fn.getcwd() .. "bin\\Debug\\", "file")
		end,
		cwd = "${workspaceFolder}",
		stopAtEntry = false,
	},
	{
		type = "coreclr",
		name = "Attach to process",
		request = "attach",
		processId = require("dap.utils").pick_process,
	},
}

require("mason").setup()
require("mason-nvim-dap").setup({
	ensure_installed = { "coreclr" },
	automatic_installation = true,
})
