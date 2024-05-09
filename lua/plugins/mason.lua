return {
	"williamboman/mason.nvim",
	cmd = "Mason",
	keys = {
		{ "<leader>M", ":Mason<CR>" },
	},
	opts = {
		ui = {
			icons = {
				package_installed = "✓",
				package_pending = "➜",
				package_uninstalled = "✗",
			},
		},
	},
}
