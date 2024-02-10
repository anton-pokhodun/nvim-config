--git remote add origin git@github.com:adollar/nvim-config.git This file can be loaded by calling `lua require('plugins')` from your init.vim

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
        'nvim-telescope/telescope-live-grep-args.nvim'
    },
    config = function()
        require("telescope").load_extension("live_grep_args")
    end
  }
  use {
      "folke/tokyonight.nvim",
      lazy = false,
      priority = 1000,
      opts = {},
  }
  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use('nvim-treesitter/playground')
  use('theprimeagen/harpoon')
  use('mbbill/undotree')
  use('tpope/vim-fugitive')
  use('vim-airline/vim-airline')
  use('vim-airline/vim-airline-themes')
  use {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
  }
  use {
      'VonHeikemen/lsp-zero.nvim',
      branch = 'v3.x',
      requires = {
          --- Uncomment the two plugins below if you want to manage the language servers from neovim
          -- {'williamboman/mason.nvim'},
          -- {'williamboman/mason-lspconfig.nvim'},

          -- LSP Support
          {'neovim/nvim-lspconfig'},
          -- Autocompletion
          {'hrsh7th/nvim-cmp'},
          {'hrsh7th/cmp-nvim-lsp'},
          {'L3MON4D3/LuaSnip'},
      }
  }
  use {
      "AckslD/nvim-neoclip.lua",
      requires = {
          {'kkharji/sqlite.lua', module = 'sqlite'},
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
  use {'ThePrimeagen/git-worktree.nvim'}
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

end)
