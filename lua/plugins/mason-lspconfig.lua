return {
  "williamboman/mason-lspconfig.nvim",
  opts = {
    ensure_installed = {
      "efm", -- general lsp (works for any language i guess?)
      "lua_ls" -- alias for lua-language-server
    },
    automatic_installation = true
  },
  event = "BufReadPre",
  dependencies = "williamboman/mason.nvim",
}
