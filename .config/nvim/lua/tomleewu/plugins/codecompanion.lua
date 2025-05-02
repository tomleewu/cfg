return {
  "olimorris/codecompanion.nvim",
  opts = {
    strategies = {
    },
    display = {
      chat = {
        show_settings = true,
      }
    }
  },
  keys = {
    { "<leader>c",         "<cmd>CodeCompanionChat Toggle<cr>", desc = "open Companion Chat" },
    { "<leader><leader>c", "<cmd>CodeCompanionActions<cr>",     desc = "open menu of options for companion" },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
}
