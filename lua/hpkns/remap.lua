vim.g.mapleader = " "
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }
local builtin = require('telescope.builtin')
local utils = require "hpkns.utils"

-- Unbind F1
keymap('n', '<F1>', '<Nop>', { noremap = true, silent = true })
keymap('i', '<F1>', '<Nop>', { noremap = true, silent = true })

keymap("n", "<leader>nt", ":NERDTreeToggle<CR>")
keymap("n", "<leader>nf", ":NERDTreeFind<CR>", { desc = "Find currently opened file in directory tree" })

-- Delete work backward
keymap("n", "dw", 'vb"_d')

-- Paste word without overwriting register
keymap("v", "p", '"_dP')

-- Select all
keymap("n", "<C-a>", "gg<S-v>G")

-- Split window
keymap("n", "ss", ":split<Return>", opts)
keymap("n", "sv", ":vsplit<Return>", opts)

-- Move window
keymap("n", "sh", "<C-w>h")
keymap("n", "sk", "<C-w>k")
keymap("n", "sj", "<C-w>j")
keymap("n", "sl", "<C-w>l")

-- Call out neoclip
vim.keymap.set("n",  "<C-S-v>", "<cmd>Telescope neoclip<CR>", { desc = "Telescope Neoclip"})

-- Diagnostics
keymap("n", "<C-j>", function() vim.diagnostic.goto_next() end, opts)

-- Copy file paths
keymap("n", "<leader>cf", "<cmd>let @+ = expand(\"%\")<CR>", { desc = "Copy File Name" })
keymap("n", "<leader>cp", "<cmd>let @+ = expand(\"%:p\")<CR>", { desc = "Copy File Path" })

-- Resize with arrows
keymap("n", "<C-S-Down>", ":resize +2<CR>", { desc = "Resize Horizontal Split Down" })
keymap("n", "<C-S-Up>", ":resize -2<CR>", { desc = "Resize Horizontal Split Up" })
keymap("n", "<C-S-Right>", ":vertical resize -2<CR>", { desc = "Resize Vertical Split Down" })
keymap("n", "<C-S-Left>", ":vertical resize +2<CR>", { desc = "Resize Vertical Split Up" })

-- Execute current file
keymap("n", "<F9>", ":!%:p<CR>", { desc = "Execute current bash file" })

-- Commenter Keybinding
keymap({"n", "v"}, "<F10>", ":CommentToggle<CR>", {})
keymap("n", "<leader><leader>", ":wa<CR>", { desc = "Save all" })
keymap("n", "<leader>q", ":BufferClose<CR>", { desc = "Close the buffer" })
keymap("n", "<leader>gb", ":G blame<CR>", { desc = "Open git blame" })

--Telescope
keymap('n', '<leader>ff', builtin.find_files, {})
keymap('n', '<leader>fh', builtin.help_tags, {})
keymap('n', '<leader>fs', "<cmd>Telescope live_grep<cr>", {})
keymap('n', '<leader>fg', "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>", { desc = "Live Grep"})
keymap('n', '<leader>fb', ":Telescope git_branches<CR>", { desc = 'Get git branches' })
keymap('n', '<leader>gc', ":Telescope git_commits<CR>", { desc = 'Git commits' })
keymap('n', '<leader>gs', ":Telescope git_status<CR>", { desc = 'Git status' })
keymap("n", "<Leader>xir", "<CMD>lua require('telescope').extensions.git_worktree.git_worktrees()<CR>", {})
keymap("n", "<leader>fd", "<cmd>Telescope dir live_grep<CR>", { noremap = true, silent = true })
keymap("n", "<leader>pd", "<cmd>Telescope dir find_files<CR>", { noremap = true, silent = true })
keymap('n', '<leader>ch', builtin.command_history, {})
keymap("n", "<leader>fr", [[<Cmd>lua require'telescope.builtin'.resume()<CR>]], { noremap = true, silent = true })
keymap("n", "<leader>fo", builtin.oldfiles, { noremap = true, silent = true })

-- Tabs
keymap('n', '<F8>', '<Cmd>BufferPrevious<CR>', opts)
keymap('n', '<F9>', '<Cmd>BufferNext<CR>', opts)

-- Close buffer
keymap('n', '<C-w>', '<Cmd>BufferClose<CR>', opts)
keymap('n', '<C-p>', '<Cmd>BufferPick<CR>', opts)
keymap('n', '<leader>cc', '<Cmd>BufferCloseAllButCurrent<CR>', opts)
keymap('n', '<leader>cl', '<Cmd>close<CR>', opts)

-- Lazygit
keymap("n", "<leader>lg", ":LazyGit<CR>")

--Search and replace
utils.lnmap("<leader>rs", ":s/\\v", { silent = false, desc = "search and replace on line" })
utils.lnmap("<leader>SS", ":%s/\\v", { silent = false, desc = "search and replace in file" })

local harpoon = require("harpoon")

harpoon:setup()

keymap("n", "<leader>a", function() harpoon:list():add() end)
keymap("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

--keymap("n", "<C-h>", function() harpoon:list():select(1) end)
--keymap("n", "<C-t>", function() harpoon:list():select(2) end)
--keymap("n", "<C-n>", function() harpoon:list():select(3) end)
--keymap("n", "<C-s>", function() harpoon:list():select(4) end)
-- Toggle previous & next buffers stored within Harpoon list
keymap("n", "<C-S-P>", function() harpoon:list():prev() end)
keymap("n", "<C-S-N>", function() harpoon:list():next() end)
