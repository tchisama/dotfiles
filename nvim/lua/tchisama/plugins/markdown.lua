return {
	"MeanderingProgrammer/render-markdown.nvim",
	dependencies = { "echasnovski/mini.nvim" }, -- if you use the mini.nvim suite
	-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
	-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
	---@module 'render-markdown'
	---@type render.md.UserConfig
	opts = {},
	config = function()
		require("render-markdown").setup({
			heading = {
				sign = true,
				position = "inline",
				border = true,
			},
			pipe_table = { preset = "round" },
			sign = {
				enabled = true,
				highlight = "RenderMarkdownSign",
			},
			indent = { enabled = true },
		})
	end,
}
