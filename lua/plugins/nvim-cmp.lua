local has_words_before = require("utils.has_words_before").has_words_before

return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-buffer", -- completion source for text in buffer
		"hrsh7th/cmp-path", -- completion source for file system paths
		"hrsh7th/cmp-nvim-lsp", -- completion source for lsp
		"hrsh7th/cmp-cmdline", -- completion source for lsp
		"saadparwaiz1/cmp_luasnip", -- completion source for snippets
		"L3MON4D3/LuaSnip", -- snippet engine
		"rafamadriz/friendly-snippets", -- set of useful snippets
		"onsails/lspkind.nvim", -- vs-code like pictograms
	},
	config = function()
		local cmp = require("cmp")
		local cmp_autopairs = require("nvim-autopairs.completion.cmp")
		local luasnip = require("luasnip")
		local lspkind = require("lspkind")

		-- insert parenthesis when autocompleting a function
		cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

		-- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
		-- you can also specify a custom directory to load them from a non-standard location
		-- see https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#add-snippets
		require("luasnip.loaders.from_vscode").lazy_load()
		-- load snipmate snippets (from ~/.config/nvim/snippets)
		require("luasnip.loaders.from_snipmate").lazy_load()

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
				["<C-i>"] = cmp.mapping(function()
					print("hello")
					require("lsp_signature").toggle_float_win()
				end),
				["<C-j>"] = cmp.mapping.scroll_docs(1),
				["<C-k>"] = cmp.mapping.scroll_docs(-1),
				["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
				["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
				["<C-m>"] = cmp.mapping.complete(),
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.confirm({ select = true })
					elseif luasnip.expand_or_jumpable() then
						luasnip.expand_or_jump()
					elseif has_words_before and has_words_before() then
						cmp.complete()
					else
						fallback()
					end
				end, { "i", "s" }), -- input and snippet modes
			}),
			-- sources for autocompletion
			sources = cmp.config.sources({
				{ name = "nvim_lsp" }, -- lsp
				{ name = "path" }, -- file system paths
				{ name = "luasnip" }, -- snippets
				{ name = "buffer" }, -- current buffer
			}),
			-- configure lspkind for vscode-like pictograms in completion menu
			formatting = {
				format = lspkind.cmp_format({ maxwidth = 50, ellipsis_char = "..." }),
			},
		})
	end,
}
