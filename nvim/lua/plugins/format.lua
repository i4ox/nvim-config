return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    formatters_by_ft = {
      go = { "goimports-reviser", "gofumpt", stop_after_first = true },
      lua = { "stylua" },
    },
    format_on_save = {
      async = false,
      timeout_ms = 500,
      lsp_fallback = true,
    },
  },
}
