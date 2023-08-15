local function configure()
    require('nvim-surround').setup({
        keymaps = {
            insert = "<C-g>s",
            insert_line = "<C-g>S",
            normal = "ys",
            normal_cur = "yss",
            normal_line = "yS",
            normal_cur_line = "ySS",
            visual = "<C-s>",
            visual_line = "gS",
            delete = "ds",
            change = "cs",
            change_line = "cS",
        }
    })

end

return {
    'kylechui/nvim-surround',
    version = "*",
    config = configure,
    event = "InsertEnter"
}
