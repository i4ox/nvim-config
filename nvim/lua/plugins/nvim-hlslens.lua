return {
	"kevinhwang91/nvim-hlslens",
	branch = "main",
	keys = { "*", "#", "n", "N" },
	config = function()
		local api = vim.api
		local keymap = vim.keymap.set

		local hlslens = require("hlslens")

		hlslens.setup({
			calm_down = true,
			nearest_only = true,
		})

		local activate_hlslens = function(direction)
			local cmd = string.format("normal! %s%szzzv", vim.v.count1, direction)
			local status, msg = pcall(vim.cmd, cmd)

			if not status then
				local start_idx, _ = string.find(msg, "E486", 1, true)
				local msg_part = string.sub(msg, start_idx)
				api.nvim_err_writeln(msg_part)
				return
			end

			hlslens.start()
		end

		keymap("n", "n", "", {
			callback = function()
				activate_hlslens("n")
			end,
		})

		keymap("n", "N", "", {
			callback = function()
				activate_hlslens("N")
			end,
		})

		local check_cursor_word = function()
			local cursor_word = vim.fn.expand("<cword>")
			local result = cursor_word == ""
			if result then
				local msg = "E348: No string under cursor"
				api.nvim_err_writeln(msg)
			end

			return result, cursor_word
		end

		keymap("n", "*", "", {
			callback = function()
				local cursor_word_empty, cursor_word = check_cursor_word()
				if cursor_word_empty then
					return
				end

				local cmd = string.format([[normal! /\v<%s>]], cursor_word)

				local escaped_enter = vim.api.nvim_replace_termcodes("<CR>", true, false, true)

				local full_cmd = cmd .. escaped_enter .. "N"
				vim.fn.execute(full_cmd)
				hlslens.start()
			end,
		})
		keymap("n", "#", "", {
			callback = function()
				local cursor_word_empty, cursor_word = check_cursor_word()
				if cursor_word_empty then
					return
				end

				local cmd = string.format([[normal! ?\v<%s>]], cursor_word)
				local escaped_enter = vim.api.nvim_replace_termcodes("<CR>", true, false, true)

				local full_cmd = cmd .. escaped_enter .. "N"
				vim.fn.execute(full_cmd)
				hlslens.start()
			end,
		})
	end,
}
