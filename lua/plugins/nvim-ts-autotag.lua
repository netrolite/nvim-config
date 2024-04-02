return {
	"windwp/nvim-ts-autotag",
	ft = {
		"html",
		"htm",
		"svelte",
		"javascriptreact",
		"typescriptreact",
		"vue",
	},
	config = function()
		require("nvim-ts-autotag").setup({})
	end,
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
	},
}
