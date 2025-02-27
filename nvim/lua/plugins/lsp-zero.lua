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
      local map = vim.keymap.set

      map("n", "<leader>ca", vim.lsp.buf.code_action, vim.tbl_deep_extend("force", opts, { desc = "Code action" }))
      map("n", "<leader>cr", vim.lsp.buf.rename, vim.tbl_deep_extend("force", opts, { desc = "Rename" }))
      map("n", "K", vim.lsp.buf.hover, vim.tbl_deep_extend("force", opts, { desc = "Hover" }))
      map("n", "gK", vim.lsp.buf.signature_help, vim.tbl_deep_extend("force", opts, { desc = "Signature help" }))
      map("n", "<c-k>", vim.lsp.buf.signature_help, vim.tbl_deep_extend("force", opts, { desc = "Signature help" }))
      map("n", "gd", vim.lsp.buf.definition, vim.tbl_deep_extend("force", opts, { desc = "Definition" }))
      map("n", "gD", vim.lsp.buf.declaration, vim.tbl_deep_extend("force", opts, { desc = "Declaration" }))
      map("n", "gI", vim.lsp.buf.implementation, vim.tbl_deep_extend("force", opts, { desc = "Implementation" }))
      map("n", "gr", vim.lsp.buf.references, vim.tbl_deep_extend("force", opts, { desc = "References" }))
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
      capabilities = vim.tbl_deep_extend(
        'force',
        vim.lsp.protocol.make_client_capabilities(),
        require('cmp_nvim_lsp').default_capabilities(),
        {
          workspace = {
            -- PERF: didChangeWatchedFiles is too slow.
            -- TODO: Remove this when https://github.com/neovim/neovim/issues/23291#issuecomment-1686709265 is fixed.
            didChangeWatchedFiles = { dynamicRegistration = false },
          },
        }
      ),
      sign_text = {
        error = " ",
        warn = " ",
        hint = " ",
        info = " ",
      },
    })
  end,
}
