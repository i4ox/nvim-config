return {
	"mfussenegger/nvim-lint",
	event = {
		"BufReadPre",
		"BufNewFile",
	},
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			bash = { "shellcheck" },
			dockerfile = { "hadolint" },
			markdown = { "markdownlint-cli2" },
			go = { "golangcilint" },
			yaml = { "yamllint" },
			javascript = { "eslint_d" },
			typescript = { "eslint_d" },
			javascriptreact = { "eslint_d" },
			typescriptreact = { "eslint_d" },
			svelte = { "eslint_d" },
			vue = { "eslint_d" },
			json = { "eslint_d" },
			graphql = { "eslint_d" },
			html = { "eslint_d" },
			css = { "eslint_d" },
			scss = { "eslint_d" },
			bzl = { "buildifier" },
		}
		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost" }, {
			group = lint_augroup,
			callback = function()
				lint.try_lint()
			end,
		})
	end,
}
