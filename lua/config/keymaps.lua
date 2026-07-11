local map = vim.keymap.set

map("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- window navigation
map("n", "<C-h>", "<C-w><C-h>", { desc = "Move to the left window" })
map("n", "<C-l>", "<C-w><C-l>", { desc = "Move to the right window" })
map("n", "<C-k>", "<C-w><C-k>", { desc = "Move to the upper window" })
map("n", "<C-j>", "<C-w><C-j>", { desc = "Move to the lower window" })

-- NOTE: some terminals have colliding keymaps or are not able to send distinct keycodes
map("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
map("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
map("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })
map("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })

-- diagnostics
map("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic" })
map("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- useful keymaps
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "[M]ove selected lines down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "[M]ove selected lines up" })
map("v", "<", "<gv")
map("v", ">", ">gv")
map("t", "<Esc>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })
