return {
  "akinsho/bufferline.nvim",
  event = "BufReadPre",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    local bufferline = require("bufferline")
    bufferline.setup({
      options = {
        style_preset = bufferline.style_preset.default,
        diagnostics = "nvim_lsp",
        offsets = { { filetype = "NvimTree" } },
        show_buffer_close_icons = false
      }
    })
  end
}
