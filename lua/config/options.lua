local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.mouse = "a"
opt.showmode = false

-- enable break indent
opt.breakindent = true

-- enable undo/redo changes even after closing and reopening a file
opt.undofile = true

-- case-insensitive searching
opt.ignorecase = true
opt.smartcase = true
opt.signcolumn = "yes"

-- decrease update time
opt.updatetime = 250

-- decrease mapped sequence wait time
opt.timeoutlen = 300

-- configure how new splits should be opened
opt.splitright = true
opt.splitbelow = true

vim.o.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

opt.inccommand = "split"
opt.cursorline = true

-- minimal number of screen lines to keep above and below the cursor
opt.scrolloff = 10
opt.confirm = true

-- Global indentation defaults
opt.expandtab = true -- Convert tabs to spaces
opt.shiftwidth = 4 -- Number of spaces for an indent step
opt.tabstop = 4 -- Number of spaces that a <Tab> counts for
opt.softtabstop = 4 -- Number of spaces that a <Tab> counts for while editing
