local default_opts = {
	noremap = true,
	silent = true,
}

function mapKey(keymaps, command, mode_and_opts)
  mode_and_opts = mode_and_opts or {}
	local mode = mode_and_opts.mode or "n"

	local opts
  if mode_and_opts.opts then
    opts = vim.tbl_deep_extend("force", default_opts, mode_and_opts.opts)
  else
    opts = default_opts
  end

	vim.keymap.set(mode, keymaps, command, merged_opts)
end

return mapKey
