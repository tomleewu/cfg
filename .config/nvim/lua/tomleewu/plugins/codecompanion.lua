return {
  "olimorris/codecompanion.nvim",
  opts = {
    strategies = {
    },
    display = {
      chat = {
        show_settings = true,
      }
    },
    extensions = {
      vectorcode = {
        opts = {
          add_tool = true,
          add_slash_command = true,
        }
      }
    },
  },
  keys = {
    { "<leader>c",         "<cmd>CodeCompanionChat Toggle<cr>", desc = "open Companion Chat" },
    { "<leader><leader>c", "<cmd>CodeCompanionActions<cr>",     desc = "open menu of options for companion" },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    {
      "Davidyz/VectorCode",
      version = "*",                     -- optional, depending on whether you're on nightly or release
      build = "pipx upgrade vectorcode", -- optional but recommended. This keeps your CLI up-to-date.
      dependencies = { "nvim-lua/plenary.nvim" },
    }
  },
}
