return {
  "williamboman/mason.nvim",
  cmd = "Mason",
  keys = {
    { "<leader>M", ":Mason<CR>" },
  },
  opts = {
    ensure_installed = {
      "gopls",
      "gofumpt",
      "black",
      "cssmodules_ls",
      "html",
      "json_ls",
      "lua_ls",
      "ts_ls",
      "prisma_ls",
      "tailwindcss",
      "pyright",
      "rust_analyzer"
    },
    ui = {
      icons = {
        package_installed = "✓",
        package_pending = "➜",
        package_uninstalled = "✗",
      },
    },
  },
}
