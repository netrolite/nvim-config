return {
	"lukas-reineke/indent-blankline.nvim",
	man = "ibl",
	event = "VeryLazy",
	config = function()
		local highlight = {
			"Gray",
		}

		local hooks = require("ibl.hooks")
		hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
			vim.api.nvim_set_hl(0, "Gray", { fg = "#2D2D2D" })
		end)

		require("ibl").setup({
			indent = { highlight = highlight },
			scope = { enabled = false },
		})
	end,
}
