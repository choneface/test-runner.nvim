local M = {}

function M.run(cmd)
		local buf = vim.api.nvim_create_buf(false, true)
		vim.api.nvim_buf_set_option(buf, 'modifiable', false)

		local win = vim.api.nvim_open_win(buf, true, {
			split = 'right'
		})

		vim.cmd.terminal(cmd)

		vim.keymap.set('n', 'q', function()
			vim.api.nvim_win_close(win, false)
		end, {buffer = buf})
end

return M
