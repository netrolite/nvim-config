local function tsserver_organize_imports()
	local params = {
		command = "_typescript.organizeImports",
		arguments = { vim.api.nvim_buf_get_name(0) },
		title = "",
	}
	vim.lsp.buf.execute_command(params)
end

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
		local keymap = vim.keymap

		local on_attach = function(client, bufnr)
			local opts = { noremap = true, silent = true, buffer = bufnr }

			keymap.set("n", "gr", ":Telescope lsp_references<CR>", opts) -- show definition, references
			keymap.set("n", "gd", ":Telescope lsp_definitions<CR>", opts) -- show lsp definitions
			keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration
			keymap.set("n", "gI", ":Telescope lsp_incoming_calls<CR>", opts) -- show incoming calls
			keymap.set("n", "gO", ":Telescope lsp_outgoing_calls<CR>", opts) -- show outgoing calls
			keymap.set("n", "gi", ":Telescope lsp_implementations<CR>", opts) -- show lsp implementations
			keymap.set("n", "gt", ":Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions
			keymap.set("n", "<leader>D", ":Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file
			keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection
			keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename
			keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer
			keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer
			keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor
			keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
			keymap.set("n", "<leader>H", ':execute "help " . expand("<cword>")<CR>', opts)

			if client.name == "pyright" then
				keymap.set("n", "<leader>oi", ":PyrightOrganizeImports<CR>", opts) -- organize imports
				keymap.set("n", "<leader>db", ":DapToggleBreakpoint<CR>", opts) -- toggle breakpoint
				keymap.set("n", "<leader>dr", ":DapContinue<CR>", opts) -- continue/invoke debugger
				keymap.set("n", "<leader>dt", ":lua require('dap-python').test_method()", opts) -- run tests
			end

			if client.name == "tsserver" then
				keymap.set("n", "<leader>oi", tsserver_organize_imports, opts) -- organize imports
			end
		end

		-- used to enable autocompletion (assign to every lsp server config)
		local capabilities = cmp_nvim_lsp.default_capabilities()
		local opts = {
			capabilities = capabilities,
			on_attach = on_attach,
		}

		-- Change the Diagnostic symbols in the sign column (gutter)
		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		lspconfig["html"].setup(opts)
		lspconfig["tsserver"].setup(opts)
		lspconfig["cssls"].setup(opts)
		lspconfig["tailwindcss"].setup(opts)

		lspconfig["svelte"].setup({
			capabilities = capabilities,
			on_attach = function(client, bufnr)
				on_attach(client, bufnr)

				vim.api.nvim_create_autocmd("BufWritePost", {
					pattern = { "*.js", "*.ts" },
					callback = function(ctx)
						if client.name == "svelte" then
							client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.file })
						end
					end,
				})
			end,
		})

		lspconfig["prismals"].setup(opts)

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

		lspconfig["pyright"].setup(opts)

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

		lspconfig["jdtls"].setup(opts)
	end,
}
