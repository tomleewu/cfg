local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
    install_path })
  vim.cmd [[packadd packer.nvim]]
end

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use 'vim-scripts/ReplaceWithRegister'
  use 'kyazdani42/nvim-web-devicons'
  use 'nvim-lualine/lualine.nvim'
  use 'rhysd/clever-f.vim'
  use 'tpope/vim-commentary'
  use { "windwp/nvim-autopairs", config = function() require("nvim-autopairs").setup {} end }
  -- disables search highlighting after cursor movement
  use 'romainl/vim-cool'
  -- open files in github
  use { 'tpope/vim-rhubarb', requires = { { 'tpope/vim-fugitive' } } }
  use 'alexghergh/nvim-tmux-navigation'
  -- automated indention, replace me
  use 'tpope/vim-sleuth'
  use { 'ggandor/leap.nvim', config = function() require 'leap'.set_default_keymaps() end }
  -- colorscheme
  use 'tomleewu/vim-paper'
  -- split / join multiline
  use 'AndrewRadev/splitjoin.vim'

  -- auto cd to project root
  use { "ahmedkhalf/project.nvim" }

  -- focus splits
  use {
    'nyngwang/NeoZoom.lua',
    requires = {
      'nyngwang/NeoNoName.lua' -- you will need this if you want to use the keymap sample below.
    },
  }

  -- better quickfix
  use { 'kevinhwang91/nvim-bqf', ft = 'qf' }

  -- snakeCase and under_score word objects
  use { 'chaoren/vim-wordmotion' }

  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'nvim-treesitter/nvim-treesitter-refactor'
  use 'nvim-treesitter/nvim-treesitter-context'
  use 'nvim-treesitter/nvim-treesitter-textobjects'

  use {
    'kylechui/nvim-surround',
    tag = "*",
    config = function() require 'nvim-surround'.setup() end
  }

  -- file actions using vim
  use "elihunter173/dirbuf.nvim"

  -- Lazygit in neovim
  use 'kdheepak/lazygit.nvim'

  -- optimizes neovim startup time
  use 'lewis6991/impatient.nvim'

  -- requires ripgrep
  use {
    'nvim-telescope/telescope.nvim', branch = '0.1.x',
    requires = { { 'nvim-lua/plenary.nvim' }, { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' } }
  }

  -- codeactions
  use {
    'kosayoda/nvim-lightbulb',
    requires = 'antoinemadec/FixCursorHold.nvim',
    config = function() require('nvim-lightbulb').setup({ autocmd = { enabled = true } }) end,
  }
  use { 'nvim-telescope/telescope-ui-select.nvim' }

  -- completion
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'saadparwaiz1/cmp_luasnip'

  -- snippets
  use 'L3MON4D3/LuaSnip'
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -- lsp
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'neovim/nvim-lspconfig'
  use "ray-x/lsp_signature.nvim"


  -- golang
  use 'fatih/vim-go'

  -- dap
  use {
    "mfussenegger/nvim-dap",
    module = { "dap" },
    requires = {
      "theHamsta/nvim-dap-virtual-text",
      "rcarriga/nvim-dap-ui",
      "nvim-telescope/telescope-dap.nvim",
      "leoluz/nvim-dap-go",
      'theHamsta/nvim-dap-virtual-text',
    },
    config = function()
      require("tomleewu.dap").setup()
    end,
  }


  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
