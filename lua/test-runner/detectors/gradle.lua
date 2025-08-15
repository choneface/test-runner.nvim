local M = {}

function M.detect(ctx)
	local has_gradle = ctx.has("build.gradle") or ctx.has("build.gradle.kts")
	if has_gradle then
		return {
			cmd = { "./gradlew", "test" },
			score = 100
		}
	else
		return { score = -1 }
	end
end

return M
