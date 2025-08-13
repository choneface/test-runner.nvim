local M = {}

local term = require("test-runner.util.term")
local fs = require("test-runner.util.fs")

function M.setup()
	-- TestRunner command
	vim.api.nvim_create_user_command('TestRunner', function()
		local exists = fs.file_exists("Cargo.toml")
		local cmd = {}
		if exists then
			cmd = {"cargo", "test"}
		else
			cmd = {"echo", "no test harness found"}
		end
		term.run(cmd)
	end, {})

	-- Setup the keybinding to run the command
	vim.keymap.set('n', '<leader>tr', '<cmd>TestRunner<CR>', { noremap = true, silent = true, desc = "Run tests in TestRunner" })
end

return M
