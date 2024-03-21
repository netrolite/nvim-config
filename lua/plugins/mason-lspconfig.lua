return {
	"williamboman/mason-lspconfig.nvim",
	opts = {
		automatic_installation = true,
	},
	event = "BufReadPre",
	dependencies = "williamboman/mason.nvim",
}
