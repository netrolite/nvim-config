return {
	"williamboman/mason.nvim",
	cmd = "Mason",
	keys = {
		{ "<leader>M", ":Mason<CR>" }, -- this works so well i'm lovin it
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
