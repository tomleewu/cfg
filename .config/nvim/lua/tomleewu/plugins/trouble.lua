local nnoremap = require('tomleewu/keymap').nnoremap

return {
    'folke/trouble.nvim',
    event = "VeryLazy",
    config = function()
        nnoremap("<leader>t", "<cmd>TroubleToggle<cr>")
    end
}
