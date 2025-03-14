local keymap = vim.keymap.set

-- Quit
keymap("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit All" })

-- Lazy
keymap("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })

-- Oil
keymap("n", "-", "<cmd>Oil<cr>", { desc = "Open parent directory" })

-- Better Up & Down
keymap({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
keymap({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
keymap({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })
keymap({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })

-- Window with Tmux integration
keymap("n", "<C-h>", "<cmd>TmuxNavigateLeft<cr>", { desc = "Go to Left Window", remap = true })
keymap("n", "<C-j>", "<cmd>TmuxNavigateDown<cr>", { desc = "Go to Lower Window", remap = true })
keymap("n", "<C-k>", "<cmd>TmuxNavigateUp<cr>", { desc = "Go to Upper Window", remap = true })
keymap("n", "<C-l>", "<cmd>TmuxNavigateRight<cr>", { desc = "Go to Right Window", remap = true })

keymap("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
keymap("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
keymap("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
keymap("n", "]b", "<cmd>bnext<cr>", { desc = "Next Buffer" })
keymap("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
keymap("n", "<leader>`", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
keymap("n", "<leader>bd", function()
	Snacks.bufdelete()
end, { desc = "Delete Buffer" })
keymap("n", "<leader>bo", function()
	Snacks.bufdelete.other()
end, { desc = "Delete Other Buffers" })
keymap("n", "<leader>bD", "<cmd>:bd<cr>", { desc = "Delete Buffer and Window" })

-- TODO: Terminal

-- Search with `n` and `N` by default
keymap("n", "n", "'Nn'[v:searchforward].'zv'", { expr = true, desc = "Next Search Result" })
keymap("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
keymap("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
keymap("n", "N", "'nN'[v:searchforward].'zv'", { expr = true, desc = "Prev Search Result" })
keymap("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })
keymap("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })

-- Save key strokes
keymap({ "n", "x" }, ";", ":", { desc = "Save key strokes" })

-- New file
keymap("n", "<leader>fs", "<cmd>w<cr>", { desc = "Save File" })
keymap("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })

-- Continuous visual shifting to reselect previous visual area
keymap("x", "<", "<gv", { desc = "Visual shifting to left side" })
keymap("x", ">", ">gv", { desc = "Visual shiftint to right side" })

-- Move current line up and down
keymap("v", "K", ":m '<-2<CR>gv=gv", { silent = true, desc = "Move current line up" })
keymap("v", "J", ":m '>+1<CR>gv=gv", { silent = true, desc = "Move current line down" })

-- Always use very magic mode for searching
keymap("n", "/", [[/\v]], { desc = "Searching with very magic mode" })

-- Copy entire buffer
keymap("n", "<leader>y", "<cmd>%yank<cr>", { desc = "Yank entire buffer" })

-- Location List
keymap("n", "<leader>xl", function()
	local success, err = pcall(vim.fn.getloclist(0, { winid = 0 }).winid ~= 0 and vim.cmd.lclose or vim.cmd.lopen)
	if not success and err then
		vim.notify(err, vim.log.levels.ERROR)
	end
end, { desc = "Location List" })

-- Quickfix list
keymap("n", "<leader>xq", function()
	local success, err = pcall(vim.fn.getqflist({ winid = 0 }).winid ~= 0 and vim.cmd.cclose or vim.cmd.copen)
	if not success and err then
		vim.notify(err, vim.log.levels.ERROR)
	end
end, { desc = "Quickfix List" })

keymap("n", "[q", vim.cmd.cprev, { desc = "Previous Quickfix" })
keymap("n", "]q", vim.cmd.cnext, { desc = "Next Quickfix" })

-- Diagnostic
local diagnostic_goto = function(next, severity)
	local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
	severity = severity and vim.diagnostic.severity[severity] or nil
	return function()
		go({ severity = severity })
	end
end
keymap("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
keymap("n", "]d", diagnostic_goto(true), { desc = "Next Diagnostic" })
keymap("n", "[d", diagnostic_goto(false), { desc = "Prev Diagnostic" })
keymap("n", "]e", diagnostic_goto(true, "ERROR"), { desc = "Next Error" })
keymap("n", "[e", diagnostic_goto(false, "ERROR"), { desc = "Prev Error" })
keymap("n", "]w", diagnostic_goto(true, "WARN"), { desc = "Next Warning" })
keymap("n", "[w", diagnostic_goto(false, "WARN"), { desc = "Prev Warning" })

-- Toggle inlay hints
keymap("n", "<leader>ch", function()
	local bufnr = vim.api.nvim_get_current_buf()
	local enabled = vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr })
	vim.lsp.inlay_hint.enable(not enabled)
end, { desc = "Toggle Inlay Hints" })

-- Telescope
keymap("n", "<leader>:", "<cmd>Telescope command_history<cr>", { desc = "Command History" })
keymap("n", "<leader>fy", "<cmd>Telescope yaml_schema<cr>", { desc = "YAML Schemas" })
-- find
keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find File" })
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Live Grep" })
keymap(
	"n",
	"<leader>fb",
	"<cmd>Telescope buffers sort_mru=true sort_lastused=true ignore_current_buffer=true<cr>",
	{ desc = "Buffers" }
)
keymap("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Recent Files" })
-- git
keymap("n", "<leader>gc", "<cmd>Telescope git_commits<cr>", { desc = "Git Commits" })
keymap("n", "<leader>gs", "<cmd>Telescope git_status<cr>", { desc = "Git Status" })
-- search
keymap("n", '<leader>s"', "<cmd>Telescope registers<cr>", { desc = "Registers" })
keymap("n", "<leader>sa", "<cmd>Telescope autocommands<cr>", { desc = "Autocommands" })
keymap("n", "<leader>sb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", { desc = "Buffers" })
keymap("n", "<leader>sd", "<cmd>Telescope diagnostics bufnr=0<cr>", { desc = "Diagnostics" })
keymap("n", "<leader>sD", "<cmd>Telescope diagnostics<cr>", { desc = "Diagnostics" })
keymap("n", "<leader>sh", "<cmd>Telescope help_tags<cr>", { desc = "Help" })
keymap("n", "<leader>sH", "<cmd>Telescope highlights<cr>", { desc = "Highlights" })
keymap("n", "<leader>sj", "<cmd>Telescope jumplist<cr>", { desc = "Jumplist" })
keymap("n", "<leader>sk", "<cmd>Telescope keymaps<cr>", { desc = "Keymaps" })
keymap("n", "<leader>sl", "<cmd>Telescope loclist<cr>", { desc = "Loclist" })
keymap("n", "<leader>sM", "<cmd>Telescope man_pages<cr>", { desc = "Man Pages" })
keymap("n", "<leader>sm", "<cmd>Telescope marks<cr>", { desc = "Marks" })
keymap("n", "<leader>sq", "<cmd>Telescope quickfix<cr>", { desc = "Quickfix" })
keymap("n", "<leader>ss", "<cmd>Namu symbols<cr>", {
	desc = "Jump to LSP symbol",
	silent = true,
})

-- Debugger
keymap("n", "<leader>dt", "<cmd>lua require('dapui').toggle()<cr>", { noremap = true, desc = "Toggle Debug Toolbar" })
keymap("n", "<leader>db", "<cmd>DapToggleBreakpoint<cr>", { noremap = true, desc = "Toggle Breakpoint" })
keymap("n", "<leader>dc", "<cmd>DapContinue<cr>", { noremap = true, desc = "Continue" })
keymap("n", "<leader>dr", "<cmd>lua require('dapui').open({reset = true})<cr>", { noremap = true, desc = "Reset" })

-- Tests
keymap("n", "<leader>tt", "<cmd>lua require('neotest').run.run()<cr>", { desc = "Run Nearest Test" })
keymap("n", "<leader>tf", "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", { desc = "Run File" })
keymap("n", "<leader>ts", "<cmd>lua require('neotest').summary.toggle()<cr>", { desc = "Toggle Summary" })
keymap("n", "<leader>to", "<cmd>lua require('neotest').output.open({ enter = true })<cr>", { desc = "Show Output" })
keymap("n", "<leader>tO", "<cmd>lua require('neotest').output_panel.toggle()<cr>", { desc = "Toggle Output Panel" })
keymap("n", "<leader>tS", "<cmd>lua require('neotest').run.stop()<cr>", { desc = "Stop" })
keymap("n", "[t", "<cmd>lua require('neotest').jump.prev({ status = 'failed' })<cr>", { desc = "Previous Failed Test" })
keymap("n", "]t", "<cmd>lua require('neotest').jump.next({ status = 'failed' })<cr>", { desc = "Next Failed Test" })

-- Hunks
local gs = require("gitsigns")
keymap({ "n", "v" }, "<leader>ghs", "<cmd>Gitsigns stage_hunk<CR>", { desc = "Stage Hunk" })
keymap({ "n", "v" }, "<leader>ghr", "<cmd>Gitsigns reset_hunk<CR>", { desc = "Reset Hunk" })
keymap("n", "<leader>ghS", gs.stage_buffer, { desc = "Stage Buffer" })
keymap("n", "<leader>ghu", gs.undo_stage_hunk)
keymap("n", "<leader>ghR", gs.reset_buffer, { desc = "Reset Buffer" })
keymap("n", "<leader>ghp", gs.preview_hunk, { desc = "Preview Hunk" })
keymap("n", "<leader>ghb", function()
	gs.blame_line({ full = true })
end, { desc = "Blame" })
keymap("n", "<leader>gtB", gs.toggle_current_line_blame, { desc = "Toggle Blame" })
keymap("n", "<leader>ghd", gs.diffthis, { desc = "Diff" })
keymap("n", "<leader>ghD", function()
	gs.diffthis("~")
end, { desc = "Diff with Previous" })
