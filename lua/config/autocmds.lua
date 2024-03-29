local create_autocmd = vim.api.nvim_create_autocmd

create_autocmd("FileType", {
	pattern = "*",
	callback = function()
		vim.cmd("set formatoptions-=cro")
	end,
})
