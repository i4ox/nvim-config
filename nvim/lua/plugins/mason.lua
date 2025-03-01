local border = {
	{ "╭", "FloatBorder" },
	{ "─", "FloatBorder" },
	{ "╮", "FloatBorder" },
	{ "│", "FloatBorder" },
	{ "╯", "FloatBorder" },
	{ "─", "FloatBorder" },
	{ "╰", "FloatBorder" },
	{ "│", "FloatBorder" },
}

return {
	"williamboman/mason.nvim",
	dependencies = {
		{ "williamboman/mason-lspconfig.nvim" },
		{ "WhoIsSethDaniel/mason-tool-installer.nvim" },
		{ "someone-stole-my-name/yaml-companion.nvim" },
		{ "b0o/schemastore.nvim" },
	},
	build = ":MasonUpdate",
	config = function()
		local handlers = {
			["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
			["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
		}

		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")
		local mason_tool_installer = require("mason-tool-installer")

		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lspconfig.setup({
			automatic_installation = false,
			ensure_installed = {
				"bashls", -- Bash support
				"cssls", -- CSS support
				"dockerls", -- Docker support
				"gopls", -- Golang support
				"graphql", -- GraphQL support
				"html", -- HTML support
				"jsonls", -- JSON support
				"lemminx", -- XML support
				"lua_ls", -- Lua support
				"marksman", -- Markdown support
				"pyright", -- Python support
				"tailwindcss", -- Tailwind CSS support
				"templ", -- Go templates support
				"ts_ls", -- Typescript support
				"starpls", -- Bazel support
				"volar", -- Vue support
				"yamlls", -- Yaml support
			}, -- Servers to install
			handlers = {
				function(server_name)
					-- TS server will be handled by typescript-tools.nvim
					if server_name == "ts_ls" then
						return
					end

					require("lspconfig")[server_name].setup({
						handlers = handlers,
					})
				end,
			},
		})

		mason_tool_installer.setup({
			ensure_installed = {
				-- Linters and formatters
				"stylua", -- Lua formatter
				"hadolint", -- Dockerfile linter
				"gofumpt", -- Golang formatter
				"goimports-reviser", -- Golang formatter for goimports
				"golangci-lint", -- Golang linter
				"markdownlint-cli2", -- Markdown linter
				"prettierd", -- Formatter for many languages
				"eslint_d", -- JavaScript linter
				"yamllint", -- YAML linter
				"yamlfmt", -- Formatter for YAML
				"buildifier", -- Formatter for Bazel
				-- Debuggers
				"delve", -- Go debugger
			},
		})

		-- Custom protobuf language server
		require("lspconfig.configs").protobuf_language_server = {
			default_config = {
				cmd = { "protobuf-language-server" },
				filetypes = { "proto" },
				root_dir = require("lspconfig.util").root_pattern(".git"),
				single_file_support = true,
			},
		}
		require("lspconfig").protobuf_language_server.setup({})

		-- Schemastore for jsonls
		local schemastore = require("schemastore")
		require("lspconfig").jsonls.setup({
			settings = {
				json = {
					schemas = schemastore.json.schemas(),
					validate = { enable = true },
				},
			},
		})

		-- Add Kubernetes and other schemas support for yamlls
		local yaml_companion = require("yaml-companion").setup({})
		require("lspconfig").yamlls.setup(vim.tbl_deep_extend("force", yaml_companion, {
			settings = {
				yaml = {
					schemas = {},
					validate = false, -- fix conflict with yaml_companion
				},
			},
			capabilities = {
				textDocument = {
					foldingRange = {
						dynamicRegistration = false,
						lineFoldingOnly = true,
					},
				},
			},
		}))

		-- Add inlay hints for Go
		require("lspconfig").gopls.setup({
			settings = {
				gopls = {
					gofumpt = true,
					codelenses = {
						gc_details = false,
						generate = true,
						regenerate_cgo = true,
						run_govulncheck = true,
						test = true,
						tidy = true,
						upgrade_dependency = true,
						vendor = true,
					},
					hints = {
						rangeVariableTypes = true,
						parameterNames = true,
						constantValues = true,
						assignVariableTypes = true,
						compositeLiteralFields = true,
						compositeLiteralTypes = true,
						functionTypeParameters = true,
					},
					analyses = {
						nilness = true,
						unusedparams = true,
						unusedwrite = true,
						useany = true,
					},
					usePlaceholders = true,
					completeUnimported = true,
					staticcheck = true,
					directoryFilters = { "-.git", "-.vscode", "-.idea", "-.vscode-test", "-node_modules" },
					semanticTokens = true,
				},
			},
		})
	end,
}
