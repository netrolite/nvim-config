local function mod_hl(hl_group_name, hl_group_opts)
	vim.api.nvim_create_autocmd({ "VimEnter", "ColorScheme" }, {
		group = vim.api.nvim_create_augroup("Color", { clear = true }),
		pattern = "*",
		callback = function()
			local global_hl_namespace_id = 0
			vim.api.nvim_set_hl(global_hl_namespace_id, hl_group_name, hl_group_opts)
		end,
	})
end

mod_hl("NvimTreeIndentMarker", { fg = "#3e4452" })
