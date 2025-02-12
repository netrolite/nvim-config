return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  dependencies = "windwp/nvim-ts-autotag",
  opts = {
    build = ":TSUpdate",
    autotag = {
      enable = true,
    },
    indent = {
      enable = true,
    },
    event = {
      "BufReadPre",
      "BufNewFile",
    },
    auto_install = true,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = true,
    },
  }
}
