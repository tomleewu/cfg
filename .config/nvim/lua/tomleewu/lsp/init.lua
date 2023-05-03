local M = {}

local servers = {
    sqlls = {},
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
    cucumber_language_server = {},
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
                gofumpt = true,
                staticcheck = true,
                usePlaceholders = true
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
    require("lsp-format").on_attach(client)
end

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
    return
end
local capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

require("tomleewu.lsp.handlers").setup()

local opts = {
    on_attach = M.on_attach,
    capabilities = M.capabilities,
}

function M.setup()
    require("tomleewu.lsp.installer").setup(servers, opts)
end

require("lsp_signature").setup({
    hint_enable = false,
})

return M
