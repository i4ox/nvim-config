return {
	"yetone/avante.nvim",
	enabled = true,
	build = "make",
	event = "VeryLazy",
	version = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		"MunifTanjim/nui.nvim",
		"nvim-telescope/telescope.nvim",
		"hrsh7th/nvim-cmp",
		"stevearc/dressing.nvim",
		"nvim-tree/nvim-web-devicons",
		{
			"HakonHarnes/img-clip.nvim",
			opts = {
				default = {
					embed_image_as_base64 = false,
					prompt_for_file_name = false,
					use_absolute_path = true,
				},
			},
		},
	},
	opts = {
		provider = "ollama",
		ollama = {
			model = "mistral",
		},
		cursor_planning_mode = true,
	},
}
