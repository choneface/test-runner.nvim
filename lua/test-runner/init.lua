local M = {}

local term = require("test-runner.term")
local resolver = require("test-runner.resolver")

function M.setup()
	vim.api.nvim_create_user_command('TestRunner', function()
		local cmd = resolver.resolve()
		term.run(cmd)
	end, {})

	vim.keymap.set('n', '<leader>tr', '<cmd>TestRunner<CR>', { noremap = true, silent = true, desc = "Run tests in TestRunner" })
end

return M
