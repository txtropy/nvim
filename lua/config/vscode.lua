local map = vim.keymap.set
local vsc = require("vscode")

local function action(cmd)
	return function()
		vsc.action(cmd)
	end
end

-- editor actions delegated to VSCode
map("n", "gd", action("editor.action.revealDefinition"), { desc = "Go to definition" })
map("n", "gr", action("editor.action.goToReferences"), { desc = "Go to references" })
map("n", "gi", action("editor.action.goToImplementation"), { desc = "Go to implementation" })
map("n", "K", action("editor.action.showHover"), { desc = "Show hover" })
map("n", "<leader>ca", action("editor.action.quickFix"), { desc = "Code action" })
map("n", "<leader>rn", action("editor.action.rename"), { desc = "Rename symbol" })
map("n", "[d", action("editor.action.marker.prev"), { desc = "Prev diagnostic" })
map("n", "]d", action("editor.action.marker.next"), { desc = "Next diagnostic" })
map("n", "<leader>b", action("editor.debug.action.toggleBreakpoint"), { desc = "Toggle breakpoint" })

-- workbench
map("n", "<leader>e", action("workbench.action.toggleSidebarVisibility"), { desc = "Toggle sidebar" })
map("n", "<leader>ff", action("workbench.action.quickOpen"), { desc = "Quick open" })
map("n", "<leader>fw", action("workbench.action.quickTextSearch"), { desc = "Quick text search" })
map("n", "<leader>fg", action("workbench.action.findInFiles"), { desc = "Find in files" })
map("n", "<leader>x", action("workbench.action.closeActiveEditor"), { desc = "Close active tab" })
map("n", "<leader>qa", action("workbench.action.closeAllEditors"), { desc = "Close all vscode tabs" })
map("n", "<leader>qs", action("workbench.action.closeOtherEditors"), { desc = "Close all vscode tabs except the active one" })

-- useful keymaps
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "[M]ove selected lines down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "[M]ove selected lines up" })
map("v", "<", "<gv")
map("v", ">", ">gv")
