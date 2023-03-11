local nnoremap = require('tomleewu.keymap').nnoremap

function _G.set_terminal_keymaps()
    local opts = { buffer = 0 }
    vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
    vim.keymap.set('t', 'kj', [[<C-\><C-n>]], opts)
    vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
    vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
    vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
    vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
end

local function configure()
    vim.cmd('autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()')
    require 'toggleterm'.setup { shade_terminals = false }
end

return {
    'akinsho/toggleterm.nvim',
    config = configure,
    keys = {
        { "<leader>vt", "<cmd>1ToggleTerm direction=vertical size=120<cr>", desc = "toggle terminal" },
    },
}
