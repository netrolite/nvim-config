local mapKey = require("utils.mapKey")

local M = {}

M.on_attach = function(client, bufnr)
	local opts = { noremap = true, silent = true, buffer = bufnr }

	mapKey("<leader>fd", "Lspsaga finder", { opts }) -- go to definition
	mapKey("<leader>gd", "Lspsaga peek_definition", { opts }) -- peek definition
	mapKey("<leader>gD", "Lspsaga goto_definition", { opts }) -- go to definition
	mapKey("<leader>ca", "Lspsaga code_action", { opts }) -- see available code actions
	mapKey("<leader>rn", "Lspsaga rename", { opts }) -- smart rename
	mapKey("<leader>D", "Lspsaga show_line_diagnostics", { opts }) -- show  diagnostics for line
	mapKey("<leader>d", "Lspsaga show_cursor_diagnostics", { opts }) -- show diagnostics for cursor
	mapKey("<leader>pd", "Lspsaga diagnostic_jump_prev", { opts }) -- jump to prev diagnostic in buffer
	mapKey("<leader>nd", "Lspsaga diagnostic_jump_next", { opts }) -- jump to next diagnostic in buffer
	mapKey("K", "Lspsaga hover_doc", { opts }) -- show documentation for what is under cursor

	if client.name == "pyright" then
		mapKey("<leader>oi", "PyrightOrganizeImports", { opts }) -- organise imports
		mapKey("<leader>db", "DapToggleBreakpoint", { opts }) -- toggle breakpoint
		mapKey("<leader>dr", "DapContinue", { opts }) -- continue/invoke debugger
		mapKey("<leader>dt", "lua require('dap-python').test_method()", { opts }) -- run tests
	end

	if client.name == "tsserver" then
		mapKey("<leader>oi", "TypeScriptOrganizeImports", { opts }) -- organise imports
	end
end

M.typescript_organise_imports = {
	description = "Organise Imports",
	function()
		local params = {
			command = "_typescript.organizeImports",
			arguments = { vim.fn.expand("%:p") },
		}
		-- reorganise imports
		vim.lsp.buf.execute_command(params)
	end,
}

return M
