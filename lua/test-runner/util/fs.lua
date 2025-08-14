local M = {}

function M.file_exists(file)
	local stat = vim.uv.fs_stat(file)
	return stat ~= nil
end

return M
