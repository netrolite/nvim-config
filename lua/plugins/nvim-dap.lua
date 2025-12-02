return {
  "mfussenegger/nvim-dap",
  event = "VeryLazy",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
    "theHamsta/nvim-dap-virtual-text",
  },
  config = function()
    local dap = require("dap")
    local ui = require("dapui")
    ui.setup()

    require("nvim-dap-virtual-text").setup()

    dap.adapters.codelldb = {
      type = "executable",
      command = "codelldb", -- or if not in $PATH: "/absolute/path/to/codelldb"

      -- On windows you may have to uncomment this:
      -- detached = false,
    }

    dap.configurations.cpp = {
      {
        name = "Launch file",
        type = "codelldb",
        request = "launch",
        program = function()
          return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        args = function()
          local input = vim.fn.input('Program arguments: ')
          return vim.split(input, " ")
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
      },
    }


    vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint)
    vim.keymap.set("n", "<F1>", dap.continue)
    vim.keymap.set("n", "<F2>", dap.terminate)
    vim.keymap.set("n", "<Up>", dap.restart)
    vim.keymap.set("n", "<Down>", dap.step_over)
    vim.keymap.set("n", "<Left>", dap.step_out)
    vim.keymap.set("n", "<Right>", dap.step_into)

    -- evaluate value under cursor
    vim.keymap.set("n", "<leader>?", function()
      require("dapui").eval(nil, { enter = true })
    end)


    -- automatically open dap ui
    dap.listeners.before.attach.dapui_config = ui.open
    dap.listeners.before.launch.dapui_config = ui.open
    dap.listeners.before.event_terminated.dapui_config = ui.close
    dap.listeners.before.event_exited.dapui_config = ui.close
  end
}
