local M = {}

function M.setup(servers, server_options)
  local lspconfig = require "lspconfig"

  require("mason").setup()

  require("mason-lspconfig").setup({
    ensure_installed = vim.tbl_keys(servers),
    automatic_installation = false
  })

  require("mason-lspconfig").setup_handlers {
    function(server_name)
      local opts = vim.tbl_deep_extend("force", server_options, servers[server_name] or {})
      lspconfig[server_name].setup(opts)
    end,
    -- ["sumneko_lua"] = function()
    --   local opts = vim.tbl_deep_extend("force", server_options, servers["sumneko_lua"] or {})
    --   -- lspconfig.sumneko_lua.setup(require("lua-dev").setup { lspconfig = opts })
    -- end,
    ["gopls"] = function()
      local opts = vim.tbl_deep_extend("force", server_options, servers["gopls"] or {})
      -- Don't focus loclist on lint
      vim.cmd [[
        augroup NvimGo
          autocmd!
          autocmd User NvimGoLintPopupPost wincmd p
        augroup END
      ]]

      require("go").setup({
        lint_prompt_style = 'vt',
        test_popup_auto_leave = true,
        test_popup_width = 150,
        tags_options = {},
        tags_transform = 'camelcase',
      })

      lspconfig["gopls"].setup(opts)
    end,
  }

end

return M
