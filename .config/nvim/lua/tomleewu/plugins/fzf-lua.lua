return {
    'ibhagwan/fzf-lua',
    -- optional for icon support
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        require('fzf-lua').setup({
            'telescope',
            winopts = {
                width = 0.9,
                preview = {
                    horizontal = 'right:40%'
                }
            },
            fzf_opts = {
                ['--layout'] = "reverse",
            },
        })
    end,
    keys = {
        { "<leader>/", "<cmd>FzfLua live_grep<cr>",         desc = "search in files" },
        { "<leader>f", "<cmd>FzfLua files resume=true<cr>", desc = "search files" },
    }
}
