return {
    'vim-scripts/ReplaceWithRegister',
    'kyazdani42/nvim-web-devicons',
    'rhysd/clever-f.vim',
    'tpope/vim-commentary',
    { "windwp/nvim-autopairs", config = function() require("nvim-autopairs").setup {} end },
    -- disables search highlighting after cursor movement
    'romainl/vim-cool',
    -- open files in github
    { 'tpope/vim-rhubarb', dependencies = { { 'tpope/vim-fugitive' } } },
    'alexghergh/nvim-tmux-navigation',
    -- automated indention, replace me
    'tpope/vim-sleuth',
    { 'ggandor/leap.nvim', config = function() require 'leap'.set_default_keymaps() end },
    -- colorscheme
    {
        'tomleewu/vim-paper',
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd([[colorscheme paper]])
        end
    },
    -- split / join multiline
    'AndrewRadev/splitjoin.vim',

    -- auto cd to project root
    { "ahmedkhalf/project.nvim" },

    -- focus splits
    {
        'nyngwang/NeoZoom.lua',
        dependencies = {
            'nyngwang/NeoNoName.lua' -- you will need this if you want to use the keymap sample below.
        },
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
    { 'chaoren/vim-wordmotion' },

    { 'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        dependencies = {
            'nvim-treesitter/nvim-treesitter-refactor',
            'nvim-treesitter/nvim-treesitter-context',
            'nvim-treesitter/nvim-treesitter-textobjects',
        }
    },

    {
        'kylechui/nvim-surround',
        version = "*",
        config = true
    },

    -- file actions using vim
    {
        'elihunter173/dirbuf.nvim',
        event = "VeryLazy"
    },

    -- Lazygit in neovim
    'kdheepak/lazygit.nvim',

    -- optimizes neovim startup time
    'lewis6991/impatient.nvim',

    -- codeactions
    {
        'kosayoda/nvim-lightbulb',
        dependencies = 'antoinemadec/FixCursorHold.nvim',
        config = function() require('nvim-lightbulb').setup({ autocmd = { enabled = true } }) end,
    },

    'nvim-telescope/telescope-ui-select.nvim',

    -- lsp
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig',
    'ray-x/lsp_signature.nvim',


    -- golang
    { 'fatih/vim-go',
        ft = "go"
    },

    -- dap
    {
        "mfussenegger/nvim-dap",
        event = "VeryLazy",
        module = { "dap" },
        dependencies = {
            "theHamsta/nvim-dap-virtual-text",
            "rcarriga/nvim-dap-ui",
            "nvim-telescope/telescope-dap.nvim",
            "leoluz/nvim-dap-go",
            'theHamsta/nvim-dap-virtual-text',
        },
        config = function()
            require("tomleewu.dap").setup()
        end,
    },
}
