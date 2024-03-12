local cmd = vim.cmd

-- format on save
cmd [[au BufWritePre * lua vim.lsp.buf.format()]]
