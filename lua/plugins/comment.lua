return {
	"numToStr/Comment.nvim",
	dependencies = "JoosepAlviste/nvim-ts-context-commentstring",
	keys = {
		{
			"<leader>/",
			"<leader>/",
		},
		{
			"<leader>/",
			"<leader>/",
			mode = "v",
		},
		{
			"<leader>b/",
			"<leader>b/",
			mode = "v",
		},
	},
	config = function()
		require("Comment").setup({
			toggler = {
				line = "<leader>/",
				block = "<nop>",
			},
			opleader = {
				line = "<leader>/",
				block = "<leader>b/",
			},
			mappings = {
				extra = false, -- don't create unnecessary mappings
			},
		})
	end,
}
