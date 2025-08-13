local M = {}

function M.setup()
	vim.api.nvim_create_user_command('TestRunner', function()
		local buf = vim.api.nvim_create_buf(false, true)
		local win = vim.api.nvim_open_win(buf, true, {
			split = 'right'
		})

		vim.keymap.set('n', 'q', function()
			vim.api.nvim_win_close(win, false)
		end, {buffer = buf})
	end, {})
end

return M
