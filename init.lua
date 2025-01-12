package.path = package.path .. ";" .. vim.env.HOME .. "/.config/nvim/lua/?.lua"

require("hpkns.autocommands")
require("hpkns.packer")
require("hpkns.remap")
require("hpkns.set")
require("after.plugins.catppuccin")
require("after.plugins.telescope")
require("after.plugins.treesitter")
require("after.plugins.undotree")
require("hpkns.lsp.init")
require("after.plugins.gitsigns")
require("after.plugins.barbar")
require("after.plugins.auto-session")
require("after.plugins.neoclip")
require("after.plugins.bookmark")

