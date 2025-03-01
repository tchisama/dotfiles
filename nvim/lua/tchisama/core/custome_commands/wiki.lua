local M = {}

-- Insert TODO template
function M.todo_temp()
	local date = os.date("%d-%m-%Y")
	local template = {
		"#  " .. date .. " TODO",
		"",
		"---",
		"##  Tasks",
		"",
		"---",
		"##  Done",
		"",
		"---",
		"## 󰠮 Notes",
	}
	vim.api.nvim_buf_set_lines(0, vim.fn.line("."), vim.fn.line("."), false, template)
end

-- Insert TODO
function M.insert_todo()
	local line = "- [ ] TODO: "
	vim.api.nvim_put({ line }, "l", true, true)
	vim.api.nvim_feedkeys("A", "n", false)
end

-- Toggle TODO
function M.toggle_todo()
	local line = vim.api.nvim_get_current_line()
	if line:match("%[x%]") then
		vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("0ci[ <Esc>t:x", true, true, true), "n", false)
		-- move it to the done section
		vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("ddgg/Tasks<CR>p", true, true, true), "n", false)
	elseif line:match("%[ %]") then
		vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("0ci[x<Esc>t:a <Esc>", true, true, true), "n", false)
		-- move it to the tasks section
		vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("ddgg/Done<CR>p", true, true, true), "n", false)
	end
end

function M.filter_todos_by_tag(tag)
	local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
	local filtered_lines = {}
	for _, line in ipairs(lines) do
		if line:match("#" .. tag) then
			table.insert(filtered_lines, line)
		end
	end
	if #filtered_lines > 0 then
		local buf = vim.api.nvim_create_buf(false, true)
		vim.api.nvim_buf_set_lines(buf, 0, -1, false, filtered_lines)
		vim.api.nvim_set_current_buf(buf)
	else
		print("No TODOs found with tag: " .. tag)
	end
end

return M
