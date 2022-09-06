local remap = require("tomleewu.keymap")
local nmap = remap.nmap
-- General settings
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

-- General keymaps
nmap("<C-c>", "<cmd>GoTestFunc<CR>")
nmap("<C-v>", "<cmd>GoVet<CR>")
nmap("<leader>i", "<cmd>GoFillStruct<CR>")
nmap("<leader>t", "<cmd>GoAddTags<CR>")

-- Configuration
vim.g.go_def_mapping_enabled = 0
vim.g.go_gopls_gofumpt=1
