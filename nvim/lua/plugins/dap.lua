return {
	"rcarriga/nvim-dap-ui",
	dependencies = {
		{ "mfussenegger/nvim-dap" },
		{ "leoluz/nvim-dap-go" },
		{ "nvim-neotest/nvim-nio" },
	},
	config = function()
		require("dapui").setup()
		require("dap-go").setup()
		vim.fn.sign_define(
			"DapBreakpoint",
			{ text = " ", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
		)
	end,
}
