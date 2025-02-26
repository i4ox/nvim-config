return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		{ "L3MON4D3/LuaSnip", version = "2.*", build = "make install_jsregexp" },
		{ "onsails/lspkind-nvim" },
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-path" },
	},
	config = function()
		local cmp = require("cmp")

		cmp.setup({
			sources = cmp.config.sources({
        { name = "lazydev" },
				{ name = "nvim_lsp" },
        { name = "path" },
			}, {
        { name = "buffer", keyword_length = 3 },
      }),
			sorting = {
				comparators = {
					cmp.config.compare.offset,
					cmp.config.compare.exact,
					cmp.config.compare.score,
					cmp.config.compare.recently_used,
					cmp.config.compare.kind,
				},
			},
			completion = {
				autocomplete = {
					require("cmp.types").cmp.TriggerEvent.TextChanged,
				},
			},
			formatting = {
				format = require("lspkind").cmp_format({
					mode = "symbol_text",
					menu = {
						nvim_lsp = "[LSP]",
						path = "[Path]",
						buffer = "[Buffer]",
						emoji = "[Emoji]",
					},
					show_labelDetails = true,
					maxwidth = 40,
					ellipsis_char = "...",
				}),
			},
			mapping = cmp.mapping.preset.insert({
				["<C-e>"] = cmp.mapping.complete(),
				["<CR>"] = cmp.mapping.confirm({ select = false }),
			}),
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
			window = {
				completion = {
					border = "rounded",
					scrollbar = false,
					winhighlight = "Normal:Normal,FloatBorder:Normal,CursorLine:Visual,Search:None",
				},
				documentation = {
					border = "rounded",
					scrollbar = false,
					winhighlight = "Normal:Normal,FloatBorder:Normal,CursorLine:Visual,Search:None",
				},
			},
		})
	end,
}

