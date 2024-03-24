local map_key = require("utils.map_key")

return {
	"ray-x/lsp_signature.nvim",
	event = "VeryLazy",
	config = function()
		require("lsp_signature").setup({
			hint_prefix = "🥸 ",
		})

		map_key("<C-i>", function()
			require("lsp_signature").toggle_float_win()
		end)
	end,
}
