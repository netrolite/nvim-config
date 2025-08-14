return {
  "nvim-telescope/telescope.nvim",
  opts = {
    defaults = {
      sorting_strategy = "ascending",
      layout_config = {
        prompt_position = "top",
      },
      file_ignore_patterns = {
        ".git", ".next", "node_modules", "target"
      },
      prompt_prefix = "",
      mappings = { -- comment out mappings when reinstalling config, then comment back in after telescope installs
        n = {
          ["q"] = require("telescope.actions").close,
          ["<C-d>"] = require("telescope.actions").delete_buffer,
        },
      }
    },
    pickers = {
      find_files = {
        find_command = {
          "rg",          -- ripgrep
          "--no-ignore", -- disable exclusion of files/directories based on .gitignore
          "--files",     -- dunno
          "--hidden"     -- search hidden files/directories (ones that begin with a dot)
        },
      },
    },
  },
  dependencies = { "nvim-lua/plenary.nvim" },
  branch = "0.1.x",
  keys = {
    { "gd", ":Telescope lsp_definitions<CR>", { nowait = true } },
  },
}
