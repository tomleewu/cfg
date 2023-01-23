local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({

  'vim-scripts/ReplaceWithRegister',
  'kyazdani42/nvim-web-devicons',
  'nvim-lualine/lualine.nvim',
  'rhysd/clever-f.vim',
  'tpope/vim-commentary',
  { "windwp/nvim-autopairs", config = function() require("nvim-autopairs").setup {} end },
  -- disables search highlighting after cursor movement
  'romainl/vim-cool',
  -- open files in github
  { 'tpope/vim-rhubarb', dependencies = { { 'tpope/vim-fugitive' } } },
  'alexghergh/nvim-tmux-navigation',
  -- automated indention, replace me
  'tpope/vim-sleuth',
  { 'ggandor/leap.nvim', config = function() require 'leap'.set_default_keymaps() end },
  -- colorscheme
  {
    'tomleewu/vim-paper',
    lazy = false,
    priority = 1000,
  },
  -- split / join multiline
  'AndrewRadev/splitjoin.vim',

  -- auto cd to project root
  { "ahmedkhalf/project.nvim" },

  -- focus splits
  {
    'nyngwang/NeoZoom.lua',
    dependencies = {
      'nyngwang/NeoNoName.lua' -- you will need this if you want to use the keymap sample below.
    },
  },

  -- better quickfix
  { 'kevinhwang91/nvim-bqf', ft = 'qf' },

  -- snakeCase and under_score word objects
  { 'chaoren/vim-wordmotion' },

  { 'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-refactor',
      'nvim-treesitter/nvim-treesitter-context',
      'nvim-treesitter/nvim-treesitter-textobjects',
    }
  },

  {
    'kylechui/nvim-surround',
    version = "*",
    config = true
  },

  -- file actions using vim
  { 'elihunter173/dirbuf.nvim',
    event = "VeryLazy"
  },

  -- Lazygit in neovim
  'kdheepak/lazygit.nvim',

  -- optimizes neovim startup time
  'lewis6991/impatient.nvim',

  -- dependencies ripgrep
  {
    'nvim-telescope/telescope.nvim', branch = '0.1.x',
    dependencies = { { 'nvim-lua/plenary.nvim' }, { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' } }
  },

  -- codeactions
  {
    'kosayoda/nvim-lightbulb',
    dependencies = 'antoinemadec/FixCursorHold.nvim',
    config = function() require('nvim-lightbulb').setup({ autocmd = { enabled = true } }) end,
  },

  'nvim-telescope/telescope-ui-select.nvim',

  -- completion
  { 'hrsh7th/nvim-cmp',
    -- load cmp on InsertEnter
    event = "InsertEnter",
    dependencies = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-nvim-lsp',
      'saadparwaiz1/cmp_luasnip',

      -- snippets
      'L3MON4D3/LuaSnip',
      'rafamadriz/friendly-snippets', -- a bunch of snippets to use
    }
  },


  -- lsp
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',
  'neovim/nvim-lspconfig',
  'ray-x/lsp_signature.nvim',


  -- golang
  { 'fatih/vim-go',
    ft = "go"
  },

  -- dap
  {
    "mfussenegger/nvim-dap",
    event = "VeryLazy",
    module = { "dap" },
    dependencies = {
      "theHamsta/nvim-dap-virtual-text",
      "rcarriga/nvim-dap-ui",
      "nvim-telescope/telescope-dap.nvim",
      "leoluz/nvim-dap-go",
      'theHamsta/nvim-dap-virtual-text',
    },
    config = function()
      require("tomleewu.dap").setup()
    end,
  },
})
