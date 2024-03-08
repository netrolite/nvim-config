return {
	"EdenEast/nightfox.nvim",
	lazy = false,
	priority = 999,
	config = function() -- called every time plugin loads
		vim.cmd("colorscheme nightfox")
	end
}
