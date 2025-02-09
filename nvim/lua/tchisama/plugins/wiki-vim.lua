-- lua/plugins/wiki.lua
return {
	{
		"lervag/wiki.vim",
		lazy = true,
		ft = { "wiki", "md", "markdown" },
		init = function()
			-- Set wiki root directory
			vim.g.wiki_root = "~/wiki"

			-- Basic configuration
			vim.g.wiki_filetypes = { "md" } -- Use markdown files
			vim.g.wiki_link_target_type = "md"

			-- Enable link creation and following
			vim.g.wiki_mappings_use_defaults = 1
			vim.g.wiki_map_create_page = 1

			-- Link settings
			vim.g.wiki_link_extension = ".md"
			vim.g.wiki_link_target_type = "md"

			-- Additional mappings for link handling
			vim.api.nvim_create_autocmd("FileType", {
				pattern = { "markdown", "wiki" },
				callback = function()
					-- Map Enter to follow/create wiki links
					vim.api.nvim_buf_set_keymap(0, "n", "<CR>", "<Plug>(wiki-link-follow)", { silent = true })
					-- Map backspace to go back
					vim.api.nvim_buf_set_keymap(0, "n", "<BS>", "<Plug>(wiki-link-return)", { silent = true })
				end,
			})
		end,
		keys = {
			{ "<leader>ww", "<cmd>WikiIndex<CR>", desc = "Open Wiki index" },
			{ "<leader>wn", "<cmd>WikiJournalNew<CR>", desc = "Create new journal entry" },
			-- Additional convenient mappings
			{ "<leader>wf", "<cmd>WikiFzfPages<CR>", desc = "Find wiki pages" },
			{ "<leader>wr", "<cmd>WikiFzfTags<CR>", desc = "Find wiki tags" },
		},
	},
}
