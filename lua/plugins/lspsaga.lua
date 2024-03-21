return {
	"nvimdev/lspsaga.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("lspsaga").setup({
			symbol_in_winbar = {
				enable = false,
			},
			lightbulb = {
				enable = false,
			},
		})
	end,
}
