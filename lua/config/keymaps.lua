local mapKey = require("utils.mapKey")

-- window managment
mapKey("<C-j>", "<C-w>j")
mapKey("<C-k>", "<C-w>k")
mapKey("<C-h>", "<C-w>h")
mapKey("<C-l>", "<C-w>l")
mapKey("<leader>=", ":resize +2<CR>")
mapKey("<leader>-", ":resize -2<CR>")
mapKey("<leader>]", ":vertical resize -2<CR>")
mapKey("<leader>[", ":vertical resize +2<CR>")

-- splits
mapKey("<leader>sh", ":split<CR>")
mapKey("<leader>sv", ":vsplit<CR>")

-- lazy
mapKey("<leader>lz", ":Lazy<CR>")

-- save buffer
mapKey("<C-s>", ":w<CR>")

-- indentation
mapKey("<", "<gv", "v")
mapKey(">", ">gv", "v")
mapKey("<", "<<")
mapKey(">", ">>")

-- format
mapKey("<leader>fm", ":lua vim.lsp.buf.format()<CR>")

-- no highlight
mapKey("<leader>nh", ":noh<CR>")

-- move text up and down
mapKey("J", ":m '>+1<CR>gv=gv", { mode = "x" })
mapKey("K", ":m '<-2<CR>gv=gv", { mode = "x" })

-- swap back/forward keymaps
mapKey("<C-o>", "<C-i>")
mapKey("<C-i>", "<C-o>")

-- buffers
mapKey("H", ":BufferLineCyclePrev<CR>")
mapKey("L", ":BufferLineCycleNext<CR>")
mapKey("<C-h>", ":BufferLineMoveNext<CR>")
mapKey("<C-l>", ":BufferLineMovePrev<CR>")
