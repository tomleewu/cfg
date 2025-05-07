local M = {}

function M.on_attach(_, bufnr)
  require("tomleewu.lsp.keymaps").setup(bufnr)
end

require("tomleewu.lsp.handlers").setup()

function M.setup()
  require("mason").setup()

  local capabilities = require('blink.cmp').get_lsp_capabilities()
  local lsp_configs = { 'gopls', 'lua_ls' }

  require("mason-lspconfig").setup({
    ensure_installed = lsp_configs,
    automatic_installation = false
  })

  -- Configure each LSP server
  for _, server_name in pairs(lsp_configs) do
    -- Load the existing configuration for the server
    local ok, server_config = pcall(require, "tomleewu.lsp." .. server_name)
    if not ok then
      server_config = {}
    end

    -- Apply the configuration using `vim.lsp.config`
    vim.lsp.config(server_name, vim.tbl_deep_extend("force", server_config, {
      on_attach = M.on_attach,
      capabilities = capabilities,
    }))
  end

  vim.lsp.enable(lsp_configs)
end

require("lsp_signature").setup({
  hint_enable = false,
})

return M
