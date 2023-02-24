local function configure()
    local neozoom = require('neo-zoom')
    neozoom.setup {
        winopts = {
            offset = {
                -- NOTE: you can omit `top` and/or `left` to center the floating window.
                -- top = 0,
                left = 0.30,
                width = 175,
                height = .85,
            },
        },
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
