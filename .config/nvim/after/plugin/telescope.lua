local remap = require("tomleewu.keymap")
local actions = require("telescope.actions")
local nnoremap = remap.nnoremap

nnoremap("<leader>f","<cmd> Telescope find_files<cr>")
nnoremap("<leader>cf","<cmd> Telescope current_buffer_fuzzy_find<cr>")
nnoremap("<leader>/","<cmd> Telescope live_grep<cr>")
nnoremap("<leader>h","<cmd> Telescope oldfiles<cr>")
nnoremap("<leader>;","<cmd> Telescope buffers<cr>")

require('telescope').setup{
	defaults = {
		mappings = {
			i = {
				["<esc>"] = actions.close
			},
		},
		pickers = {
			live_grep = {
				only_sort_text = true,
			}
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
	}
}

require('telescope').load_extension('fzf')
