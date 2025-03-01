return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		formatters_by_ft = {
			go = { "goimports-reviser", "gofumpt", stop_after_first = true },
			lua = { "stylua" },
			javascript = { "prettierd", stop_after_first = true },
			typescript = { "prettierd", stop_after_first = true },
			javascriptreact = { "prettierd", stop_after_first = true },
			typescriptreact = { "prettierd", stop_after_first = true },
			vue = { "prettierd", stop_after_first = true },
			svelte = { "prettierd", stop_after_first = true },
			graphql = { "prettierd", stop_after_first = true },
			html = { "prettierd", stop_after_first = true },
			css = { "prettierd", stop_after_first = true },
			scss = { "prettierd", stop_after_first = true },
			json = { "prettierd", stop_after_first = true },
			yaml = { "yamlfmt", stop_after_first = true },
			bzl = { "buildifier", stop_after_first = true },
		},
		format_on_save = { async = false, timeout_ms = 500, lsp_fallback = true },
	},
}
