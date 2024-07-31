return {
    'nvim-tree/nvim-web-devicons',
    'vim-scripts/ReplaceWithRegister',
    {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end,
        event = "VeryLazy"
    },
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
    {
        'chaoren/vim-wordmotion',
        event = "VeryLazy"
    },
    -- Lazygit in neovim
    {
        'kdheepak/lazygit.nvim',
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
    {
        'ray-x/lsp_signature.nvim',
        event = "InsertEnter"
    },

    -- golang
    {
        'fatih/vim-go',
        ft = "go",
        keys = {
            { "<C-c>", "<cmd>GoTestFunc!<CR>" },
            { "<C-v>", "<cmd>GoVet<CR>" },
        },
    },

    {
        "lukas-reineke/lsp-format.nvim",
        event = "BufWritePre"
    },

    {
        'simrat39/rust-tools.nvim',
    },

    -- automatically resize windows when using a small screen
    {
        "anuvyklack/windows.nvim",
        dependencies = "anuvyklack/middleclass",
        config = function()
            require('windows').setup()
        end,
        event = "VeryLazy"
    },
    {
        'jeffkreeftmeijer/vim-numbertoggle'
    },
    {
        'lewis6991/gitsigns.nvim',
        config = true,
        event = "InsertEnter"
    },
    {
        'dgagn/diagflow.nvim',
        event = 'LspAttach',
        opts = {
            scope = 'line',
            inline_padding_left = 3,
        }
    },

    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        config = function()
            require("copilot").setup({
                suggestion = { enabled = false },
                panel = { enabled = false },
            })
        end,
    },

    {
        "zbirenbaum/copilot-cmp",
        config = function()
            require("copilot_cmp").setup()
        end
    },

    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = function() vim.fn["mkdp#util#install"]() end,
    },
    {
        "rachartier/tiny-inline-diagnostic.nvim",
        event = "VeryLazy",
        config = function()
            -- Default configuration
            require("tiny-inline-diagnostic").setup({
                signs = {
                    left = "",
                    right = "",
                    diag = "●",
                    arrow = "    ",
                    up_arrow = "    ",
                    vertical = " │",
                    vertical_end = " └",
                },
                hi = {
                    error = "DiagnosticError",
                    warn = "DiagnosticWarn",
                    info = "DiagnosticInfo",
                    hint = "DiagnosticHint",
                    arrow = "NonText",
                    background = "CursorLine", -- Can be a highlight or a hexadecimal color (#RRGGBB)
                    mixing_color = "#EBE5CC",  -- Can be None or a hexadecimal color (#RRGGBB). Used to blend the background color with the diagnostic background color with another color.
                },
                blend = {
                    factor = 0.27,
                },
                options = {
                    -- Show the source of the diagnostic.
                    show_source = false,

                    -- Throttle the update of the diagnostic when moving cursor, in milliseconds.
                    -- You can increase it if you have performance issues.
                    -- Or set it to 0 to have better visuals.
                    throttle = 20,

                    -- The minimum length of the message, otherwise it will be on a new line.
                    softwrap = 15,

                    -- If multiple diagnostics are under the cursor, display all of them.
                    multiple_diag_under_cursor = false,

                    -- Enable diagnostic message on all lines.
                    -- /!\ Still an experimental feature, can be slow on big files.
                    multilines = false,

                    overflow = {
                        -- Manage the overflow of the message.
                        --    - wrap: when the message is too long, it is then displayed on multiple lines.
                        --    - none: the message will not be truncated, and will be displayed on a single line.
                        mode = "wrap",
                    },

                    --- Enable it if you want to always have message with `after` characters length.
                    break_line = {
                        enabled = false,
                        after = 30,
                    },

                    virt_texts = {
                        priority = 2048,
                    },
                },
            })
        end
    }
}
