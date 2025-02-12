return {
  {
    'L3MON4D3/LuaSnip',
    version = 'v2.*',
    config = function()
      local luasnip = require("luasnip")

      -- load snippets
      luasnip.filetype_extend("javascriptreact", { "html" })
      luasnip.filetype_extend("typescriptreact", { "html" })
      require("luasnip/loaders/from_vscode").lazy_load()
      require("luasnip/loaders/from_snipmate").lazy_load() -- load snippets from ~/.config/nvim/snippets
    end,
  },
}
