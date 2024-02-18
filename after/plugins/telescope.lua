local telescope = require('telescope')
local lga_actions = require("telescope-live-grep-args.actions")
local actions = require('telescope.actions')

telescope.setup {
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

