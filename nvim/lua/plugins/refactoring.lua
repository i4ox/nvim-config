return {
  "ThePrimeagen/refactoring.nvim",
  event = "BufReadPre",
  config = function()
    require("refactoring").setup({})
    local map = vim.keymap.set
    map("x", "<leader>re", "<cmd>Refactor extract<cr>")
    map("x", "<leader>rf", "<cmd>Refactor extract_function<cr>")
    map("x", "<leader>rv", "<cmd>Refactor extract_var<cr>")
    map({ "n", "x" }, "<leader>ri", "<cmd>Refactor inline<cr>")
    map( "n", "<leader>rI", "<cmd>Refactor inline_recursive<cr>")
    map("n", "<leader>rb", "<cmd>Refactor extract_block<cr>")
    map("n", "<leader>rbf", "<cmd>Refactor extract_block_function<cr>")
  end,
}
