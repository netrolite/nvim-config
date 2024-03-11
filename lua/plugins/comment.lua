return {
    'numToStr/Comment.nvim',
    lazy = false,
    config = function()
      require("Comment").setup({
        toggler = {
          line = "<leader>/",
          block = "<nop>"
        },
        opleader = {
          line = "<leader>/",
          block = "<leader>b/"
        },
        mappings = {
          extra = false -- don't create unnecessary mappings
        }
      })
    end
}
