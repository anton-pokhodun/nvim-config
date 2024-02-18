vim.g.mapleader = " "
local keymap = vim.keymap
local opts = { noremap = true, silent = true }
local builtin = require('telescope.builtin')

keymap.set("n", "<leader>nt", ":NERDTreeToggle<CR>")

-- Delete work backward
keymap.set("n", "dw", 'vb"_d')

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Split window
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)

-- Move window
keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sk", "<C-w>k")
keymap.set("n", "sj", "<C-w>j")
keymap.set("n", "sl", "<C-w>l")

-- Diagnostics
keymap.set("n", "<C-j>", function()
	vim.diagnostic.goto_next()
end, opts)

-- Copy file paths
keymap.set("n", "<leader>cf", "<cmd>let @+ = expand(\"%\")<CR>", { desc = "Copy File Name" })
keymap.set("n", "<leader>cp", "<cmd>let @+ = expand(\"%:p\")<CR>", { desc = "Copy File Path" })

-- Resize with arrows
keymap.set("n", "<C-S-Down>", ":resize +2<CR>", { desc = "Resize Horizontal Split Down" })
keymap.set("n", "<C-S-Up>", ":resize -2<CR>", { desc = "Resize Horizontal Split Up" })
keymap.set("n", "<C-S-Right>", ":vertical resize -2<CR>", { desc = "Resize Vertical Split Down" })
keymap.set("n", "<C-S-Left>", ":vertical resize +2<CR>", { desc = "Resize Vertical Split Up" })

-- Execute current file
keymap.set("n", "<F9>", ":!%:p<CR>", { desc = "Execute current bash file" })

-- Commenter Keybinding
keymap.set("n", "<C-/>", ":CommentToggle<CR>", {})
keymap.set("n", "<leader><leader>", ":wa<CR>", { desc = "Save all" })
keymap.set("n", "<leader>q", ":q<CR>", { desc = "Close the buffer" })
keymap.set("n", "<leader>gb", ":G blame<CR>", { desc = "Open git blame" })
keymap.set("v", "<C-/>", ":CommentToggle<CR>", {})

--Telescope
keymap.set('n', '<leader>ff', builtin.find_files, {})
keymap.set('n', '<leader>fh', builtin.help_tags, {})
keymap.set('n', '<leader>fs', "<cmd>Telescope live_grep<cr>", {})
keymap.set('n', '<leader>fg', "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>", { desc = "Live Grep"})
keymap.set('n', '<leader>fb', ":Telescope git_branches<CR>", { desc = 'Get git branches' })
keymap.set('n', '<leader>gc', ":Telescope git_commits<CR>", { desc = 'Git commits' })
keymap.set('n', '<leader>gs', ":Telescope git_status<CR>", { desc = 'Git status' })
keymap.set("n", "<Leader>xir", "<CMD>lua require('telescope').extensions.git_worktree.git_worktrees()<CR>", {})
keymap.set("n", "<leader>fd", "<cmd>Telescope dir live_grep<CR>", { noremap = true, silent = true })
keymap.set("n", "<leader>pd", "<cmd>Telescope dir find_files<CR>", { noremap = true, silent = true })
keymap.set('n', '<leader>ch', builtin.command_history, {})
keymap.set("n", "<leader>fr", [[<Cmd>lua require'telescope.builtin'.resume()<CR>]], { noremap = true, silent = true })
keymap.set("n", "<leader>fo", builtin.oldfiles, { noremap = true, silent = true })

-- Tabs
local map = vim.api.nvim_set_keymap
-- Move to previous/next
map('n', '<C-,>', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<C-;>', '<Cmd>BufferNext<CR>', opts)
-- Close buffer
map('n', '<C-w>', '<Cmd>BufferClose<CR>', opts)
map('n', '<C-p>', '<Cmd>BufferPick<CR>', opts)
map('n', '<leader>ca', '<Cmd>BufferCloseAllButCurrent<CR>', opts)

