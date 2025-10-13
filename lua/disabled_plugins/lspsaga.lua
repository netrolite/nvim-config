return {
  "nvimdev/lspsaga.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    symbol_in_winbar = {
      enable = false,
    },
    lightbulb = {
      enable = false,
    },
  }
}
