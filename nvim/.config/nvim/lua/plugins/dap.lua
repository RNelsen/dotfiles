return {
  {

    "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")

      -- dap.defaults.fallback.external_terminal = {
      --   command = "/usr/bin/alacritty",
      --   args = { "-e" },
      -- }

      dap.adapters.codelldb = {

        type = "server",
        -- host = '127.0.0.1',
        port = "${port}",
        executable = {
          -- CHANGE THIS to your path!
          -- command = '/home/reid/.local/share/nvim/mason/packages/codelldb/codelldb',
          command = "/usr/bin/codelldb",
          args = { "--port", "${port}" },

          -- On windows you may have to uncomment this:
          -- detached = false,
        },
      }

      dap.configurations.cpp = {
        {
          name = "Launch file",
          type = "codelldb",
          request = "launch",
          program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
          end,
          -- program = '${file}',
          cwd = "${workspaceFolder}",
          -- console = "integratedTerminal",
          console = "internalConsole",
          runInTerminal = false,
          stopOnEntry = false,
        },
      }

      dap.configurations.lua = {
        {
          name = "Current file (local-lua-dbg, lua)",
          type = "local-lua",
          request = "launch",
          cwd = "${workspaceFolder}",
          program = {
            lua = "lua5.1",
            file = "${file}",
          },
          args = {},
        },
      }

      dap.configurations.c = dap.configurations.cpp
    end,
  },
  {
    "theHamsta/nvim-dap-virtual-text",
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup({
        layouts = {
          {
            elements = {
              {
                id = "stacks",
                size = 0.10,
              },
              {
                id = "breakpoints",
                size = 0.10,
              },
              {
                id = "watches",
                size = 0.25,
              },
              {
                id = "scopes",
                size = 0.55,
              },
            },
            position = "left",
            size = 40,
          },
          {
            elements = {
              {
                id = "repl",
                size = 0.5,
              },
              {
                id = "console",
                size = 0.5,
              },
            },
            position = "bottom",
            size = 12,
          },
        },
      })
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      -- dap.listeners.before.event_terminated['dapui_config'] = function()
      -- dapui.close()
      -- end
      -- dap.listeners.before.event_exited['dapui_config'] = function()
      -- dapui.close()
      -- dapui.disconnect()
      -- dapui.stop()
      -- end
    end,
  },
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
    },
    config = function()
      local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
      require("dap-python").setup(path)
    end,
  },
  {
    "Weissle/persistent-breakpoints.nvim",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      require("persistent-breakpoints").setup({
        load_breakpoints_event = { "BufReadPost" },
      })
    end,
  },
}
