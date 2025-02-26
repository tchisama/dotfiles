local M = {}

M.run_selected_js = function()
	-- Force Neovim to update the visual selection markers
	vim.cmd("normal! gv") -- Reselect the last visual selection

	-- Get the selected text
	local start_line = vim.fn.line("'<")
	local end_line = vim.fn.line("'>")
	local lines = vim.fn.getline(start_line, end_line)
	local selected_code = table.concat(lines, "\n")

	-- Debug: Print the selected code to verify
	-- print("Selected Code:\n" .. selected_code)

	-- Write the selected code to a temporary file
	local temp_file = os.tmpname() .. ".js"
	local file = io.open(temp_file, "w")
	if not file then
		vim.api.nvim_err_writeln("Failed to create temporary file")
		return
	end
	file:write(selected_code)
	file:close()

	-- Run the JavaScript code using Node.js
	local handle = io.popen("node " .. temp_file)
	if not handle then
		vim.api.nvim_err_writeln("Failed to execute the code")
		os.remove(temp_file) -- Clean up the temporary file
		return
	end

	-- Read the result
	local result = handle:read("*a")
	handle:close()

	-- Print the result in the command line
	vim.api.nvim_echo({ { result, "Normal" } }, true, {})

	-- Clean up the temporary file
	os.remove(temp_file)
end

M.setup = function()
	-- Setup function (optional)
end

return M
