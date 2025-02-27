return {
  "echasnovski/mini.icons",
  lazy = true,
  init = function()
    package.preload["nvim-web-devicons"] = function()
      require("mini.icons").mock_nvim_web_devicons()
      return package.loaded["nvim-web-devicons"]
    end
  end,
  config = function()
    require("mini.icons").setup {
      file = {
        [".keep"] = { glyph = "", hl = "MiniIconsGrey" },
        ["devcontainer.json"] = { glyph = "", hl = "MiniIconsAzure" },
        ["go.mod"] = { glyph = "", hl = "MiniIconsBlue" },
				["go.sum"] = { glyph = "", hl = "MiniIconsBlue" },
      },
      filetype = {
        dotenv = { glyph = "", hl = "MiniIconsYellow" },
        markdown = { glyph = "", hl = "MiniIconsBlue" },
        sql = { glyph = "󰆼", hl = "MiniIconsRed" },
        typescript = { glyph = "", hl = "MiniIconsBlue" },
				javascript = { glyph = "", hl = "MiniIconsYellow" },
				go = { glyph = "", hl = "MiniIconsBlue" },
      },
    }
  end,
}
