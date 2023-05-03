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
		["lua_ls"] = function()
			local opts = vim.tbl_deep_extend("force", server_options, servers["lua_ls"] or {})
			lspconfig["lua_ls"].setup(opts)
		end,
		["gopls"] = function()
			local opts = vim.tbl_deep_extend("force", server_options, servers["gopls"] or {})
			lspconfig["gopls"].setup(opts)
		end,
		["rust_analyzer"] = function()
			local opts = vim.tbl_deep_extend("force", server_options, servers["rust_analyzer"] or {})
			require("rust-tools").setup {
				server = opts,
				tools = {
					inlay_hints = {
						-- automatically set inlay hints (type hints)
						-- default: true
						auto = true,
						only_current_line = true,
					}
				}
			}
		end,
	}
end

return M
