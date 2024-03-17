local function config()
  local telescope = require("telescope")
  telescope.setup({
    defaults = {
      file_ignore_patterns = {
        "%.git/"
      }
    },
    pickers = {
      find_files = {
        hidden = true, -- include dotfiles
      },
    }
  })
end

return {
  "nvim-telescope/telescope.nvim",
  config = config,
  dependencies = { "nvim-lua/plenary.nvim" },
  lazy = false,
  branch = "0.1.x",
  keys = { -- only available after the plugin has loaded
    vim.keymap.set('n', '<leader>ff', ":Telescope find_files<CR>"),
    vim.keymap.set('n', '<leader>fa', ":Telescope<CR>"),
    vim.keymap.set('n', '<leader>fk', ":Telescope keymaps<CR>"),
    vim.keymap.set('n', '<leader>fh', ":Telescope help_tags<CR>"),
    vim.keymap.set('n', '<leader>fw', ":Telescope live_grep<CR>"),
    vim.keymap.set('n', '<leader>fb', ":Telescope buffers<CR>"),
    vim.keymap.set('n', '<leader>fz', ":Telescope current_buffer_fuzzy_find<CR>"),
  }
}
