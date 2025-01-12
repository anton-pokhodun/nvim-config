vim.g.mapleader = " "
-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.5',
        requires = {
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope-live-grep-args.nvim',
            'sharkdp/fd',
            "dapc11/telescope-yaml.nvim",
        },
        config = function()
            require("telescope").load_extension("live_grep_args")
        end
    }
    use {'christoomey/vim-tmux-navigator'}
    use {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        requires = { {"nvim-lua/plenary.nvim"} }
    }
    use({
        "princejoogie/dir-telescope.nvim",
        -- telescope.nvim is a required dependency
        requires = { "nvim-telescope/telescope.nvim" },
    })
    use {
        'crusj/bookmarks.nvim',
        branch = 'main',
        requires = { 'kyazdani42/nvim-web-devicons' },
        config = function()
            require("bookmarks").setup()
            require("telescope").load_extension("bookmarks")
        end
    }
    use { "catppuccin/nvim", as = "catppuccin" }
    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use('nvim-treesitter/playground')
    use('mbbill/undotree')
    use('vim-airline/vim-airline-themes')
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            {"neovim/nvim-lspconfig"},
            {"hrsh7th/cmp-buffer"},
            {"hrsh7th/cmp-path"},
            {"hrsh7th/cmp-cmdline"},
            {"hrsh7th/nvim-cmp"},
            {"hrsh7th/cmp-vsnip"},
            {"hrsh7th/vim-vsnip"},
            {"L3MON4D3/LuaSnip"},
            {"hrsh7th/cmp-nvim-lsp"} ,
            {"neovim/nvim-lspconfig"},
            {"saadparwaiz1/cmp_luasnip"},
            -- "SirVer/ultisnips",
            -- "quannguyen30192/cmp-nvim-ultisnips",
            {"dcampos/nvim-snippy"},
            {"dcampos/cmp-snippy"},
            { 'hrsh7th/cmp-nvim-lsp' },
        }
    }
    use {
        "AckslD/nvim-neoclip.lua",
        requires = {
            { 'kkharji/sqlite.lua', module = 'sqlite' },
            -- you'll need at least one of these
            -- {'nvim-telescope/telescope.nvim'},
            -- {'ibhagwan/fzf-lua'},
        },
        config = function()
            require('neoclip').setup()
        end,
    }
    use {
        'lewis6991/gitsigns.nvim',
        requires = { 'nvim-lua/plenary.nvim' },
        config = function()
            require('gitsigns').setup { current_line_blame = true }
        end
    }
    use { 'ThePrimeagen/git-worktree.nvim' }
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
    -- nvim v0.7.2
    use({
        "kdheepak/lazygit.nvim",
        requires = {
            "nvim-telescope/telescope.nvim",
            "nvim-lua/plenary.nvim",
        },
        config = function()
            require("telescope").load_extension("lazygit")
        end,
    })
    use({
        'MeanderingProgrammer/render-markdown.nvim',
        after = { 'nvim-treesitter' },
        config = function()
            require('render-markdown').setup({})
        end,
    })
    use {
        'nvimdev/dashboard-nvim',
        event = 'VimEnter',
        config = function()
            require('dashboard').setup {
                -- config
            }
        end,
        requires = {'nvim-tree/nvim-web-devicons'}
    }
    use {"towolf/vim-helm"} 
    use { "williamboman/mason.nvim" }
    use {"williamboman/mason-lspconfig.nvim"}

end)
