local M = {}

local servers = {
  rust_analyzer = {
    settings = {
      rust_analyzer = {
        -- enable clippy on save
        checkOnSave = {
          command = "clippy",
        },
      }
    }
  },
  texlab = {
    settings = {
      texlab = {
        forwardSearch = {
          executable = "/Applications/Skim.app/Contents/SharedSupport/displayline",
          args = { "%l", "%p", "%f" }
        },
        build = {
          onSave = true,
        }
      }
    }
  },
  gopls = {
    settings = {
      gopls = {
        gofumpt = false,
        staticcheck = true,
        usePlaceholders = true,
      }
    }
  },
  lua_ls = {
    settings = {
      Lua = {
        diagnostics = {
          -- Get the language server to recognize the `vim` global
          globals = { "vim", },
        },
        telemetry = { enable = false },
        hint = {
          enable = true,
        },
      },
    },
  },
}

function M.on_attach(client, bufnr)
  require("tomleewu.lsp.keymaps").setup(bufnr)
end

require("tomleewu.lsp.handlers").setup()

local capabilities = vim.lsp.protocol.make_client_capabilities()

local opts = {
  on_attach = M.on_attach,
  capabilities = require('blink.cmp').get_lsp_capabilities(capabilities),
}

function M.setup()
  require("tomleewu.lsp.installer").setup(servers, opts)
end

require("lsp_signature").setup({
  hint_enable = false,
})

return M
