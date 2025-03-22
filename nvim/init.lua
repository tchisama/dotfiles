require("tchisama.core")
require("tchisama.lazy")

vim.o.termguicolors = true
vim.opt.guifont = "Hack Nerd Font:h12"

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

-- Default options:
require("gruvbox").setup({
	terminal_colors = true, -- add neovim terminal colors
	undercurl = true,
	underline = true,
	bold = true,
	italic = {
		strings = true,
		emphasis = true,
		comments = true,
		operators = false,
		folds = true,
	},
	strikethrough = true,
	invert_selection = false,
	invert_signs = false,
	invert_tabline = false,
	invert_intend_guides = false,
	inverse = true, -- invert background for search, diffs, statuslines and errors
	contrast = "", -- can be "hard", "soft" or empty string
	palette_overrides = {},
	overrides = {},
	dim_inactive = false,
	transparent_mode = false,
})
vim.cmd("colorscheme gruvbox")

require("spellwarn").setup({
	event = { -- event(s) to refresh diagnostics on
		"CursorHold",
		"InsertLeave",
		"TextChanged",
		"TextChangedI",
		"TextChangedP",
	},
	enable = true, -- enable diagnostics on startup
	ft_config = { -- spellcheck method: "cursor", "iter", or boolean
		alpha = false,
		help = false,
		lazy = false,
		lspinfo = false,
		mason = false,
	},
	ft_default = true, -- default option for unspecified filetypes
	max_file_size = nil, -- maximum file size to check in lines (nil for no limit)
	severity = { -- severity for each spelling error type (false to disable diagnostics for that type)
		spellbad = "WARN",
		spellcap = "HINT",
		spelllocal = "HINT",
		spellrare = "INFO",
	},
	prefix = "possible misspelling(s): ", -- prefix for each diagnostic message
	diagnostic_opts = { severity_sort = true }, -- options for diagnostic display
})
