local remap = require("tomleewu.keymap")
local nmap = remap.nmap
-- General settings
vim.opt_local.tabstop = 4
vim.opt_local.shiftwidth = 4

-- General keymaps
nmap("<C-c>", "<cmd>GoTestFunc!<CR>")
nmap("<C-v>", "<cmd>GoVet<CR>")
nmap("<leader>i", "<cmd>GoFillStruct<CR>")
nmap("<leader>jt", "<cmd>GoAddTags<CR>")

-- Configuration
vim.g.go_def_mapping_enabled = 0
vim.g.go_term_enabled = 1
vim.g.go_term_reuse = 1
vim.g.go_term_close_on_exit = 0
vim.g.go_test_timeout = '60s'
vim.g.go_list_height = 15
vim.g.go_fmt_autosave = 0
vim.g.go_addtags_transform = 'camelcase'

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    local params = vim.lsp.util.make_range_params()
    params.context = { only = { "source.organizeImports" } }
    -- buf_request_sync defaults to a 1000ms timeout. Depending on your
    -- machine and codebase, you may want longer. Add an additional
    -- argument after params if you find that you have to write the file
    -- twice for changes to be saved.
    -- E.g., vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 3000)
    local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params)
    for cid, res in pairs(result or {}) do
      for _, r in pairs(res.result or {}) do
        if r.edit then
          local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
          vim.lsp.util.apply_workspace_edit(r.edit, enc)
        end
      end
    end
  end
})
