local function configure()
    local telescope = require('telescope')
    local actions = require("telescope.actions")
    local telescopeConfig = require("telescope.config")

    -- Clone the default Telescope configuration
    local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }

    -- I want to search in hidden/dot files.
    table.insert(vimgrep_arguments, "--hidden")
    -- I don't want to search in the `.git` directory.
    table.insert(vimgrep_arguments, "--glob")
    table.insert(vimgrep_arguments, "!.git/*")


    telescope.setup {
        defaults = {
            mappings = {
                i = {
                    ["<esc>"] = actions.close,
                    ["<C-j>"] = actions.move_selection_next,
                    ["<C-k>"] = actions.move_selection_previous,
                },
            },
            vimgrep_arguments = vimgrep_arguments,
            sorting_strategy = "ascending",
            layout_strategy = "horizontal",
            layout_config = {
                horizontal = {
                    width = 0.8,
                    height = 0.9,
                    prompt_position = "top"
                },
            },
        },
        pickers = {
            find_files = {
                find_command = { "rg", "--files", "--hidden", "--glob", "!.git/*" },
            },
            diagnostics = {
                root_dir = true,
                severity_limit = "WARN",
                no_unlisted = false,
            },
        },
        extensions = {
            ["ui-select"] = {
                require("telescope.themes").get_dropdown {
                    -- even more opts
                }

                -- pseudo code / specification for writing custom displays, like the one
                -- for "codeactions"
                -- specific_opts = {
                --   [kind] = {
                --     make_indexed = function(items) -> indexed_items, width,
                --     make_displayer = function(widths) -> displayer
                --     make_display = function(displayer) -> function(e)
                --     make_ordinal = function(e) -> string
                --   },
                --   -- for example to disable the custom builtin "codeactions" display
                --      do the following
                --   codeactions = false,
                -- }
            }
        }
    }

    telescope.load_extension('fzf')
    telescope.load_extension('projects')
    telescope.load_extension("ui-select")
end

-- requires ripgrep
return {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = { { 'nvim-lua/plenary.nvim' }, { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' } },
    keys = {
        { "<leader>f", "<cmd> Telescope find_files<cr>",                              desc = "find files" },
        { "<leader>/", "<cmd> Telescope grep_string only_sort_text=true search=<cr>", desc = "search in files" },
        { "<leader>h", "<cmd> Telescope oldfiles<cr>",                                desc = "search recent files" },
        { "<leader>;", "<cmd> Telescope buffers<cr>",                                 desc = "buffers" },
        { "<leader>d", "<cmd> Telescope diagnostics<cr>",                             desc = "lsp diagnostics" },
        { "<leader>p", "<cmd> Telescope projects<cr>",                                desc = "projects" },
    },
    config = configure
}
