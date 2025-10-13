return {
  "williamboman/mason.nvim",
  cmd = "Mason",
  keys = {
    { "<leader>M", ":Mason<CR>" },
  },
  event = "VeryLazy",
  dependencies = {
    "jay-babu/mason-nvim-dap.nvim",
  },
  config = function()
    require("mason").setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    require("mason-nvim-dap").setup({
      ensure_installed = { "codelldb" },
      handlers = {}, -- {} to use default config
    })
  end
}
