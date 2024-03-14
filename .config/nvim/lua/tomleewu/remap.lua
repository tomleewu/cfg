local nnoremap = require('tomleewu/keymap').nnoremap
local inoremap = require('tomleewu/keymap').inoremap
local vnoremap = require('tomleewu/keymap').vnoremap

-- exit insert mode
inoremap("kj", "<ESC>")

-- faster colon
nnoremap(";", ":")
vnoremap(";", ":")

-- netrw
nnoremap("<C-g>", "<C-6>")

-- Reload vimrc
nnoremap("<leader><leader>r", "<cmd>source $MYVIMRC<CR>")

-- close quickfix window
nnoremap("<leader><leader>c", "<cmd>ccl<CR>")

-- Open init.vim
nnoremap("cv", "<cmd>edit $MYVIMRC<CR>")

-- Format json; requires jq
nnoremap("<leader>js", "<cmd>%!jq<cr>")

-- New UUID
inoremap("<C-u>", "<C-R>=tolower(system('uuidgen')[0:-2])<CR>")

nnoremap("<BS>", "ciw")

-- Open in finder
vim.api.nvim_create_user_command('Rfinder',
    function()
        local path = vim.api.nvim_buf_get_name(0)
        os.execute('open -R ' .. path)
    end,
    {}
)

nnoremap("<leader>o", "<cmd>Rfinder<cr>")

-- Remap macro recording to Q to avoid disabling nvim-cmp
nnoremap("Q", "q")
nnoremap("q", "<Nop>")
