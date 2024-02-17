local telescope = require('telescope')
local lga_actions = require("telescope-live-grep-args.actions")
local builtin = require('telescope.builtin')
local actions = require('telescope.actions')

telescope.setup {
        -- mappings = {
        --     i = {
        --         ["<C-k>"] = actions.move_selection_previous,
        --         ["<C-j>"] = actions.move_selection_next,
        --         ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
        --     }
        -- },
        defaults = {
            vimgrep_arguments = {
                'rg',
                '--color=never',
                '--no-heading',
                '--with-filename',
                '--line-number',
                '--column',
                '--smart-case',
                '--no-ignore-vcs',
                '--hidden',
                '--ignore-file',
                '.gitignore'
            },
            sorting_strategy = "ascending",
            mappings = {
                i = {
                    ['<C-k>'] = actions.preview_scrolling_up,
                    ['<C-j>'] = actions.preview_scrolling_down
                }
            },
            hidden = true,
            layout_strategy = "horizontal",
            no_ignore = false,
            show_preview = true,
            color_devicons = true,
            file_ignore_patterns = {".git/", ".idea/*", "vendor/.*", ".cache", "node_modules/.*", "packer_compiled.lua"},
            layout_config = {
                horizontal = {
                    prompt_position = "top",
                    preview_width = 0.55,
                    results_width = 0.8,
                },
                vertical = {
                    mirror = false,
                },
                width = 0.87,
                height = 0.80,
                preview_cutoff = 120,
            },
            border = {},

        },
        pickers = {
            find_files = {
                hidden = true
            },
        },
        extensions = {
            live_grep_args = {
                auto_quoting = true, -- enable/disable auto-quoting
                -- define mappings, e.g.
                mappings = { -- extend mappings
                i = {
                    ["<C-k>"] = lga_actions.quote_prompt(),
                    ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " })
                },
            },
        }
    }
}

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fs', "<cmd>Telescope live_grep<cr>", {})
vim.keymap.set('n', '<leader>fg', "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>", { desc = "Live Grep"})
vim.keymap.set('n', '<leader>fb', ":Telescope git_branches<CR>", { desc = 'Get git branches' })
vim.keymap.set('n', '<leader>gc', ":Telescope git_commits<CR>", { desc = 'Git commits' })
vim.keymap.set('n', '<leader>gs', ":Telescope git_status<CR>", { desc = 'Git status' })
vim.keymap.set("n", "<Leader>xir", "<CMD>lua require('telescope').extensions.git_worktree.git_worktrees()<CR>", {})
vim.keymap.set("n", "<leader>fd", "<cmd>Telescope dir live_grep<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>pd", "<cmd>Telescope dir find_files<CR>", { noremap = true, silent = true })
vim.keymap.set('n', '<leader>ch', builtin.command_history, {})
-- Telescope resume (last picker)
vim.keymap.set("n", "<leader>fr", [[<Cmd>lua require'telescope.builtin'.resume()<CR>]], { noremap = true, silent = true })


