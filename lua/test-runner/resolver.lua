local M = {}

local fs = require("test-runner.util.fs")
local detectors = {
	require("test-runner.detectors.cargo")
}

local function build_ctx()
	local function has(file_name)
		return fs.file_exists(file_name)
	end

	return { has = has }
end

local function choose_best(results)
	table.sort(results, function(a, b)
		return a.score > b.score
	end)
	return results[1]
end

function M.resolve()
	local ctx = build_ctx()

	local results = {}
	for _, det in ipairs(detectors) do
		local res = det.detect(ctx)
		table.insert(results, res)
	end
	local best_command = choose_best(results).cmd

	if not best_command then
		best_command = { "echo", "No test harness found" }
	end
	return best_command

end
return M
