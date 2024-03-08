local vimModes = {
	n = "n",
	i = "i",
	v = "v",
}

local defaultOpts = {
	noremap = true,
	silent = true,
}

--- @param opts (table|nil)
--- @return table
local getOpts = function(opts)
	local allOpts = opts
	if allOpts == nil then
		allOpts = {}
	end
	for k, v in pairs(defaultOpts) do
		allOpts[k] = allOpts[k] or v
	end
	return allOpts
end

--- @param vimMode (string|nil)
--- @return string
local getMode = function(vimMode)
	local modeString = vimModes[vimMode]
	if modeString == nil then
		return "n"
	else
		return modeString
	end
end

--- @param keymaps string
--- @param command string
--- @param vimMode (string|nil)
--- @param options (table|nil)
--- @return nil
function mapKey(keymaps, command, vimMode, options)
	local mode = getMode(vimMode)
	local opts = getOpts(options)
	vim.keymap.set(mode, keymaps, command, opts)
end

return mapKey
