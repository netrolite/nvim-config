return {
	"nvim-telescope/telescope.nvim",
	config = function()
		local telescope = require("telescope")
		telescope.setup({
			defaults = {
				sorting_strategy = "ascending",
				layout_config = {
					prompt_position = "top",
				},
				file_ignore_patterns = {
					"%.git/",
				},
				prompt_prefix = "",
			},
			pickers = {
				find_files = {
					hidden = true, -- include dotfiles
				},
			},
		})
	end,
	dependencies = { "nvim-lua/plenary.nvim" },
	branch = "0.1.x",
	event = { "BufReadPre", "BufNewFile" },
	keys = {
		{ "<leader>ff", ":Telescope find_files<CR>" },
		{ "<leader>fa", ":Telescope<CR>" },
		{ "<leader>fk", ":Telescope keymaps<CR>" },
		{ "<leader>fh", ":Telescope help_tags<CR>" },
		{ "<leader>fw", ":Telescope live_grep<CR>" },
		{ "<leader>fb", ":Telescope buffers<CR>" },
		{ "<leader>fz", ":Telescope current_buffer_fuzzy_find<CR>" },
		{ "<leader>fr", ":Telescope oldfiles<CR>" },
	},
}
