return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 500
	end,
	opts = {
		position = { "bottom", "right" }, -- Position the window at the bottom right
		layout = {
			align = "right", -- Align the items to the right
			width = { min = 20, max = 50 }, -- Set minimum and maximum width
			height = { min = 5, max = 10 }, -- Set minimum and maximum height
		},
	},
}
