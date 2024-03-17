return {
  "nvim-tree/nvim-tree.lua",
  lazy = false,
  opts = {
    update_focused_file = {
      enable = true,
    },
    view = {
      relativenumber = true
    }
  },
  keys = {
    { "<leader>N", ":NvimTreeToggle<CR>"}
  }
}
