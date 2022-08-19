set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc


lua << EOF
HOME = os.getenv("HOME")

-- line numbers
vim.opt.number = true
-- incomplete commands
vim.opt.showcmd = true
vim.opt.cursorline = true
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.smartcase = true
vim.opt.backspace = "indent,eol,start"
vim.opt.scrolloff = 5
vim.opt.clipboard = "unnamedplus"
vim.opt.undodir = HOME .. "/.vim/undodir"
vim.opt.directory = HOME .. "/.vim/swapfiles"
vim.opt.hidden = true

-- for coc.nvim
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.cmdheight = 2
vim.opt.updatetime = 300
vim.opt.signcolumn = "yes"

-- maintain history between sessions
vim.opt.undofile = true
-- automatically read changed files
vim.opt.autoread = true

require('leap').set_default_keymaps()

vim.cmd('colorscheme paper')
EOF
