local remap = require("tomleewu.keymap")
local nmap = remap.nmap
-- General settings
vim.opt_local.tabstop = 4
vim.opt_local.shiftwidth = 4

-- General keymaps
nmap("<C-c>", "<cmd>GoTestFunc!<CR>")
nmap("<C-v>", "<cmd>GoVet<CR>")
nmap("<leader>i", "<cmd>GoFillStruct<CR>")
nmap("<leader>jt", "<cmd>GoAddTags<CR>")

-- Configuration
vim.g.go_def_mapping_enabled = 0
vim.g.go_term_enabled = 1
vim.g.go_term_reuse = 1
vim.g.go_term_close_on_exit = 0
vim.g.go_test_timeout = '60s'
vim.g.go_list_height = 15
vim.g.go_fmt_autosave = 0
vim.g.go_addtags_transform = 'camelcase'
