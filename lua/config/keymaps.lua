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

-- telescope keymaps
local keymap = vim.keymap
local opts = { noremap = true, silent = false, nowait = true }
keymap.set("n", "gr", ":Telescope lsp_references<CR>", opts)          -- show definition, references
keymap.set("n", "<leader>gd", ":Telescope lsp_definitions<CR>", opts) -- show lsp definitions
keymap.set("n", "gI", ":Telescope lsp_incoming_calls<CR>", opts)      -- show incoming calls
keymap.set("n", "gO", ":Telescope lsp_outgoing_calls<CR>", opts)      -- show outgoing calls
keymap.set("n", "gi", ":Telescope lsp_implementations<CR>", opts)     -- show lsp implementations
keymap.set("n", "gt", ":Telescope lsp_type_definitions<CR>", opts)    -- show lsp type definitions
keymap.set("n", "gd", ":Telescope lsp_definitions<CR>", opts)         -- show lsp definitions
keymap.set("n", "<leader>fa", ":Telescope<CR>", opts)
keymap.set("n", "<leader>ff", ":Telescope find_files<CR>", opts)
-- keymap.set("n", "<S-l>", ":Telescope buffers sort_mru=true sort_lastused=true initial_mode=normal<CR>", opts)
keymap.set("n", "<leader>fk", ":Telescope keymaps<CR>", opts)
keymap.set("n", "<leader>fh", ":Telescope help_tags<CR>", opts)
keymap.set("n", "<leader>fw", ":Telescope live_grep<CR>", opts)
keymap.set("n", "<leader>fb", ":Telescope buffers<CR>", opts)
keymap.set("n", "<leader>fz", ":Telescope current_buffer_fuzzy_find<CR>", opts)
keymap.set("n", "<leader>fr", ":Telescope oldfiles<CR>", opts)
keymap.set("n", "<leader>D", ":Telescope diagnostics bufnr=0<CR>", opts)
