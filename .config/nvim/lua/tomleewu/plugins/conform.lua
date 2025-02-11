return
{
    'stevearc/conform.nvim',
    config = function()
        require('conform').setup({
            formatters_by_ft = {
                go = { "goimports", "goimports-reviser" }
            },
            format_after_save = {
                lsp_format = "fallback"
            },
            formatters = {
                ['goimports-reviser'] = {
                    args = { "$FILENAME" },
                }
            }
        })
    end,
}
