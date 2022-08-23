local M = {}

local function lsp_highlight_document(client, bufnr)
  if client.resolved_capabilities.document_highlight then
    local lsp_highlight_grp = vim.api.nvim_create_augroup("LspDocumentHighlight", { clear = true })
    vim.api.nvim_create_autocmd("CursorHold", {
      callback = function()
        vim.schedule(vim.lsp.buf.document_highlight)
      end,
      group = lsp_highlight_grp,
      buffer = bufnr,
    })
    vim.api.nvim_create_autocmd("CursorMoved", {
      callback = function()
        vim.schedule(vim.lsp.buf.clear_references)
      end,
      group = lsp_highlight_grp,
      buffer = bufnr,
    })
  end
end

function M.setup(client, bufnr)
  lsp_highlight_document(client, bufnr)
end

return M
