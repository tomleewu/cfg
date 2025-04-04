return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    bigfile = { enabled = true },
    dashboard = { enabled = false },
    image = {
      enabled = false,
      doc = {
        -- enable image viewer for documents
        -- a treesitter parser must be available for the enabled languages.
        enabled = false,
      },
    },
    explorer = { enabled = true },
    indent = { enabled = false },
    input = { enabled = true },
    picker = {
      enabled = true,
      formatters = {
        file = {
          filename_first = false,
          filename_only = false,
          truncate = 160,
        },
      },
      win = {
        input = {
          keys = {
            ["<Esc>"] = { "close", mode = { "n", "i" } },
            ["<C-h>"] = { "toggle_hidden", mode = { "i", "n" } },
            ["<C-u>"] = { "preview_scroll_up", mode = { "i", "n" } },
            ["<C-d>"] = { "preview_scroll_down", mode = { "i", "n" } },
          }
        }
      },
      sources = {
        explorer = {
          focus = "list",
          auto_close = true,
          win = {
            list = {
              keys = {
                ["<CR>"] = "confirm",
              }
            }
          }
        },
      }

    },
    notifier = {
      enabled = true,
      margin = { top = 1, right = 30, bottom = 0 },
      level = vim.log.levels.WARN,
    },
    quickfile = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = false },
    statuscolumn = { enabled = false },
    words = { enabled = false },
  },
  keys = {
    { "<leader>g", function() Snacks.lazygit() end,      desc = "Lazygit" },
    { "<leader>F", function() Snacks.picker.smart() end, desc = "Smart File Explorer" },
    { "<leader>e", function() Snacks.explorer() end,     desc = "File Explorer" },
    { "<leader>f", function() Snacks.picker.files() end, desc = "Find Files" },
    { "<leader>/", function() Snacks.picker.grep() end,  desc = "Grep" },
    -- { "<leader>sH", function() Snacks.picker.highlights() end, desc = "Highlights" },
  }
}
