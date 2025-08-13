local M = {}

local function open_test_runner(cmd)
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

local function file_exists(file)
	local stat = vim.uv.fs_stat(file)
	return stat ~= nil
end

function M.setup()
	-- TestRunner command
	vim.api.nvim_create_user_command('TestRunner', function()
		local exists = file_exists("Cargo.toml")
		local cmd = {}
		if exists then
			cmd = {"cargo", "test"}
		else
			cmd = {"echo", "no test harness found"}
		end
		open_test_runner(cmd)
	end, {})

	-- Setup the keybinding to run the command
	vim.keymap.set('n', '<leader>tr', '<cmd>TestRunner<CR>', { noremap = true, silent = true, desc = "Run tests in TestRunner" })
end

return M
