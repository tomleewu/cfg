local remap = require("tomleewu.keymap")
local nmap = remap.nmap

-- Debugging keymaps
nmap("<leader>dt", "<cmd>lua require('dap-go').debug_test()<CR>")
nmap("<leader>b", "<cmd>lua require'dap'.toggle_breakpoint()<CR>")
nmap("<leader>n", "<cmd>lua require'dap'.step_over()<CR>")
nmap("<leader>c", "<cmd>lua require'dap'.continue()<CR>")
nmap("<leader>s", "<cmd>lua require'dap'.step_into()<CR>")
nmap("<leader>S", "<cmd>lua require'dap'.terminate()<CR>")
