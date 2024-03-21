local function mod_hl(hl_name, opts)
	local is_ok, hl_def = pcall(vim.api.nvim_get_hl_by_name, hl_name, true)
	local global_hl_namespace_id = 0
	if is_ok then
		for k, v in pairs(opts) do
			hl_def[k] = v
		end
		vim.api.nvim_set_hl(global_hl_namespace_id, hl_name, hl_def)
	end
end

vim.api.nvim_create_autocmd({ "VimEnter", "ColorScheme" }, {
	group = vim.api.nvim_create_augroup("Color", {}),
	pattern = "*",
	callback = function()
		mod_hl("NvimTreeIndentMarker", { fg = "#526077" })
		vim.api.nvim_set_hl(0, "NvimTreeIndentMarker", { fg = "#526077" })
	end,
})
