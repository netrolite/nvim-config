return {
	"akinsho/bufferline.nvim",
	event = "BufReadPre",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		local bufferline = require("bufferline")
		bufferline.setup({
			options = {
				diagnostics = "nvim_lsp",
				diagnostics_indicator = function(count, level)
					local icon = level:match("error") and " " or ""
					return icon .. " " .. count
				end,
				offsets = {
					{
						filetype = "NvimTree",
						highlight = "NvimTreeOffsetBackground",
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
