local function configure()
    local NOREF_NOERR_TRUNC = { silent = true, nowait = true }
    vim.keymap.set('n', '<CR>', require("neo-zoom").neo_zoom, NOREF_NOERR_TRUNC)

    -- My setup (This requires NeoNoName.lua, and optionally NeoWell.lua)
    vim.keymap.set('n', '<CR>', function()
        local win_on_zoom = vim.api.nvim_get_current_win()
        local buf_on_zoom = vim.api.nvim_get_current_buf()
        vim.cmd('NeoZoomToggle')

        -- if did zoom then clean-up the window on zoom temporarily to create popup effect.
        if require('neo-zoom').did_zoom() then
            vim.api.nvim_set_current_win(win_on_zoom)
            vim.cmd('NeoNoName')
            vim.cmd('wincmd p')
        else
            vim.api.nvim_set_current_buf(buf_on_zoom)
        end
    end, { silent = true, nowait = true })
end

return {
    -- focus splits
    'nyngwang/NeoZoom.lua',
    dependencies = {
        'nyngwang/NeoNoName.lua' -- you will need this if you want to use the keymap sample below.
    },
    config = configure,
    opts = {
        left_ratio = 0.2,
        top_ratio = 0.03,
        width_ratio = 0.67,
        height_ratio = 0.9,
        border = 'double',
        exclude_filetype = {
            'fzf', 'qf', 'dashboard'
        },
        exclude_buftypes = { 'terminal' },
        scrolloff_on_zoom = 13, -- offset to the top-border.
    },
    event = "VeryLazy"
}
