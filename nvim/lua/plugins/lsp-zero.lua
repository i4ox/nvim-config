return {
  "VonHeikemen/lsp-zero.nvim",
  priority = 900,
  dependencies = {
    "neovim/nvim-lspconfig",
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    local lsp_zero = require "lsp-zero"

    local lsp_attach = function(_, bufnr)
      local opts = { buffer = bufnr, remap = false }

      -- TODO: add keymaps for lsp-zero
    end

    vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
      underline = true,
      update_in_insert = true,
      virtual_text = {
        spacing = 4,
        severity = { min = vim.diagnostic.severity.WARN },
      },
    })

    vim.diagnostic.config({
      float = { border = "rounded" },
    })

    lsp_zero.extend_lspconfig({
      lsp_attach = lsp_attach,
      capabilities = require("cmp_nvim_lsp").default_capabilities(),
      sign_text = {
        error = " ",
        warn = " ",
        hint = " ",
        info = " ",
      },
    })
  end,
}
