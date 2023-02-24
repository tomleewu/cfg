local nnoremap = require("tomleewu.keymap").nnoremap
local function configure()
    local tsj = require('treesj')
    tsj.setup({
        -- Use default keymaps
        -- (<space>m - toggle, <space>j - join, <space>s - split)
        use_default_keymaps = false,
        -- If line after join will be longer than max value,
        -- node will not be formatted
        max_join_length = 140,
    })
    nnoremap("gS", "<cmd>TSJSplit<cr>")
    nnoremap("gJ", "<cmd>TSJJoin<cr>")
end
return
-- split / join multiline
{
    'Wansmer/treesj',
    dependencies = { 'nvim-treesitter' },
    config = configure,
}
