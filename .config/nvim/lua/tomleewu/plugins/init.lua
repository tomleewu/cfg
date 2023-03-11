return {

    'nvim-tree/nvim-web-devicons',
    'vim-scripts/ReplaceWithRegister',
    { "windwp/nvim-autopairs", config = function() require("nvim-autopairs").setup {} end },
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
    {
        'ggandor/leap.nvim',
        dependencies = {
            { 'ggandor/flit.nvim', opts = { labeled_modes = "nv", multiline = false } }
        },
        config = function()
            require 'leap'.add_default_mappings()
        end,
        event = "VeryLazy"
    },
    -- colorscheme
    {
        'tomleewu/vim-paper',
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd([[colorscheme paper]])
        end
    },

    -- comments
    'tpope/vim-commentary',
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
    { 'chaoren/vim-wordmotion',
        event = "VeryLazy"
    },
    {
        'kylechui/nvim-surround',
        version = "*",
        config = true,
        event = "InsertEnter"
    },
    -- Lazygit in neovim
    { 'kdheepak/lazygit.nvim',
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
    { 'ray-x/lsp_signature.nvim',
        event = "InsertEnter"
    },
    -- golang
    { 'fatih/vim-go',
        ft = "go"
    },


    "lukas-reineke/lsp-format.nvim",
}
