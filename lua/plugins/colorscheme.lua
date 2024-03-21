return {
	"joshdick/onedark.vim",
	lazy = false,
	priority = 999,
	config = function() -- called every time plugin loads
		vim.cmd("colorscheme onedark")
	end,
}
