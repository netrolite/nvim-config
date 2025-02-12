return {
  "norcalli/nvim-colorizer.lua",
  config = function()
    -- this plugin changes the back/foreground of color codes like #FFF
    require("colorizer").setup({ "*" }, { names = false })
  end,
  event = "VeryLazy",
}
