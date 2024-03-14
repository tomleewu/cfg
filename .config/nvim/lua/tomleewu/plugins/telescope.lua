local function configure()
    local telescope = require('telescope')
    local actions = require("telescope.actions")

    telescope.setup {
        defaults = {
            mappings = {
                i = {
                    ["<esc>"] = actions.close,
                    ["<C-j>"] = actions.move_selection_next,
                    ["<C-k>"] = actions.move_selection_previous,
                },
            },
            sorting_strategy = "ascending",
            layout_strategy = "horizontal",
            layout_config = {
                horizontal = {
                    width = 0.8,
                    height = 0.9,
                    prompt_position = "top"
                },
            },
            preview = {
                treesitter = false
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

    telescope.load_extension("ui-select")
end

-- requires ripgrep
return {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = { { 'nvim-lua/plenary.nvim' } },
    event = 'LspAttach',
    config = configure
}
