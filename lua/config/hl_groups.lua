local hl_groups_count = 0

local function mod_hl(hl_group_name, hl_group_opts)
	vim.api.nvim_create_autocmd({ "VimEnter", "ColorScheme" }, {
		group = vim.api.nvim_create_augroup("Color" .. hl_groups_count, { clear = true }),
		pattern = "*",
		callback = function()
			local global_hl_namespace_id = 0
			vim.api.nvim_set_hl(global_hl_namespace_id, hl_group_name, hl_group_opts)
		end,
	})
	hl_groups_count = hl_groups_count + 1
end

mod_hl("WinSeparator", { fg = "#2D2D2D" })

mod_hl("NvimTreeIndentMarker", { fg = "#3F3F3F" })
mod_hl("NvimTreeCursorLine", { bg = "#232323" })
mod_hl("NvimTreeCursorLineNr", { fg = "#54546D" }) -- nvim tree line number

mod_hl("NormalFloat", { bg = "#353e49" }) -- diagnostics float & rename float input field
mod_hl("FloatBorder", { fg = "#6b695d", bg = "#212326" }) -- rename float & other floats also

mod_hl("LspSignatureActiveParameter", { bg = "#366080" })

mod_hl("TelescopeBorder", { bg = "#212326", fg = "#6b695d" })
mod_hl("TelescopeNormal", { bg = "#212326" })
mod_hl("TelescopeSelection", { bg = "#353e49" })
mod_hl("TelescopeSelectionCaret", { fg = "#4a6d9f" })
