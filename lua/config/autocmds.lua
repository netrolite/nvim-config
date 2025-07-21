local create_autocmd = vim.api.nvim_create_autocmd

create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    vim.cmd("set formatoptions-=cro")
  end,
})

-- set markdown highlight for mdx file
create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = { "*.mdx" },
  callback = function()
    local buf = vim.api.nvim_get_current_buf()
    vim.api.nvim_buf_set_option(buf, "filetype", "markdown")
  end,
})
