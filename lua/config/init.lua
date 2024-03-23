require("config.globals")
require("config.options")
require("config.keymaps")
require("config.hl_groups")

-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then -- if lazy.nvim is not installed then install it
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

-- rpt = runtime path
-- nvim looks in the runtime path to find things to run (like plugins)
vim.opt.rtp:prepend(lazypath)

local lazyOpts = {
	defaults = { lazy = true },
	rtp = {
		disabled_plugins = {
			"gzip",
			"matchit",
			"matchparen",
			"netrwPlugin",
			"tarPlugin",
			"tohtml",
			"tutor",
			"zipPlugin",
		},
	},
}

require("lazy").setup("plugins", lazyOpts) -- plugins is the directory with all the plugin configs
