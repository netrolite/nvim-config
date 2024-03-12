return {
  "lukas-reineke/indent-blankline.nvim",
  man = "ibl",
  event = "VeryLazy",
  config = function()
    require("ibl").setup()
  end
}
