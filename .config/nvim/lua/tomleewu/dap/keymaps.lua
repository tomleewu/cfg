local remap = require("tomleewu.keymap")
local nnoremap = remap.nnoremap
local M = {}

M.setup = function()
    nnoremap("<leader>ds", "<cmd>lua require'dap'.terminate()<CR>")
    nnoremap("<leader>b", "<cmd>lua require'dap'.toggle_breakpoint()<CR>")
    nnoremap("<leader>n", "<cmd>lua require'dap'.step_over()<CR>")
    nnoremap("<leader>c", "<cmd>lua require'dap'.continue()<CR>")
    nnoremap("<leader>s", "<cmd>lua require'dap'.step_into()<CR>")
    nnoremap("<leader>S", "<cmd>lua require'dap'.step_out()<CR>")
end

return M
