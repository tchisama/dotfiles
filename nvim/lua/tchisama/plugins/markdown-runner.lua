return {
	"dbridges/vim-markdown-runner",
	config = function()
		vim.g.markdown_runners = {
			python = "python3",
			rust = "sh -c 'cat > /tmp/tmp_rust.rs && rustc /tmp/tmp_rust.rs -o /tmp/tmp_rust && /tmp/tmp_rust'",
			vim = "vim -es -c 'source %' -c 'q'", -- Runs Vimscript
			html = "xdg-open %",
		}
	end,
}
