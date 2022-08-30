local remap = require("tomleewu.keymap")
local actions = require("telescope.actions")
local nnoremap = remap.nnoremap
local telescopeConfig = require("telescope.config")

nnoremap("<leader>f", "<cmd> Telescope find_files<cr>")
nnoremap("<leader>cf", "<cmd> Telescope current_buffer_fuzzy_find<cr>")
nnoremap("<leader>/", "<cmd> Telescope live_grep<cr>")
nnoremap("<leader>h", "<cmd> Telescope oldfiles<cr>")
nnoremap("<leader>;", "<cmd> Telescope buffers<cr>")
nnoremap("<leader>d", "<cmd> Telescope diagnostics<cr>")

-- Clone the default Telescope configuration
local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }

-- I want to search in hidden/dot files.
table.insert(vimgrep_arguments, "--hidden")
-- I don't want to search in the `.git` directory.
table.insert(vimgrep_arguments, "--glob")
table.insert(vimgrep_arguments, "!.git/*")

require('telescope').setup {
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
			live_grep = {
				only_sort_text = true,
			},
			find_files = {
				find_command = { "rg", "--files", "--hidden", "--glob", "!.git/*" },
			},
			diagnostics = {
				root_dir = true,
				severity_limit = "WARN",
				no_unlisted = false,
			},
		},
}

require('telescope').load_extension('fzf')
