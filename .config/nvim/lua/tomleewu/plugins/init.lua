return {
  'vim-scripts/ReplaceWithRegister',

  {
    'windwp/nvim-autopairs',
    config = function() require("nvim-autopairs").setup {} end,
    event = "VeryLazy",
  },

  -- disables search highlighting after cursor movement
  'romainl/vim-cool',

  -- open files in github
  {
    'tpope/vim-rhubarb',
    dependencies = { { 'tpope/vim-fugitive' } },
    event = "VeryLazy",
  },

  -- automated indentation
  'tpope/vim-sleuth',

  -- colorscheme
  {
    'tomleewu/vim-paper',
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme paper]])
    end,
  },

  -- opens up last session based on cwd
  {
    'rmagatti/auto-session',
    opts = {
      log_level = "error",
      auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
    },
  },

  -- better quickfix
  { 'kevinhwang91/nvim-bqf', ft = 'qf' },

  -- snakeCase and under_score word objects
  {
    'chaoren/vim-wordmotion',
    event = "VeryLazy",
  },

  -- lsp
  'mason-org/mason.nvim',
  'mason-org/mason-lspconfig.nvim',
  'neovim/nvim-lspconfig',

  {
    'ray-x/lsp_signature.nvim',
    event = "InsertEnter",
  },

  -- automatically resize windows when using a small screen
  {
    'anuvyklack/windows.nvim',
    dependencies = "anuvyklack/middleclass",
    config = true,
    event = "VeryLazy",
  },

  {
    'jeffkreeftmeijer/vim-numbertoggle',
  },

  {
    'lewis6991/gitsigns.nvim',
    config = true,
    event = "InsertEnter",
  },

  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && npm install && git restore .",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },

  {
    'folke/zen-mode.nvim',
    keys = {
      {
        "<leader>z",
        "<cmd>ZenMode<cr>",
        desc = "Toggle Zen Mode",
      },
    },
    opts = {
      window = {
        width = 160,
      },
      plugins = {
        tmux = { enabled = true }, -- disables the tmux statusline
      },
    },
  },

  {
    "folke/ts-comments.nvim",
    opts = {},
    event = "VeryLazy",
    enabled = vim.fn.has("nvim-0.10.0") == 1,
  },

  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = { enabled = false },
        panel = { enabled = false },
        copilot_node_command = "/Users/tomwu/.asdf/installs/nodejs/22.9.0/bin/node",
        copilot_model = "gpt-4o-copilot",
      })
    end,
  },

  {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    version = "*",
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons", -- optional dependency
    },
    opts = {
      -- configurations go here
    },
  },

  {
    "otavioschwanck/arrow.nvim",
    dependencies = {
      { "nvim-tree/nvim-web-devicons" },
    },
    event = "VeryLazy",
    opts = {
      separate_by_branch = true,
      always_show_path = true,
      show_icons = true,
      leader_key = ',',        -- Recommended to be a single key
      buffer_leader_key = 'm', -- Per Buffer Mappings
    },
  },

  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown", "codecompanion" },
  },
}
