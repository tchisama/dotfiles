return {
	{
		"folke/tokyonight.nvim",
		priority = 100000, -- Ensure this loads before other plugins
		config = function()
			local bg = "#0D1117" -- GitHub Dark background
			local bg_dark = "#161B22"
			local bg_highlight = "#21262D"
			local bg_search = "#2F81F7"
			local bg_visual = "#264F78"
			local fg = "#C9D1D9" -- GitHub Dark foreground
			local fg_dark = "#B1BAC4"
			local fg_gutter = "#484F58"
			local border = "#30363D"

			require("tokyonight").setup({
				style = "night",
				on_colors = function(colors)
					colors.bg = bg
					colors.bg_dark = bg_dark
					colors.bg_float = bg_dark
					colors.bg_highlight = bg_highlight
					colors.bg_popup = bg_dark
					colors.bg_search = bg_search
					colors.bg_sidebar = bg_dark
					colors.bg_statusline = bg_dark
					colors.bg_visual = bg_visual
					colors.border = border
					colors.fg = fg
					colors.fg_dark = fg_dark
					colors.fg_float = fg
					colors.fg_gutter = fg_gutter
					colors.fg_sidebar = fg_dark
				end,
			})
			-- Load the colorscheme
			vim.cmd([[colorscheme tokyonight]])
		end,
	},
}
