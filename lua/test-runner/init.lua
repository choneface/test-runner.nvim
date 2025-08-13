local M = {}

function M.setup()
	vim.api.nvim_create_user_command('TestRunner', function()
		print("Hello from the test function")
	end, {})
end

return M
