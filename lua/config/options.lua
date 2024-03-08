local opt = vim.opt

-- tabs & indentation
opt.tabstop = 2 -- number of spaces for a tab character
opt.shiftwidth = 2 -- number of spaces for each level of indentation

opt.softtabstop = 2 -- number of spaces for tab in insert mode
opt.expandtab = true -- convert tabs to spaces
opt.smartindent = true -- autoindentation
opt.wrap = false -- prevent long lines from wrapping (use :set wrap to set this to true. Can be useful in markdown files and such)

-- search
opt.incsearch = true -- highlight matches as you search
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- don't ignore case in search term characters that are capitalized

-- appearance
opt.relativenumber = true
opt.number = true
opt.termguicolors = true -- allow all colors (aka enable 24-bit colors)
-- opt.colorcolumn -- column for line length
opt.signcolumn = "yes" -- a column separate from line numbers that shows warnings errors, etc...
-- opt.cmdheight = 10 -- the height of the command-line area. This area is where you type commands and see messages such as those produced by commands like :echo or error messages.
opt.scrolloff = 10

opt.completeopt = "menuone,noinsert,noselect,longest" -- completion menu settings
-- menuone = display the menu even if there's only 1 completion item
-- noinsert = don't automatically insert the first completion item into the buffer
-- noselect = don't automatically select the first completion item
-- longest = make the longest match the first item in the list


-- behavior
opt.errorbells = false -- disable error sounds
opt.swapfile = false -- disable swap files
opt.undofile = true -- create files containing the history of all changes to a file to allow for undoing even after reopening vim
opt.undodir = vim.fn.expand("~/.vim/undodir")
-- add support for using normal mode when Russian is selected in the os
opt.langmap = "ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz"
opt.splitright = true -- split new horizontal windows to the right
opt.splitbelow = true -- split new vertical windows to below the current window 
opt.iskeyword:append("-") -- when deleting back one word, treat words separated by hyphens as one word
opt.mouse:append("a") -- allow using the mouse in (a)ll modes
opt.clipboard:append("unnamedplus") -- allow pasting outside of vim
opt.history = 50 -- command history length
opt.scrolloff = 15
