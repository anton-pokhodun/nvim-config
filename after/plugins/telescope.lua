local telescope = require('telescope')
local lga_actions = require("telescope-live-grep-args.actions")
local builtin = require('telescope.builtin')

telescope.setup {
        defaults = {
            hidden = true,
            no_ignore = false,
            show_preview = true,
            file_ignore_patterns = {".git/", ".cache", "node_modules/.*", "packer_compiled.lua"},
        },
        extensions = {
            live_grep_args = {
                auto_quoting = true, -- enable/disable auto-quoting
                -- define mappings, e.g.
                mappings = { -- extend mappings
                i = {
                    ["<C-k>"] = lga_actions.quote_prompt(),
                    ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
                },
            },
        }
    }
}

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fs', "<cmd>Telescope live_grep<cr>", {})
vim.keymap.set('n', '<leader>fg', "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>", { desc = "Live Grep"})
vim.keymap.set('n', '<leader>gb', ":Telescope git_branches<CR>", { desc = 'Get git branches' })
vim.keymap.set('n', '<leader>gc', ":Telescope git_commits<CR>", { desc = 'Git commits' })
vim.keymap.set('n', '<leader>gs', ":Telescope git_status<CR>", { desc = 'Git status' })
vim.keymap.set("n", "<Leader>xir", "<CMD>lua require('telescope').extensions.git_worktree.git_worktrees()<CR>", {})
vim.keymap.set("n", "<leader>fd", "<cmd>Telescope dir live_grep<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>pd", "<cmd>Telescope dir find_files<CR>", { noremap = true, silent = true })
vim.keymap.set('n', '<leader>ch', builtin.command_history, {})


