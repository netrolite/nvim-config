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
			pre_hook = function(ctx)
				local U = require("Comment.utils")

				local location = nil
				if ctx.ctype == U.ctype.block then
					location = require("ts_context_commentstring.utils").get_cursor_location()
				elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
					location = require("ts_context_commentstring.utils").get_visual_start_location()
				end

				return require("ts_context_commentstring.internal").calculate_commentstring({
					key = ctx.ctype == U.ctype.line and "__default" or "__multiline",
					location = location,
				})
			end,
		})
	end,
}
