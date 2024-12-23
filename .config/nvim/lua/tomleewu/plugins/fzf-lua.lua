return {
    'ibhagwan/fzf-lua',
    -- optional for icon support
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        local fzflua = require("fzf-lua")
        fzflua.setup({
            'telescope',
            winopts  = {
                width = 0.9,
                preview = {
                    horizontal = 'right:50%'
                }
            },
            files    = {
                prompt     = "> ",
                cwd_prompt = false,
                fzf_opts   = {
                    ['--info'] = "hidden",
                },
                no_header  = true,
                fzf_colors = {
                    ["pointer"] = { "fg", "Normal" },
                }
            },
            grep     = {
                prompt = "> ",
                fzf_opts = {
                    ['--info'] = "hidden",
                },
                no_header = true,
                fzf_colors = {
                    ["pointer"] = { "fg", "Normal" },
                }
            },
            fzf_opts = {
                ['--layout'] = "reverse",
            },
            hls      = {
                header_bind = "FzfLuaNormal",
            },
        })
    end,
    keys = {
        { "<leader>/", "<cmd>FzfLua live_grep<CR>", desc = "search in files" },
        { "<leader>f", "<cmd>FzfLua files<CR>",     desc = "search files" },
        { "<leader>R", "<cmd>FzfLua resume<CR>",    desc = "resume" },
    }
}
