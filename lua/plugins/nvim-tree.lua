local mapKey = require("utils.mapKey")

return {
  "nvim-tree/nvim-tree.lua",
  lazy = false,
  config = {
    update_focused_file = {
      enable = true
    }
  }, -- this config is passed to `require("nvim-tree").setup(config)`
  keys = {
    mapKey("<leader>n", ":NvimTreeToggle<CR>"),
    mapKey("<leader>N", ":NvimTreeFocus<CR>")
  }
}
