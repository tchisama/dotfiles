return {
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		-- specify the branch to use
		branch = "main",
		dependencies = {
			{ "github/copilot.vim" }, -- or zbirenbaum/copilot.lua
			{ "nvim-lua/plenary.nvim" }, -- required for async operations
		},
		build = "make tiktoken", -- Only on MacOS or Linux
		opts = {
			-- Default model to use
			model = "gpt-4",

			-- Default system prompt
			system_prompt = "You are a helpful assistant that explains, reviews, and fixes code.",

			-- Custom prompts
			prompts = {
				Refactor = {
					prompt = "Refactor the selected code to improve readability and maintainability.",
					mapping = "<leader>crf", -- Custom keybinding for refactoring
					description = "Refactor selected code",
				},
				Debug = {
					prompt = "Help me debug the selected code. Identify potential issues and suggest fixes.",
					mapping = "<leader>cdb", -- Custom keybinding for debugging
					description = "Debug selected code",
				},
				Docs = {
					prompt = "Generate detailed documentation for the selected code.",
					mapping = "<leader>cdoc", -- Custom keybinding for generating docs
					description = "Generate documentation for selected code",
				},
				ExplainSimple = {
					prompt = "Explain the selected code in simple terms, as if I'm a beginner.",
					mapping = "<leader>ces", -- Custom keybinding for simple explanation
					description = "Explain code in simple terms",
				},
			},

			-- Enable auto-follow cursor in the chat window
			auto_follow_cursor = true,

			-- Show help message in the chat window
			show_help = true,
		},
		event = "VeryLazy", -- Lazy load the plugin
	},
}
