local config = function()
	require("lualine").setup({
		options = {
			theme = "auto",
			globalstatus = true,
			component_separators = { left = "", right = "" },
			section_separators = { left = "", right = "" },
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = { "branch" },
			lualine_c = { "location", "searchcount",  "selectioncount" },
			lualine_x = { "filetype" },
			lualine_y = { "fileformat" },
			lualine_z = { "progress" },
		}
	})
end

return {
	"nvim-lualine/lualine.nvim",
	lazy = false,
	config = config,
}
