vim.g.mapleader = " "
-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.WebDevIconsUnicodeDecorateFolderNodes = 1
vim.g.NERDTreeShowHidden=1
vim.g.undotree_WindowLayout=1
vim.g.undotree_SplitWidth=30
vim.g.undotree_DiffAutoOpen=1
-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true
vim.opt.guicursor = ""
vim.cmd[[colorscheme tokyonight-moon]]
vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
vim.o.updatetime = 250
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 10
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 50
vim.opt.colorcolumn = "80"
vim.g.netrw_banner = 0
vim.api.nvim_set_option("clipboard", "unnamed")
vim.opt.showcmd = true
vim.opt.path:append({ "**" }) -- Finding files - Search down into subfolders
vim.opt.wildignore:append({ "*/node_modules/*", "*/target/*", "*/auto-session-cache/*" })
vim.opt.mouse = "a"
vim.opt.updatetime = 300
vim.opt.cursorline = true
vim.opt.numberwidth = 4
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

vim.g.auto_session_root_dir = "~/auto-session-cache/"

-- Highlight yanked
vim.api.nvim_create_augroup("HighlightYank", {})
vim.api.nvim_create_autocmd(
  "TextYankPost",
  { command = "silent! lua vim.highlight.on_yank()", group = "HighlightYank" }
)
vim.api.nvim_create_augroup("ActionOnClose", {})
-- vim.api.nvim_create_autocmd("BufEnter", { command = "autocmd VimEnter * NERDTree", group = "ActionOnClose"})

