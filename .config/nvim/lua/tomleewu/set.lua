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
vim.opt.shortmess:append('c')

-- maintain history between sessions
vim.opt.undofile = true
-- automatically read changed files
vim.opt.autoread = true

-- Remap leader key to space
vim.g.mapleader = " "

-- Indents
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
