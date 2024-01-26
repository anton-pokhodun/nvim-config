local telescope = require('telescope')
local lga_actions = require("telescope-live-grep-args.actions")
local builtin = require('telescope.builtin')

telescope.setup {
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
      -- ... also accepts theme settings, for example:
      -- theme = "dropdown", -- use dropdown theme
      -- theme = { }, -- use own theme spec
      -- layout_config = { mirror=true }, -- mirror preview pane
    }
  }
}


vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

--To make it work you might need to install
--brew install ripgrep
vim.keymap.set('n', '<leader>fs', "<cmd>Telescope live_grep<cr>", {})
vim.keymap.set('n', '<leader>fg', "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>", { desc = "Live Grep"})
--vim.keymap.set('n', '<leader>fs', function() 
--  builtin.grep_string({ search = vim.fn.input("Grep > ") })
--end);
--

vim.keymap.set('n', '<leader>ch', builtin.command_history, {})


