local mapKey = require("utils.mapKey")

local M = {}

M.on_attach = function(client, bufnr)
	local opts = { noremap = true, silent = true, buffer = bufnr }

	mapKey("<leader>fd", "Lspsaga finder", "n", opts) -- go to definition
	mapKey("<leader>gd", "Lspsaga peek_definition", "n", opts) -- peak definition
	mapKey("<leader>gD", "Lspsaga goto_definition", "n", opts) -- go to definition
	mapKey("<leader>ca", "Lspsaga code_action", "n", opts) -- see available code actions
	mapKey("<leader>rn", "Lspsaga rename", "n", opts) -- smart rename
	mapKey("<leader>D", "Lspsaga show_line_diagnostics", "n", opts) -- show  diagnostics for line
	mapKey("<leader>d", "Lspsaga show_cursor_diagnostics", "n", opts) -- show diagnostics for cursor
	mapKey("<leader>pd", "Lspsaga diagnostic_jump_prev", "n", opts) -- jump to prev diagnostic in buffer
	mapKey("<leader>nd", "Lspsaga diagnostic_jump_next", "n", opts) -- jump to next diagnostic in buffer
	mapKey("K", "Lspsaga hover_doc", "n", opts) -- show documentation for what is under cursor

	if client.name == "pyright" then
		mapKey("<leader>oi", "PyrightOrganizeImports", "n", opts) -- organise imports
		mapKey("<leader>db", "DapToggleBreakpoint", "n", opts) -- toggle breakpoint
		mapKey("<leader>dr", "DapContinue", "n", opts) -- continue/invoke debugger
		mapKey("<leader>dt", "lua require('dap-python').test_method()", "n", opts) -- run tests
	end

	if client.name == "tsserver" then
		mapKey("<leader>oi", "TypeScriptOrganizeImports", "n", opts) -- organise imports
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
