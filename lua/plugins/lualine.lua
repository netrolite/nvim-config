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
			lualine_b = { "branch", "diff" },
			lualine_c = { "diagnostics", { "filename", path = 1, file_status = true } }, -- path = 1 is path relative to project root
			lualine_x = { "filetype", "filesize" },
			lualine_y = { "fileformat" },
			lualine_z = { "progress" },
		},
	})
end

return {
	"nvim-lualine/lualine.nvim",
	lazy = false,
	config = config,
}
