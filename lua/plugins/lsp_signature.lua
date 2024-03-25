local map_key = require("utils.map_key")

return {
	"ray-x/lsp_signature.nvim",
	event = "VeryLazy",
	config = function()
		require("lsp_signature").setup({
			hint_enable = false,
		})

		map_key("<C-y>", function()
			require("lsp_signature").toggle_float_win()
		end)
	end,
}
