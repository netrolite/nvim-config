local function tsserver_organize_imports()
	local params = {
		command = "_typescript.organizeImports",
		arguments = { vim.api.nvim_buf_get_name(0) },
		title = "",
	}
	vim.lsp.buf.execute_command(params)
end

return function(client, bufnr)
	local keymap = vim.keymap
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
