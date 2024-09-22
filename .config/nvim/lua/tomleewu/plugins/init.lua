return {
  'nvim-tree/nvim-web-devicons',
  'vim-scripts/ReplaceWithRegister',
  {
    'windwp/nvim-autopairs',
    config = function() require("nvim-autopairs").setup {} end,
    event = "VeryLazy"
  },
  -- disables search highlighting after cursor movement
  'romainl/vim-cool',
  -- open files in github
  {
    'tpope/vim-rhubarb',
    dependencies = { { 'tpope/vim-fugitive' } },
    event = "VeryLazy"
  },
  'alexghergh/nvim-tmux-navigation',
  -- automated indention
  'tpope/vim-sleuth',

  -- colorscheme
  {
    'tomleewu/vim-paper',
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme paper]])
    end
  },

  -- opens up last session based on cwd
  {
    'rmagatti/auto-session',
    config = function()
      require("auto-session").setup {
        log_level = "error",
        auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
      }
    end
  },
  -- better quickfix
  { 'kevinhwang91/nvim-bqf', ft = 'qf' },

  -- snakeCase and under_score word objects
  {
    'chaoren/vim-wordmotion',
    event = "VeryLazy"
  },
  -- Lazygit in neovim
  {
    'kdheepak/lazygit.nvim',
    keys = {
      { "<leader>g", "<cmd>LazyGit<cr>", "open lazygit" }
    }
  },

  -- codeactions
  {
    'kosayoda/nvim-lightbulb',
    config = function() require('nvim-lightbulb').setup({ autocmd = { enabled = true } }) end,
    event = "VeryLazy"
  },
  {
    'nvim-telescope/telescope-ui-select.nvim',
    keys = "<leader>a",
  },
  -- lsp
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',
  'neovim/nvim-lspconfig',
  {
    'ray-x/lsp_signature.nvim',
    event = "InsertEnter"
  },
  -- golang
  {
    'fatih/vim-go',
    ft = "go",
    keys = {
      { "<C-c>", "<cmd>GoTestFunc!<CR>" },
      { "<C-v>", "<cmd>GoVet<CR>" },
    },
  },
  {
    'lukas-reineke/lsp-format.nvim',
    event = "BufWritePre"
  },
  -- automatically resize windows when using a small screen
  {
    'anuvyklack/windows.nvim',
    dependencies = "anuvyklack/middleclass",
    config = function()
      require('windows').setup()
    end,
    event = "VeryLazy"
  },
  {
    'jeffkreeftmeijer/vim-numbertoggle'
  },
  {
    'lewis6991/gitsigns.nvim',
    config = true,
    event = "InsertEnter"
  },
  {
    'dgagn/diagflow.nvim',
    event = 'LspAttach',
    opts = {
      scope = 'line',
      inline_padding_left = 3,
    }
  },
  {
    'zbirenbaum/copilot.lua',
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = { enabled = false },
        panel = { enabled = false },
      })
    end,
  },
  {
    'zbirenbaum/copilot-cmp',
    config = function()
      require("copilot_cmp").setup()
    end
  },
  {
    'iamcco/markdown-preview.nvim',
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
  },
  {
    'mikavilpas/yazi.nvim',
    event = "VeryLazy",
    keys = {
      -- 👇 in this section, choose your own keymappings!
      {
        "<leader>e",
        "<cmd>Yazi<cr>",
        desc = "Open yazi at the current file",
      },
      {
        -- Open in the current working directory
        "<leader>cw",
        "<cmd>Yazi cwd<cr>",
        desc = "Open the file manager in nvim's working directory",
      },
      {
        -- NOTE: this requires a version of yazi that includes
        -- https://github.com/sxyazi/yazi/pull/1305 from 2024-07-18
        '<c-up>',
        "<cmd>Yazi toggle<cr>",
        desc = "Resume the last yazi session",
      },
    },
    ---@type YaziConfig
    opts = {
      -- if you want to open yazi instead of netrw, see below for more info
      open_for_directories = false,
      keymaps = {
        show_help = '<f1>',
      },
    },
  },
  {
    'folke/zen-mode.nvim',
    keys = {
      {
        "<CR>",
        "<cmd>ZenMode<cr>",
        desc = "Toggle Zen Mode",
      },
    },
    opts = {
      plugins = {
        tmux = { enabled = true }, -- disables the tmux statusline
      }
    }
  }
}
