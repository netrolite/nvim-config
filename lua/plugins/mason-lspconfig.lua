return {
  "williamboman/mason-lspconfig.nvim",
  opts = {
    ensure_installed = {
      "efm", -- general-purpose lsp
      "lua_ls" -- alias for lua-language-server
    },
    automatic_installation = true
  },
  event = "BufReadPre",
  dependencies = "williamboman/mason.nvim",
}
