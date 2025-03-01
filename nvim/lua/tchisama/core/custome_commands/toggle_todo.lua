local M = {}

function M.toggle_todo()
	local line = vim.api.nvim_get_current_line()
	if line:match("%[x%]") then
		vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("0ci[ <Esc>t:x", true, true, true), "n", false)
	elseif line:match("%[ %]") then
		vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("0ci[x<Esc>t:a <Esc>", true, true, true), "n", false)
	end
end

return M
