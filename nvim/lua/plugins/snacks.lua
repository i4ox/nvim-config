return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		input = { enabled = true },
		indent = {
			enabled = true,
			filter = function(buf)
				return vim.b[buf].snacks_indent ~= false
					and vim.bo.filetype ~= "markdown"
					and vim.bo.filetype ~= "oil"
					and vim.bo.filetype ~= "oil_preview"
					and vim.bo.filetype ~= "lazy"
					and vim.bo.filetype ~= "mason"
					and vim.bo[buf].filetype ~= "wk"
					and vim.bo.filetype ~= "noice"
					and vim.bo.filetype ~= "trouble"
					and vim.bo.filetype ~= "neotest-output"
					and vim.bo.filetype ~= "TelescopePrompt"
			end,
		},
		notifier = { enabled = true },
		scope = { enabled = true },
		scroll = { enabled = true },
		words = { enabled = true },
		dashboard = {
			preset = {
				header = [[
    \o__ __o                   \o/                                      
    /      \\                   |                                       
  />       <\                  / \               \/                     
 o/               |o__ __o/    \o/    \o__ __o/   |__ __o     \o__ __o/ 
 <|      _\__o_   /       \     |     /      |    o     |>    /      |  
 \\          |   />       /\   / \   />     / \  /     / \   />     / \ 
   \         /   \         /   \o/   \      \o/  \o    \o/   \      \o/ 
    o       o     o       o     |__   o      |  __|\    |__   o      |  
    <\__ __/\     /\__ __/\     |     <\__  / \    \    /     <\__  < > 
                                                                     |  
                                                             o__     o  
                                                             <\__ __/>  
        ]],
				keys = {
					{ icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
					{ icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
					{
						icon = " ",
						key = "g",
						desc = "Find Text",
						action = ":lua Snacks.dashboard.pick('live_grep')",
					},
					{
						icon = " ",
						key = "r",
						desc = "Recent Files",
						action = ":lua Snacks.dashboard.pick('oldfiles')",
					},
					{
						icon = " ",
						key = "c",
						desc = "Config",
						action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
					},
					{ icon = " ", key = "s", desc = "Restore Session", section = "session" },
					{ icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
					{ icon = " ", key = "q", desc = "Quit", action = ":qa" },
				},
			},
		},
	},
}
