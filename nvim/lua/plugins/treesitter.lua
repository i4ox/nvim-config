return {
	"nvim-treesitter/nvim-treesitter",
	version = false,
	event = "VeryLazy",
	lazy = vim.fn.argc(-1) == 0,
	build = ":TSUpdate",
	dependencies = {
		{
			"windwp/nvim-ts-autotag",
			opts = {},
		},
		{
			"nvim-treesitter/nvim-treesitter-textobjects",
			config = function()
				local move = require("nvim-treesitter.textobjects.move")
				local configs = require("nvim-treesitter.configs")

				for name, fn in pairs(move) do
					if name:find("goto") == 1 then
						move[name] = function(q, ...)
							if vim.wo.diff then
								local config = configs.get_module("textobjects.move")[name] ---@type table<string,string>
								for key, query in pairs(config or {}) do
									if q == query and key:find("[%]%[][cC]") then
										vim.cmd("normal! " .. key)
										return
									end
								end
							end
							return fn(q, ...)
						end
					end
				end
			end,
		},
	},
	init = function(plugin)
		require("lazy.core.loader").add_to_rtp(plugin)
		require("nvim-treesitter.query_predicates")
	end,
	opts = {
		ensure_installed = {
			"bash",
			"css",
			"diff",
			"dockerfile",
			"git_config",
			"gitcommit",
			"git_rebase",
			"gitignore",
			"gitattributes",
			"graphql",
			"go",
			"gomod",
			"gosum",
			"gotmpl",
			"gowork",
			"helm",
			"html",
			"http",
			"javascript",
			"jsdoc",
			"json",
			"json5",
			"jsonc",
			"lua",
			"luadoc",
			"luap",
			"make",
			"markdown",
			"markdown_inline",
			"proto",
			"python",
			"query",
			"regex",
			"terraform",
			"toml",
			"tsx",
			"typescript",
			"scss",
			"starlark",
			"svelte",
			"sql",
			"vim",
			"vimdoc",
			"xml",
			"yaml",
		},
		ignore_install = {},
		highlight = { enable = true },
		indent = { enable = true },
	},
	config = function(_, opts)
		local tsconfig = require("nvim-treesitter.configs")
		tsconfig.setup(opts)
	end,
}
