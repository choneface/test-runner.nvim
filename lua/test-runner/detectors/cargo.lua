local M = {}

function M.detect(ctx)
		local exists = ctx.has("Cargo.toml")
		print(exists)
		if exists then
			return { cmd = {"cargo", "test"}, score = 100 }
		else
			return { score = -1 }
		end
end

return M
