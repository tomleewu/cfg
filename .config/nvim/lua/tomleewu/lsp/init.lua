local M = {}

local servers = {
    sqlls = {},
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
    sumneko_lua = {
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

local status_ok2, _ = pcall(require, "lspconfig")
if not status_ok2 then
    return
end

require("lsp_signature").setup({
    hint_enable = false,
})

return M
