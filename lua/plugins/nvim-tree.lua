return {
	"nvim-tree/nvim-tree.lua",
	lazy = false,
	opts = {
		hijack_cursor = true,
		select_prompts = true,
		update_focused_file = { enable = true },
		view = {
			relativenumber = true,
			cursorline = true,
			width = 45,
		},
		renderer = {
			root_folder_label = ":t",
			highlight_bookmarks = "name",
			indent_markers = {
				enable = true,
				inline_arrows = true,
			},
		},
		diagnostics = {
			enable = true,
		},
		filters = {
			exclude = { -- always show
				".env*",
				"node_modules",
			},
		},
	},
	keys = {
		{ "<leader>N", ":NvimTreeToggle<CR>" },
	},
}
