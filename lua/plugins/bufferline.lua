return {
	"akinsho/bufferline.nvim",
	event = "BufReadPre",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		local bufferline = require("bufferline")
		bufferline.setup({
			options = {
				diagnostics = "nvim_lsp",
				offsets = {
					{
						filetype = "NvimTree",
						highlight = "Directory",
						separator = "|",
					},
				},
				show_buffer_close_icons = false,
				style_preset = {
					bufferline.style_preset.minimal,
				},
			},
		})
	end,
}
