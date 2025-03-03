-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps -------------------

-- use jk to exit insert mode or caps lock
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })
--
-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "<leader>s/", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>s-", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

--- tab management
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

-- Keybindings for CopilotChat
keymap.set("n", "<leader>cc", ":CopilotChatToggle<CR>", { noremap = true, silent = true, desc = "Toggle chat window" }) -- Toggle chat window
keymap.set("n", "<leader>ce", ":CopilotChatExplain<CR>", { noremap = true, silent = true }) -- Explain selected code
keymap.set("n", "<leader>cr", ":CopilotChatReview<CR>", { noremap = true, silent = true }) -- Review selected code
keymap.set("n", "<leader>cf", ":CopilotChatFix<CR>", { noremap = true, silent = true }) -- Fix selected code
keymap.set("n", "<leader>co", ":CopilotChatOptimize<CR>", { noremap = true, silent = true }) -- Optimize selected code
keymap.set("n", "<leader>cd", ":CopilotChatDocs<CR>", { noremap = true, silent = true }) -- Generate docs for selected code
keymap.set("n", "<leader>ct", ":CopilotChatTests<CR>", { noremap = true, silent = true }) -- Generate tests for selected code

-- ChatGpt keybindings
keymap.set("n", "<leader>cg", ":ChatGPT<CR>", { noremap = true, silent = true, desc = "Open Chat with Chatgpt" }) -- Generate code using ChatGpt

--
-- :PomodoroStart 	Start the Pomodoro timer.
-- :PomodoroStop 	Stop the Pomodoro timer.
-- :PomodoroUI 	Display the Pomodoro UI.
-- :PomodoroSkipBreak 	Skip the current break and start the next work session.
-- :PomodoroForceBreak 	Forcefully start a break.
-- :PomodoroDelayBreak Delay the current break by 5 minutes.

keymap.set("n", "<leader>pt", ":PomodoroStart<CR>", { desc = "Start Pomodoro timer" })
keymap.set("n", "<leader>ps", ":PomodoroStop<CR>", { desc = "Stop Pomodoro timer" })
keymap.set("n", "<leader>pu", ":PomodoroUI<CR>", { desc = "Display Pomodoro UI" })

-- Code Runner

keymap.set("n", "<leader>rr", ":RunCode<CR>", { noremap = true, silent = false })
keymap.set("n", "<leader>rf", ":RunFile<CR>", { noremap = true, silent = false })
keymap.set("n", "<leader>rft", ":RunFile tab<CR>", { noremap = true, silent = false })
keymap.set("n", "<leader>rp", ":RunProject<CR>", { noremap = true, silent = false })
keymap.set("n", "<leader>rc", ":RunClose<CR>", { noremap = true, silent = false })
keymap.set("n", "<leader>crf", ":CRFiletype<CR>", { noremap = true, silent = false })
keymap.set("n", "<leader>crp", ":CRProjects<CR>", { noremap = true, silent = false })

--- VIM folds keybindings

keymap.set("n", "<leader>z", "za", { desc = "Toggle fold" }) -- toggle fold

--- custom commands
keymap.set(
	"n",
	"<leader>qs",
	require("tchisama.core.custome_commands.wiki").toggle_todo,
	{ noremap = true, silent = true, desc = "Toggle TODO" }
)
keymap.set(
	"n",
	"<leader>qt",
	require("tchisama.core.custome_commands.wiki").todo_temp,
	{ noremap = true, silent = true, desc = "Insert TODO template" }
)
keymap.set(
	"n",
	"<leader>qi",
	require("tchisama.core.custome_commands.wiki").insert_todo,
	{ noremap = true, silent = true, desc = "Insert TODO" }
)
keymap.set("n", "<leader>qf", function()
	local tag = vim.fn.input("Enter tag: ")
	require("tchisama.core.custome_commands.wiki").filter_todos_by_tag(tag)
end, { noremap = true, silent = true, desc = "Filter TODOs by tag" })

--- Telescope keybindings
---
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { noremap = true, silent = true, desc = "Find files" })
keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { noremap = true, silent = true, desc = "Live grep" })
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { noremap = true, silent = true, desc = "Buffers" })
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { noremap = true, silent = true, desc = "Help tags" })
keymap.set("n", "<leader>fw", "<cmd>Telescope grep_string<CR>", { noremap = true, silent = true, desc = "Grep string" })
keymap.set("n", "<leader>fc", "<cmd>Telescope commands<CR>", { noremap = true, silent = true, desc = "Commands" })
keymap.set("n", "<leader>fm", "<cmd>Telescope marks<CR>", { noremap = true, silent = true, desc = "Marks" })
-- colorcheme with preview and set it when selected as default always
keymap.set(
	"n",
	"<leader>cs",
	"<cmd>lua require('telescope.builtin').colorscheme({enable_preview = true, disable_devicons = true, theme = 'cursor'})<CR>",
	{ noremap = true, silent = true, desc = "Color schemes" }
)

keymap.set(
	"n",
	"<leader>fl",
	"<cmd>Telescope lsp_document_symbols<CR>",
	{ noremap = true, silent = true, desc = "Document symbols" }
)

keymap.set("n", "<leader>ft", "<cmd>Telescope treesitter<CR>", { noremap = true, silent = true, desc = "Treesitter" })

-- Telescope with git

keymap.set("n", "<leader>fgs", "<cmd>Telescope git_status<CR>", { noremap = true, silent = true, desc = "Git status" })
keymap.set(
	"n",
	"<leader>fgb",
	"<cmd>Telescope git_branches<CR>",
	{ noremap = true, silent = true, desc = "Git branches" }
)
keymap.set(
	"n",
	"<leader>fgc",
	"<cmd>Telescope git_commits<CR>",
	{ noremap = true, silent = true, desc = "Git commits" }
)
keymap.set("n", "<leader>fgf", "<cmd>Telescope git_files<CR>", { noremap = true, silent = true, desc = "Git files" })

keymap.set(
	"n",
	"<leader>fvo",
	"<cmd>Telescope vim_options<CR>",
	{ noremap = true, silent = true, desc = "Vim options" }
)

--- jumb between buffers

keymap.set(
	"n",
	"<leader>0",
	"<cmd>BufferLineGoToBuffer 1<CR>",
	{ noremap = true, silent = true, desc = "Go to buffer 1" }
)
keymap.set(
	"n",
	"<leader>1",
	"<cmd>BufferLineGoToBuffer 2<CR>",
	{ noremap = true, silent = true, desc = "Go to buffer 2" }
)
keymap.set(
	"n",
	"<leader>2",
	"<cmd>BufferLineGoToBuffer 3<CR>",
	{ noremap = true, silent = true, desc = "Go to buffer 3" }
)
keymap.set(
	"n",
	"<leader>3",
	"<cmd>BufferLineGoToBuffer 4<CR>",
	{ noremap = true, silent = true, desc = "Go to buffer 4" }
)
keymap.set(
	"n",
	"<leader>4",
	"<cmd>BufferLineGoToBuffer 5<CR>",
	{ noremap = true, silent = true, desc = "Go to buffer 5" }
)
keymap.set(
	"n",
	"<leader>5",
	"<cmd>BufferLineGoToBuffer 6<CR>",
	{ noremap = true, silent = true, desc = "Go to buffer 6" }
)

--- GOYO keybindings
---
keymap.set("n", "<leader>g", ":Goyo<CR>", { noremap = true, silent = true, desc = "Goyo" })

--- Vim Markdown Runner
---
-- autocmd FileType markdown nnoremap <buffer> <Leader>r :MarkdownRunner<CR>
-- autocmd FileType markdown nnoremap <buffer> <Leader>R :MarkdownRunnerInsert<CR>

keymap.set("n", "<leader>qr", ":MarkdownRunner<CR>", { noremap = true, silent = true, desc = "Run markdown" })
keymap.set(
	"n",
	"<leader>qR",
	":MarkdownRunnerInsert<CR>",
	{ noremap = true, silent = true, desc = "Run markdown and insert" }
)
