return {
	"williamboman/mason.nvim",
	cmd = "Mason",
	keys = {
		{ "<leader>M", ":Mason<CR>" },
	},
	opts = {
		ensure_installed = {
			"gopls",
			"gofumpt",
		},
		ui = {
			icons = {
				package_installed = "✓",
				package_pending = "➜",
				package_uninstalled = "✗",
			},
		},
	},
}
