-- This is my personal NeoVim configuration supporting Linux, and maybe Windows and Mac, with various plugins configured.
-- This configuration evolves as I learn more about NeoVim and become more proficient in using NeoVim.
-- I would not recommend cloning this configuration and replace your own config. Good configuration are personal, build over time with a lot of polish
--
-- Author: Arthur Lokhov
-- Email: arthurlokhov@gmail.com
-- GitHub: https://github.com/i4ox

-- Enable lazy loading for modules
vim.loader.enable()

-- Compare the actual and expected versions
local expected_version = "0.10.4"
require("utils").is_compatible_version(expected_version)

-- Load global settings
require("globals")

-- Load options
require("options")

-- Load lazy plugin manager
require("lazy-loader")

-- Load autocmds
require("autocmds")

-- Load keymaps
require("keymaps")

-- Load custom statusline
require("custom.statusline")
