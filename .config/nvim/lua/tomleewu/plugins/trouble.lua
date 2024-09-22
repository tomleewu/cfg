return {
    "folke/trouble.nvim",
    opts = {
        focus = true, -- Focus the window when opened
    },                -- for default options, refer to the configuration section for custom setup.
    cmd = "Trouble",
    keys = {
        {
            "<leader>t",
            "<cmd>Trouble diagnostics toggle filter.severity = vim.diagnostic.severity.ERROR<cr>",
            desc = "Diagnostics (Trouble)",
        },
    },
}
