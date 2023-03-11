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
end
return
-- split / join multiline
{
    'Wansmer/treesj',
    dependencies = { 'nvim-treesitter' },
    config = configure,
    keys = {
        { "gS", "<cmd>TSJSplit<cr>", desc = "Split" },
        { "gJ", "<cmd>TSJJoin<cr>",  desc = "Join" },
    },
}
