local nnoremap = require('tomleewu.keymap').nnoremap

-- file actions using vim
return {
    'elihunter173/dirbuf.nvim',
    keys = {
        { "<leader>e", "<cmd>Dirbuf<cr>", desc = "Dirbuf" },
    },
}
