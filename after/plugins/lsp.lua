local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(_, bufnr)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})
end)

-- to learn how to use mason.nvim with lsp-zero
-- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/integrate-with-mason-nvim.md
require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = { 'lua_ls' },
  handlers = {
    lsp_zero.default_setup,
  },
})

require('lspconfig').lua_ls.setup {
    on_attach = on_attach,
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }

}
