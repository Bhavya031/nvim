return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "nvim-neotest/nvim-nio",
    },
    config = function()
        local dap = require("dap")
        local dapui = require("dapui")

        -- DAP UI configuration
        dap.listeners.before.attach.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.launch.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.event_terminated.dapui_config = function()
            dapui.close()
        end
        dap.listeners.before.event_exited.dapui_config = function()
            dapui.close()
        end

        -- Keymaps
        vim.keymap.set("n", "<Leader>dt", dap.toggle_breakpoint, {})
        vim.keymap.set("n", "<Leader>dc", dap.continue, {})

        -- cppdbg adapter configuration
        dap.adapters.cppdbg = {
            id = "cppdbg",
            type = "executable",
            command = "OpenDebugAD7",
            options = {
                detached = false,
            },
        }

        -- C++ configurations
        dap.configurations.cpp = {
            {
                name = "Launch file",
                type = "cppdbg",
                request = "launch",
                program = function()
                    return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
                end,
                cwd = "${workspaceFolder}",
                stopAtEntry = true,
            },
        }

        -- Use the same configuration for C
        dap.configurations.c = dap.configurations.cpp

        -- Add a global function to start debugging
        _G.start_cpp_debugger = function()
            dap.run(dap.configurations.cpp[1])
        end

        -- New keymap to start debugging
        vim.keymap.set("n", "<Leader>dg", _G.start_cpp_debugger, {})
    end
}
