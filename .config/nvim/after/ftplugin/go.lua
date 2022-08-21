local remap = require("tomleewu.keymap")
local nnoremap = remap.nnoremap
local vnoremap = remap.vnoremap
local inoremap = remap.inoremap
local xnoremap = remap.xnoremap
local nmap = remap.nmap

-- General settings
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

-- General keymaps
nmap("<C-c>","<plug>(go-test-func)")
nmap("<C-v>","<plug>(go-vet)")
nmap("<leader>i","<cmd>GoFillStruct")
nmap("<leader>r","<cmd>GoRename")
nmap("<leader>t","<cmd>GoAddTags")

-- Debugging keymaps
nmap("<leader>dt","<cmd>GoDebugTestFunc<CR>")
nmap("<leader>s","<cmd>GoDebugStop<CR>")
nmap("<leader>b","<cmd>GoDebugBreakpoint<CR>")
nmap("<leader>r","<cmd>GoDebugRestart<CR>")

-- Debugging settings
vim.g["go_debug_mappings"] = {
		 	 [ "go-debug-continue" ] = {key = "c", arguments = "<nowait>"},
			 [ "(go-debug-next)" ] = {key= "n", arguments= "<nowait>"},
			 [ "(go-debug-stop)" ] = {key= "q"},
			 [ "(go-debug-step)" ] = {key= "s"},
			 [ "(go-debug-step-out)" ] = {key= "o"},
			 [ "(go-debug-print)" ] = {key= "p"},
}

vim.g["go_debug_windows"] = {
		 	 vars = "leftabove 50vnew",
		 	 stacks = "leftabove 10new",
}

-- General settings
vim.g.go_fmt_command = "goimports"
vim.g.go_doc_popup_window = 1
vim.g.go_auto_type_info = 0
vim.g.go_gopls_enabled = 1
vim.g.go_gopls_options = {'-remote=auto'}
vim.g.go_code_completion_enabled = 1
vim.g.go_auto_sameids = 0
vim.g.go_diagnostics_enabled = 0
vim.g.go_echo_go_info = 0
vim.g.go_metalinter_enabled = 0

-- Testing settings
vim.g.go_test_show_name = 1
vim.g.go_test_timeout='60s'

