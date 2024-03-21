local default_opts = {
	noremap = true,
	silent = true,
}

local function mapKey(keymaps, command, mode_and_opts)
	mode_and_opts = mode_and_opts or {}
	local mode = mode_and_opts.mode or "n"

	local opts = default_opts
	if mode_and_opts.opts then
		opts = vim.tbl_deep_extend("force", default_opts, mode_and_opts.opts)
	end

	vim.keymap.set(mode, keymaps, command, opts)
end

return mapKey
