local map = require("utils.map_key")

-- window management
map("<C-j>", "<C-w>j")
map("<C-k>", "<C-w>k")
map("<C-h>", "<C-w>h")
map("<C-l>", "<C-w>l")
map("<leader>=", ":resize +2<CR>")
map("<leader>-", ":resize -2<CR>")
map("<leader>[", ":vertical resize -2<CR>")
map("<leader>]", ":vertical resize +2<CR>")

-- splits
map("<leader>sh", ":split<CR>")
map("<leader>sv", ":vsplit<CR>")

-- lazy
map("<leader>lz", ":Lazy<CR>")

-- save buffer
map("<C-s>", ":w<CR>")

-- indentation
map("<", "<gv", { mode = "v" })
map(">", ">gv", { mode = "v" })
map("<", "<<")
map(">", ">>")

-- no highlight
map("<leader>nh", ":noh<CR>")

-- move text up and down
map("J", ":m '>+1<CR>gv=gv", { mode = "x" })
map("K", ":m '<-2<CR>gv=gv", { mode = "x" })

-- swap jump back/forward keymaps
map("<C-o>", "<C-i>")
map("<C-i>", "<C-o>")

-- buffers
map("H", ":BufferLineCyclePrev<CR>")
map("L", ":BufferLineCycleNext<CR>")
map("<leader>q", ":bp<bar>sp<bar>bn<bar>bd!<CR>")

-- delete back one word
map("<C-o>", "<C-w>", { mode = "i" })
