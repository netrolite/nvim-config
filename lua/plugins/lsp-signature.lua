return {
	"ray-x/lsp_signature.nvim",
	event = "VeryLazy",
	config = function(_, opts)
		require("lsp_signature").setup(opts)
		vim.keymap.set("n", "<leader>i", function()
			require("lsp_signature").toggle_float_win()
		end)
	end,
}
