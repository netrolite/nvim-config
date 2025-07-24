return {
  "mason-org/mason-lspconfig.nvim",
  opts = {
    automatic_installation = true,
    ensure_installed = {
      "gopls",
      "cssmodules_ls",
      "html",
      "jsonls",
      "lua_ls",
      "ts_ls",
      "prismals",
      "tailwindcss",
      "pyright",
      "rust_analyzer"
    },
  },
  event = "BufReadPre",
  dependencies = "williamboman/mason.nvim",
}
