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
        "css_variables", -- CSS Variables support
        "cssmodules_ls", -- CSS Modules support
        "dockerls", -- Docker support
        "gopls", -- Golang support
        "html", -- HTML support
        "jsonls", -- JSON support
        "lemminx", -- XML support
        "lua_ls", -- Lua support
        "marksman", -- Markdown support
        "pyright", -- Python support
        "tailwindcss", -- Tailwind CSS support
        "ts_ls", -- Typescript support
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
      ensure_installed = {}, -- Tools to install
    })

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
