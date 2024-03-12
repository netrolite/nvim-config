return {
  "RRethy/vim-illuminate",
  config = function()
    require("illuminate").configure({
      filetypes_denylist = { -- don't enable in these file types
        "md"
      },
      min_count_to_highlight = 2,
    })
  end,
  event = "VeryLazy"
}
