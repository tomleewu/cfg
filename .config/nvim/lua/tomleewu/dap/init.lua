local M = {}

local function configure()
end

local function configure_exts()
    require("nvim-dap-virtual-text").setup()
    require("tomleewu.dap.dap-ui").setup()
    local dap, dapui = require "dap", require "dapui"
    dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
    end
end

local function configure_debuggers()
    require("tomleewu.dap.go").setup()
end

M.setup = function()
    configure()
    configure_exts()
    configure_debuggers()
    require("tomleewu.dap.keymaps").setup()
end

configure_debuggers()

return M
