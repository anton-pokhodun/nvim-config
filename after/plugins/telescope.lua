local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

--To make it work you might need to install
--brew install ripgrep
vim.keymap.set('n', '<leader>fs', "<cmd>Telescope live_grep<cr>", {})
--vim.keymap.set('n', '<leader>fs', function() 
--  builtin.grep_string({ search = vim.fn.input("Grep > ") })
--end);
--

vim.keymap.set('n', '<leader>ch', builtin.command_history, {})
