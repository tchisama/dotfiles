return {
	"chentoast/marks.nvim",
	event = "VeryLazy",
	opts = {
		-- relative numbers
		relative = true,
		builtin_marks = { ".", "<", ">", "^", "0", "$", "m", "M", "t", "T" },
		bookmark_0 = {
			sign = "⚑",
			virt_text = "Bookmark 0",
			annotate = false,
		},
	},
}
