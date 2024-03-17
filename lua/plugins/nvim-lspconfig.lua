local on_attach = require("utils.lsp").on_attach
local diagnostic_signs = require("utils.signs").diagnostic_signs

local config = function()
	local cmp_nvim_lsp = require("cmp_nvim_lsp")
	local lspconfig = require("lspconfig")

	for type, icon in pairs(diagnostic_signs) do
		local hl = "DiagnosticSign" .. type
		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
	end

	local capabilities = cmp_nvim_lsp.default_capabilities()
	local opts = { capabilities = capabilities, on_attach = on_attach }

	-- lua
	require("lspconfig").lua_ls.setup({
		on_init = function(client)
			local path = client.workspace_folders[1].name
			if vim.loop.fs_stat(path .. "/.luarc.json") or vim.loop.fs_stat(path .. "/.luarc.jsonc") then
				return
			end

			client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
				-- Tell the language server which version of Lua you're using
				runtime = { version = "LuaJIT" },
				-- Make the server aware of Neovim runtime files
				workspace = { checkThirdParty = false, library = { vim.env.VIMRUNTIME } },
			})
		end,
		settings = {
			Lua = {},
		},
	})
	-- json
	lspconfig.jsonls.setup(opts)
	-- python
	lspconfig.pyright.setup(opts)
	-- typescript
	lspconfig.tsserver.setup(opts)
	-- bash
	lspconfig.bashls.setup(opts)
	-- html, typescriptreact, javascriptreact, css, sass, scss, less, svelte, vue
	lspconfig.emmet_ls.setup(opts)
	-- docker
	lspconfig.dockerls.setup(opts)
end

return {
	"neovim/nvim-lspconfig",
	config = config,
	lazy = false,
	dependencies = {
		"williamboman/mason.nvim",
	},
}
