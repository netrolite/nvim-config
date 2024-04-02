---@diagnostic disable: undefined-doc-name, undefined-field
--- Get completion context, i.e., auto-import/target module location.
--- Depending on the LSP this information is stored in different parts of the
--- lsp.CompletionItem payload. The process to find them is very manual: log the payloads
--- And see where useful information is stored.
---@param completion lsp.CompletionItem
---@param source cmp.Source
local function get_lsp_completion_context(completion, source)
	local ok, source_name = pcall(function()
		return source.source.client.config.name
	end)
	if not ok then
		return nil
	end
	if source_name == "tsserver" then
		return completion.detail
	elseif source_name == "pyright" or source_name == "vtsls" then
		if completion.labelDetails ~= nil then
			return completion.labelDetails.description
		end
	elseif source_name == "gopls" then
		-- And this, for the record, is how I inspect payloads
		-- require("ditsuke.utils").logger("completion source: ", completion) -- Lazy-serialization of heavy payloads
		-- require("ditsuke.utils").logger("completion detail added to gopls")
		return completion.detail
	end
end

return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-buffer", -- completion source for text in buffer
		"hrsh7th/cmp-path", -- completion source for file system paths
		"hrsh7th/cmp-nvim-lsp", -- completion source for lsp
		"hrsh7th/cmp-cmdline", -- completion source for command line
		"lukas-reineke/cmp-under-comparator", -- moves completion items starting with underscores to the end of the list
		"saadparwaiz1/cmp_luasnip", -- completion source for snippets
		"L3MON4D3/LuaSnip", -- snippet engine
		"rafamadriz/friendly-snippets", -- set of useful snippets
		"onsails/lspkind.nvim", -- vs-code like icons
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		require("luasnip.loaders.from_vscode").lazy_load()
		require("luasnip.loaders.from_snipmate").lazy_load({ paths = "./snippets" }) -- load snippets from ~/.config/nvim/snippets

		cmp.setup({
			completion = {
				completeopt = "menu,menuone",
			},
			snippet = { -- configure nvim-cmp to use luasnip for expanding snippets
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-f>"] = cmp.mapping.scroll_docs(2),
				["<C-d>"] = cmp.mapping.scroll_docs(-2),
				["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
				["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
				["<C-space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),
				["<C-y>"] = cmp.mapping(function()
					require("lsp_signature").toggle_float_win()
				end),
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.confirm()
					else
						fallback()
					end
				end, { "i", "s" }),
				["<C-h>"] = cmp.mapping(function()
					luasnip.expand()
				end, { "i" }),
				["<C-j>"] = cmp.mapping(function()
					luasnip.jump(1)
				end, { "i", "s" }),
				["<C-k>"] = cmp.mapping(function()
					luasnip.jump(-1)
				end),
				["<C-l>"] = cmp.mapping(function()
					if luasnip.choice_active() then
						luasnip.change_choice(1)
					end
				end),
			}, { "i", "s" }),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" }, -- lsp
				{ name = "luasnip" }, -- snippets
				{ name = "path" }, -- file system paths
				{ name = "buffer" }, -- current buffer
				{ name = "nvim_lsp_signature_help" }, -- function signature help
			}),
			-- configure lspkind and completion context (import paths)
			formatting = {
				format = function(entry, vim_item)
					local item_with_kind = require("lspkind").cmp_format({
						maxwidth = 50,
						ellipsis_char = "...",
					})(entry, vim_item)

					item_with_kind.menu = ""
					local completion_context = get_lsp_completion_context(entry.completion_item, entry.source)
					if completion_context ~= nil and completion_context ~= "" then
						local truncated_context = string.sub(completion_context, 1, 30)
						if truncated_context ~= completion_context then
							truncated_context = truncated_context .. "..."
						end
						item_with_kind.menu = item_with_kind.menu .. " " .. truncated_context
					end

					item_with_kind.menu_hl_group = "CmpItemAbbr"
					return item_with_kind
				end,
			},
		})
	end,
}
