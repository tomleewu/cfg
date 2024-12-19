return
{
    'stevearc/conform.nvim',
    config = function()
        require('conform').setup({
            formatters_by_ft = {
                go = { "goimports" }
            },
            format_after_save = {
                lsp_format = "fallback"
            }
        })
    end,
}
