local lspconfig = require("lspconfig")
local def = require("lua.hpkns.lsp.default-lsp")

require("telescope").load_extension("telescope-yaml")
require("mason").setup()

lspconfig.lua_ls.setup {
  capabilities = def.capabilities,
  on_attach = def.on_attach,
  signatureHelp = { enable = true },

  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
      },
      -- diagnostics = {
      --   globals = { "vim" },
      -- },
      hint = { enable = true },
      signatureHelp = { enable = true },
    },
  },
}

-- vale_ls will autoload for all subdirectories in ~/loft/ by using .nvimrc
-- to prevent loading it in other projects, it can be loaded manually with a User command
require("lspconfig").bashls.setup {
  filetypes = { "sh", "zsh" },
}

require("lspconfig")["yamlls"].setup {
  {
    on_attach = def.on_attach,
    capabilities = def.capabilities,
    filetypes = { "yaml", "yml" },
    flags = { debounce_test_changes = 150 },
    settings = {
      yaml = {
        format = {
          enable = true,
          singleQuote = true,
          printWidth = 120,
        },
        hover = true,
        completion = true,
        validate = true,
      },
      schemas = {
        ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
        ["http://json.schemastore.org/github-action"] = { ".github/action.{yml,yaml}" },
      },
      schemaStore = {
        enable = true,
        url = "https://www.schemastore.org/api/json/catalog.json",
      },
    },
  },
}

lspconfig.helm_ls.setup{
    settings = {
        yamlls = {
            path = "yaml-language-server"
        }
    }
}

lspconfig.terraformls.setup {
    on_attach = def.on_attach,
    capabilities = def.capabilities
}

-- TODO move it elsewhere
-- PROJECT: lsp_lines
-- When using lsp_lines, this needs to be disabled
vim.diagnostic.config {
  virtual_text = true,
}

function Toggle_diagnostics()
    if vim.g.diagnostics_active then
        vim.g.diagnostics_active = false
        vim.diagnostic.disable()
    else
        vim.g.diagnostics_active = true
        vim.diagnostic.enable()
    end
end

vim.keymap.set('n', '<leader>xd', Toggle_diagnostics, { noremap = true, silent = true, desc = "Toggle vim diagnostics" })

