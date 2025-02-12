return {
  "nvim-treesitter/nvim-treesitter",
  event = { "LazyFile", "VeryLazy" },
  lazy = vim.fn.argc(-1) == 0, -- load treesitter early when opening a file from the cmdline
  dependencies = "windwp/nvim-ts-autotag",
  build = ":TSUpdate",
  opts = {
    autotag = {
      enable = true,
    },
    indent = {
      enable = true,
    },
    auto_install = true,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = true,
    },
    ensure_installed = {
      "bash",
      "c",
      "diff",
      "html",
      "javascript",
      "javascriptreact",
      "jsdoc",
      "json",
      "jsonc",
      "lua",
      "luadoc",
      "luap",
      "markdown",
      "markdown_inline",
      "printf",
      "python",
      "query",
      "regex",
      "toml",
      "tsx",
      "typescript",
      "typescriptreact",
      "vim",
      "vimdoc",
      "xml",
      "yaml",
      "rust",
      "go"
    },
  }
}
