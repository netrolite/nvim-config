return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	dependencies = "windwp/nvim-ts-autotag",
	config = function()
		require("nvim-treesitter.configs").setup({
			build = ":TSUpdate",
			autotag = {
				enable = true,
			},
			indent = {
				enable = true,
			},
			event = {
				"BufReadPre",
				"BufNewFile",
			},
			auto_install = true,
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = true,
			},
		})
	end,
}
