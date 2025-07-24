return {
  "mason-org/mason-lspconfig.nvim",
  opts = {
    automatic_installation = true,
    ensure_installed = {
      "gopls",
      "gofumpt",
      "black",
      "cssmodules_ls",
      "html",
      "jsonls",
      "lua_ls",
      "ts_ls",
      "prisma_ls",
      "tailwindcss",
      "pyright",
      "rust_analyzer"
    },
  },
  event = "BufReadPre",
  dependencies = "williamboman/mason.nvim",
}
