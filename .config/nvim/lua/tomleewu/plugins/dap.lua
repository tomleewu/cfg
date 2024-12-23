local remap = require("tomleewu.keymap")
local nmap = remap.nmap

return {
  "mfussenegger/nvim-dap",
  keys = {
    "<leader>dt",
    "<leader>b",
    "<leader>n",
    "<leader>c",
    "<leader>s",
    "<leader>S"
  },
  module = { "dap" },
  dependencies = {
    "theHamsta/nvim-dap-virtual-text",
    "rcarriga/nvim-dap-ui",
    "leoluz/nvim-dap-go",
    'theHamsta/nvim-dap-virtual-text',
    "nvim-neotest/nvim-nio",
  },
  config = function()
    -- Debugging keymaps
    nmap("<leader>dt", "<cmd>lua require('dap-go').debug_test()<CR>")
    nmap("<leader>b", "<cmd>lua require'dap'.toggle_breakpoint()<CR>")
    nmap("<leader>n", "<cmd>lua require'dap'.step_over()<CR>")
    nmap("<leader>c", "<cmd>lua require'dap'.continue()<CR>")
    nmap("<leader>s", "<cmd>lua require'dap'.step_into()<CR>")
    nmap("<leader>S", "<cmd>lua require'dap'.terminate()<CR>")

    require("tomleewu.dap").setup()
  end,
}
