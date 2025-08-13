local M = {}
local fs = require("test-runner.util.fs")

function M.resolve()
		local exists = fs.file_exists("Cargo.toml")
		local cmd = {}
		if exists then
			cmd = {"cargo", "test"}
		else
			cmd = {"echo", "no test harness found"}
		end
		return cmd
end
return M
