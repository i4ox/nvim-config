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
    vim.cmd[[colorscheme tokyonight]]
    require("transparent").clear_prefix("Snacks")
    require("transparent").clear_prefix("Telescope")
    require("transparent").clear_prefix("Float")
    require("transparent").clear_prefix("Cmp")
    require("transparent").clear_prefix("Trouble")
  end,
}
