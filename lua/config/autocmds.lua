local cmd = vim.cmd

-- format on save
cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]
