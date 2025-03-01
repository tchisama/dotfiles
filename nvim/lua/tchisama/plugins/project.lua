return {
	"echasnovski/mini.starter",
	optional = true,
	opts = function(_, opts)
		local items = {
			{
				name = "Projects",
				action = pick,
				section = string.rep(" ", 22) .. "Telescope",
			},
		}
		vim.list_extend(opts.items, items)
	end,
}
