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

mod_hl("NvimTreeIndentMarker", { fg = "#3F3F3F" })
mod_hl("NvimTreeCursorLine", { bg = "#303540" })
mod_hl("NvimTreeCursorLineNr", { fg = "#54546D" }) -- nvim tree line number
mod_hl("NvimTreeOffsetBackground", { bg = "#21252b" }) -- nvim tree line number
mod_hl("NvimTreeWinSeparator", { fg = "#282c34" })
mod_hl("BufferLineOffsetSeparator", { bg = "#21252b", fg = "#21252b" })
