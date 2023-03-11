local nnoremap = require('tomleewu/keymap').nnoremap

return {
    'folke/trouble.nvim',
    keys = {
        { "<leader>t", "<cmd>TroubleToggle<cr>", desc = "Toggle Trouble" },
    },
}
