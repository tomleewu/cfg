local M = {}

M.setup = function()
  local signs = {
    { name = "DiagnosticSignError", text = ">>", numhl = "DiagnosticSignError" },
    { name = "DiagnosticSignWarn", text = "--", numhl = "DiagnosticSignWarn" },
    { name = "DiagnosticSignHint", text = "", numhl = "DiagnosticSignHint" },
    { name = "DiagnosticSignInfo", text = "", numhl = "DiagnosticSignInfo" },
  }

  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = sign.numhl })
  end

  local config = {
    diagnostic = {
      virtual_text = false,
      update_in_insert = false,
      underline = true,
      severity_sort = true,
      signs = {
        active = signs,
      },
      float = {
        focusable = false,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
      },
    },

    float = {
      focusable = false,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
    },
  }

  vim.diagnostic.config(config.diagnostic)

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, config.float)

  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, config.float)

end

return M
