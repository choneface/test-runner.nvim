local M = {}

function M.setup()
	-- TestRunner command
	vim.api.nvim_create_user_command('TestRunner', function()
		local buf = vim.api.nvim_create_buf(false, true)
		local win = vim.api.nvim_open_win(buf, true, {
			split = 'right'
		})

		vim.keymap.set('n', 'q', function()
			vim.api.nvim_win_close(win, false)
		end, {buffer = buf})
	end, {})

	-- Setup the keybinding to run the command
	vim.keymap.set('n', '<leader>tr', '<cmd>TestRunner<CR>', { noremap = true, silent = true, desc = "Run tests in TestRunner" })
end

return M
