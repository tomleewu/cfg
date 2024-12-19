return {
    'alexghergh/nvim-tmux-navigation',
    config = function()
        require('nvim-tmux-navigation').setup({
            disable_when_zoomed = true -- defaults to false
        })
    end,
    keys = {
        { "<C-h>", "<cmd>NvimTmuxNavigateLeft<cr>",  desc = "Navigate to the left tmux pane" },
        { "<C-j>", "<cmd>NvimTmuxNavigateDown<cr>",  desc = "Navigate to the lower tmux pane" },
        { "<C-k>", "<cmd>NvimTmuxNavigateUp<cr>",    desc = "Navigate to the upper tmux pane" },
        { "<C-l>", "<cmd>NvimTmuxNavigateRight<cr>", desc = "Navigate to the right" },
    }
}
