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
