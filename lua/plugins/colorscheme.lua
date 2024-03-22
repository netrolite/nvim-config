return {
	"rebelot/kanagawa.nvim",
	lazy = false,
	priority = 999,
	config = function() -- called every time plugin loads
		vim.cmd("colorscheme kanagawa")
	end,
}
