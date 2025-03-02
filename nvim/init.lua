require("tchisama.core")
require("tchisama.lazy")

-- local scheme_file = vim.fn.stdpath("config") .. "/colorscheme.txt"
-- if vim.fn.filereadable(scheme_file) == 1 then
-- 	local scheme = vim.fn.readfile(scheme_file)[1]
-- 	if scheme then
-- 		vim.cmd("colorscheme " .. scheme)
-- 	end
-- end
--
--
vim.g.neovide_scale_factor = 0.5
-- Helper function for transparency formatting
local alpha = function()
	return string.format("%x", math.floor(255 * vim.g.transparency or 0.8))
end
-- g:neovide_opacity should be 0 if you want to unify transparency of content and title bar.
vim.g.neovide_opacity = 0.0
vim.g.transparency = 0.8
vim.g.neovide_background_color = "#0f1117" .. alpha()
