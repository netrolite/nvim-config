return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-buffer", -- completion source for text in buffer
		"hrsh7th/cmp-path", -- completion source for file system paths
		"hrsh7th/cmp-nvim-lsp", -- completion source for lsp
		"hrsh7th/cmp-cmdline", -- completion source for command line
		"saadparwaiz1/cmp_luasnip", -- completion source for snippets
		"L3MON4D3/LuaSnip", -- snippet engine
		"rafamadriz/friendly-snippets", -- set of useful snippets
		"onsails/lspkind.nvim", -- vs-code like pictograms
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		local lspkind = require("lspkind")
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
