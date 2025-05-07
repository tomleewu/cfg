---@type vim.lsp.Config
return {
  settings = {
    gopls = {
      gofumpt = false,
      staticcheck = true,
      usePlaceholders = true,
    }
  }
}
