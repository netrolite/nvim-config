local on_attach = require("utils.lsp_on_attach")

return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
	},
	config = function()
		local lspconfig = require("lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		-- Change the Diagnostic symbols in the sign column (gutter)
		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		-- used to enable autocompletion (assign to every lsp server config)
		local capabilities = cmp_nvim_lsp.default_capabilities()
		local opts = {
			capabilities = capabilities,
			on_attach = on_attach,
		}

		lspconfig["rust_analyzer"].setup(opts)
		lspconfig["marksman"].setup(opts)
		lspconfig["prismals"].setup(opts)
		lspconfig["pyright"].setup(opts)
		lspconfig["html"].setup(opts)
		lspconfig["tsserver"].setup(opts)
		lspconfig["cssls"].setup(opts)
		lspconfig["tailwindcss"].setup(opts)
		lspconfig["taplo"].setup(opts)
		lspconfig["css_variables"].setup(opts)
		lspconfig["cssmodules_ls"].setup(opts)

		-- requires per-project installation and configuration of typescript-svelte-plugin.
		-- https://github.com/sveltejs/language-tools/tree/master/packages/typescript-plugin#usage
		lspconfig["svelte"].setup(opts)

		lspconfig["graphql"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
		})
		lspconfig["emmet_ls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
		})
		lspconfig["lua_ls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = { -- custom settings for lua
				Lua = {
					-- make the language server recognize "vim" global
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						-- make language server aware of runtime files
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.stdpath("config") .. "/lua"] = true,
						},
					},
				},
			},
		})

		local vscodeLsCapabilities = vim.lsp.protocol.make_client_capabilities()
		vscodeLsCapabilities.textDocument.completion.completionItem.snippetSupport = true
		lspconfig["cssls"].setup({
			on_attach = on_attach,
			capabilities = vscodeLsCapabilities,
		})
		lspconfig["jsonls"].setup({
			capabilities = vscodeLsCapabilities,
			on_attach = on_attach,
		})
	end,
}
