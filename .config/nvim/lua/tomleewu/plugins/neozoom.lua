local function configure()
    local neozoom = require('neo-zoom')
    neozoom.setup {
        -- left_ratio = 0.2,
        -- top_ratio = 0.03,
        -- width_ratio = 0.67,
        -- height_ratio = 0.9,
        -- border = 'double',
        -- exclude_filetype = {
        --     'fzf', 'qf', 'dashboard'
        -- },
        scrolloff_on_zoom = 5, -- offset to the top-border.
        exclude_buftypes = { 'terminal' },
    }

    vim.keymap.set('n', '<CR>', function() vim.cmd('NeoZoomToggle') end, { silent = true, nowait = true })
end

return {
    -- focus splits
    'nyngwang/NeoZoom.lua',
    dependencies = {
        'nyngwang/NeoNoName.lua' -- you will need this if you want to use the keymap sample below.
    },
    config = configure,
    event = "VeryLazy"
}
