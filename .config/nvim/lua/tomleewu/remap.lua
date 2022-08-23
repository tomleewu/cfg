local nnoremap = require('tomleewu/keymap').nnoremap
local inoremap = require('tomleewu/keymap').inoremap
local vnoremap = require('tomleewu/keymap').vnoremap

-- exit insert mode
inoremap("kj", "<ESC>")

-- faster colon
nnoremap(";", ":")
vnoremap(";", ":")

-- netrw
nnoremap("<leader>e", "<cmd>E<CR>")

-- Reload vimrc
nnoremap("<leader><leader>r", "<cmd>source $MYVIMRC<CR>")

-- close quickfix window
nnoremap("<leader><leader>c", "<cmd>ccl<CR>")
