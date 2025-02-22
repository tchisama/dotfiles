-- nvim v0.8.0
return {
	"kdheepak/lazygit.nvim",
	lazy = true,
	cmd = {
		"lazygit",
		"lazygitconfig",
		"lazygitcurrentfile",
		"lazygitfilter",
		"lazygitfiltercurrentfile",
	},
	-- optional for floating window border decoration
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	-- setting the keybinding for lazygit with 'keys' is recommended in
	-- order to load the plugin when the command is run for the first time
	keys = {
		{ "<leader>lg", "<cmd>lazygit<cr>", desc = "lazygit" },
	},
}
