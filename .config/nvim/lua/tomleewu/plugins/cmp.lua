local function configure()
    local cmp_status_ok, cmp = pcall(require, "cmp")
    if not cmp_status_ok then
        return
    end

    local snip_status_ok, luasnip = pcall(require, "luasnip")
    if not snip_status_ok then
        return
    end

    cmp.setup({
        snippet = {
            expand = function(args)
                luasnip.lsp_expand(args.body) -- For `luasnip` users.
            end,
        },
        window = {
            -- completion = cmp.config.window.bordered(),
            documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
            ["<C-k>"] = cmp.mapping.select_prev_item(),
            ["<C-j>"] = cmp.mapping.select_next_item(),
            ['<C-b>'] = cmp.mapping.scroll_docs( -4),
            ['<C-f>'] = cmp.mapping.scroll_docs(4),
            ['<C-Space>'] = cmp.mapping.complete(),
            ['<C-e>'] = cmp.mapping.abort(),
            ['<CR>'] = cmp.mapping.confirm({
                select = true,
                behavior = cmp.ConfirmBehavior.Replace
            }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
            ['<Tab>'] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                elseif luasnip.expand_or_jumpable() then
                    luasnip.expand_or_jump()
                else
                    fallback()
                end
            end, { 'i', 's' }),
            ['<S-Tab>'] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item()
                elseif luasnip.jumpable( -1) then
                    luasnip.jump( -1)
                else
                    fallback()
                end
            end, { 'i', 's' }),
        }),
        formatting = {
            fields = { "abbr", "menu" },
            format = function(entry, vim_item)
                vim_item.menu = ({
                        nvim_lsp = "[LSP]",
                        luasnip = "[Snip]",
                        buffer = "[Buf]",
                        path = "[Path]",
                    })[entry.source.name]
                return vim_item
            end,
        },
        sources = cmp.config.sources({
            { name = 'nvim_lsp' },
            { name = 'luasnip' }, -- For luasnip users.
            { name = 'buffer' },
            { name = 'path' },
        }),
        confirm_opts = {
            behavior = cmp.ConfirmBehavior.Replace,
            select = false,
        },
        experimental = {
            ghost_text = false,
            native_menu = false,
        },
    })

    -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline('/', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
            { name = 'buffer' }
        }
    })

    cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
            { name = 'path' }
        }, {
            { name = 'cmdline' }
        })
    })
end

-- completion
return {
    'hrsh7th/nvim-cmp',
    -- load cmp on InsertEnter
    event = "InsertEnter",
    dependencies = {
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
        'hrsh7th/cmp-nvim-lsp',
        'saadparwaiz1/cmp_luasnip',

        -- snippets
        'L3MON4D3/LuaSnip',
        'rafamadriz/friendly-snippets', -- a bunch of snippets to use
    },
    config = configure
}
