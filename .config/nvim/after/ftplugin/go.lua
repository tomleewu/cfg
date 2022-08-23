local remap = require("tomleewu.keymap")
local nmap = remap.nmap
-- General settings
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

-- General keymaps
nmap("<C-c>", "<cmd>GoTest -n<CR>")
nmap("<C-v>", "<cmd>GoVet<CR>")
nmap("<leader>i", "<cmd>GoFillStruct<CR>")
nmap("<leader>r", "<cmd>GoRename<CR>")
nmap("<leader>t", "<cmd>GoAddTag<CR>")

-- Debugging keymaps
nmap("<leader>dt", "<cmd>lua require('dap-go').debug_test()<CR>")

-- TODO: Move these into dap config
nmap("<leader>b", "<cmd>lua require'dap'.toggle_breakpoint()<CR>")
nmap("<leader>n", "<cmd>lua require'dap'.step_over()<CR>")
nmap("<leader>c", "<cmd>lua require'dap'.continue()<CR>")
nmap("<leader>s", "<cmd>lua require'dap'.step_into()<CR>")
nmap("<leader>S", "<cmd>lua require'dap'.terminate()<CR>")
