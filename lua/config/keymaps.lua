local mapKey = require("utils.mapKey")

-- window managment
mapKey("<C-j>", "<C-w>j")
mapKey("<C-k>", "<C-w>k")
mapKey("<C-h>", "<C-w>h")
mapKey("<C-l>", "<C-w>l")
mapKey("<C-Up>", ":resize +2<CR>")
mapKey("<C-Down>", ":resize -2<CR>")
mapKey("<C-Left>", ":vertical resize +2<CR>")
mapKey("<C-Right>", ":vertical resize -2<CR>")

-- splits
mapKey("<leader>sh", ":split<CR>")
mapKey("<leader>sv", ":vsplit<CR>")

-- lazy
mapKey("<leader>lz", ":Lazy<CR>")
mapKey("<C-s>", ":w<CR>")

-- indentation
mapKey("<", "<gv", "v")
mapKey(">", ">gv", "v")
mapKey("<", "<<")
mapKey(">", ">>")

-- switching buffers
mapKey("<C-i>", ":bp<CR>")
mapKey("<C-o>", ":bn<CR>")

-- close current buffer
mapKey("<leader>q", ":bd<CR>")

-- format
mapKey("<leader>fm", ":lua vim.lsp.buf.format()<CR>")

