vim.g.mapleader = " "
-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use 'mileszs/ack.vim'
    use {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.5',
        requires = {
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope-live-grep-args.nvim',
            'sharkdp/fd'
        },
        config = function()
            require("telescope").load_extension("live_grep_args")
        end
    }
    use({
        "princejoogie/dir-telescope.nvim",
        -- telescope.nvim is a required dependency
        requires = { "nvim-telescope/telescope.nvim" },
    })
    use {'chentoast/marks.nvim'}
    use {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
    }
    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use('nvim-treesitter/playground')
    use('mbbill/undotree')
    use('tpope/vim-fugitive')
    use('vim-airline/vim-airline')
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            {"neovim/nvim-lspconfig"},
            -- {"hrsh7th/cmp-buffer"},
            {"hrsh7th/cmp-path"},
            {"hrsh7th/cmp-cmdline"},
            {"hrsh7th/nvim-cmp"},
            -- {"hrsh7th/cmp-vsnip"},
            -- {"hrsh7th/vim-vsnip"},
            -- {"L3MON4D3/LuaSnip"},
            {"hrsh7th/cmp-nvim-lsp"} ,
            {"neovim/nvim-lspconfig"},
            -- {"saadparwaiz1/cmp_luasnip"},
            -- {"dcampos/nvim-snippy"},
            -- {"dcampos/cmp-snippy"},
        }
    }
    use {
        'lewis6991/gitsigns.nvim',
        requires = { 'nvim-lua/plenary.nvim' },
        config = function()
            require('gitsigns').setup { current_line_blame = true }
        end
    }
    use {
        "terrortylor/nvim-comment",
        cmd = "CommentToggle",
        config = function()
            require("nvim_comment").setup()
        end
    }
    -- Nerdtree and plugins
    use('preservim/nerdtree')
    use('ryanoasis/vim-devicons')
    use('Xuyuanp/nerdtree-git-plugin')
    -- Tabs
    use('romgrk/barbar.nvim')
    use('nvim-tree/nvim-web-devicons')
    use {
        'rmagatti/auto-session',
        config = function()
            require("auto-session").setup {
                log_level = "error",
                auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
            }
        end
    }
    use('lovesegfault/beautysh')
    use('itspriddle/vim-shellcheck')
    -- Pair brackets
    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }
    use "sindrets/diffview.nvim"
end)
