return {
	"folke/tokyonight.nvim",
	priority = 1000,
	dependencies = {
		{
			"xiyaowong/transparent.nvim",
			opts = {
				groups = { -- table: default groups
					"Normal",
					"NormalNC",
					"Comment",
					"Constant",
					"Special",
					"Identifier",
					"Statement",
					"PreProc",
					"Type",
					"Underlined",
					"Todo",
					"String",
					"Function",
					"Conditional",
					"Repeat",
					"Operator",
					"Structure",
					"LineNr",
					"NonText",
					"SignColumn",
					"StatusLine",
					"StatusLineNC",
					"EndOfBuffer",
				},
				extra_groups = {
					"NvimTreeNormal",
					"NormalFloat",
					"NvimTreeEndOfBuffer",
					"StatusLine",
					"StatusLineNC",
					"CmpItemMenu",
					"NoiceScrollbar",
				}, -- table: additional groups that should be cleared
				exclude_groups = {
					"CursorLine",
					"CursorLineNr",
					"CursorColumn",
					"InclineNormalFloat",
					"InclineNormalFloatNC",
				}, -- table: groups you don't want to clear,
			},
		},
	},
	opts = {
		style = "night",
		transparent = vim.g.transparent_enabled,
		terminal_colors = true,
		styles = {
			comments = { italic = false },
			keywords = { italic = false },
		},
	},
	config = function(_, opts)
		vim.g.transparent_enabled = true
		require("tokyonight").setup(opts)
		vim.cmd([[colorscheme tokyonight]])
		require("transparent").clear_prefix("Snacks")
		require("transparent").clear_prefix("Telescope")
		require("transparent").clear_prefix("Float")
		require("transparent").clear_prefix("Cmp")
		require("transparent").clear_prefix("Fold")
		require("transparent").clear_prefix("Trouble")

		vim.api.nvim_set_hl(0, "@markup.raw.markdown_inline", { bg = "#3d59a1", fg = "#c0caf5" })
		vim.api.nvim_set_hl(0, "CursorLine", { bg = "#3d59a1", fg = "#c0caf5" })
		vim.api.nvim_set_hl(0, "LspInlayHint", { bg = "#3d59a1", fg = "#c0caf5" })
		vim.api.nvim_set_hl(0, "LspReferenceRead", { bg = "#3d59a1", fg = "#c0caf5" })
		vim.api.nvim_set_hl(0, "LspReferenceText", { bg = "#3d59a1", fg = "#c0caf5" })
		vim.api.nvim_set_hl(0, "LspReferenceWrite", { bg = "#3d59a1", fg = "#c0caf5" })
		vim.api.nvim_set_hl(0, "Visual", { bg = "#3d59a1", fg = "#c0caf5" })
		vim.api.nvim_set_hl(0, "Search", { bg = "#3d59a1", fg = "#c0caf5" })
		vim.api.nvim_set_hl(0, "IncSearch", { bg = "#3d59a1", fg = "#c0caf5" })
		vim.api.nvim_set_hl(0, "MatchParen", { bg = "#3d59a1", fg = "#c0caf5" })
	end,
}
