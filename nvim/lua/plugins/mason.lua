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
        -- "asm-lsp",
        "ts_ls", -- Typescript support
        "gopls", -- Golang support
        "lua_ls", -- Lua support
        "yamlls", -- Yaml support
        "templ", -- Golang Templates support
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
      ensure_installed = {}, -- Tools to install
    })

    local yaml_companion = require("yaml-companion").setup({})
    require("lspconfig").yamlls.setup(vim.tbl_deep_extend("force", yaml_companion, {
      capabilities = {
        textDocument = {
          foldingRange = {
            dynamicRegistration = false,
            lineFoldingOnly = true,
          },
        },
      },
    }))
  end,
}
