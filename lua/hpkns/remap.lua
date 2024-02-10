vim.g.mapleader = " "
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

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

keymap.set("n", "<leader><leader>", function()
  vim.cmd("so")
end, { desc = "Source current file" })

-- Resize with arrows
keymap.set("n", "<C-S-Down>", ":resize +2<CR>", { desc = "Resize Horizontal Split Down" })
keymap.set("n", "<C-S-Up>", ":resize -2<CR>", { desc = "Resize Horizontal Split Up" })
keymap.set("n", "<C-S-Left>", ":vertical resize -2<CR>", { desc = "Resize Vertical Split Down" })
keymap.set("n", "<C-S-Right>", ":vertical resize +2<CR>", { desc = "Resize Vertical Split Up" })

-- Commenter Keybinding
keymap.set("n", "<C-/>", ":CommentToggle<CR>", {})
keymap.set("v", "<C-/>", ":CommentToggle<CR>", {})

-- Autocommands
vim.api.nvim_create_augroup("custom_buffer", { clear = true })


