local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(_, bufnr)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = bufnr, desc = "Go to the definition" })
    vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr, desc = "LSP Hover" })
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = bufnr, desc = "Go to Implementation" })
    vim.keymap.set("n", "<cmd>[", vim.diagnostic.goto_prev, { buffer = bufnr, desc = "Go to Next Diagnostic" })
    vim.keymap.set("n", "gl", vim.diagnostic.open_float, { buffer = bufnr, desc = "Open Diagnostic Float" })
    vim.keymap.set("n", "<cmd>[", vim.diagnostic.goto_next, { buffer = bufnr, desc = "Go to Previous Diagnostic" })

  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})
end)

-- to learn how to use mason.nvim with lsp-zero
-- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/integrate-with-mason-nvim.md
require('mason').setup({})

require('mason-lspconfig').setup({
  ensure_installed = { 'lua_ls', 'solargraph', 'marksman', 'dockerls' },
  handlers = {
    lsp_zero.default_setup,
  },
})

require('lspconfig').dockerls.setup({})

require('lspconfig').marksman.setup({})

require('lspconfig').solargraph.setup({})

require('lspconfig').lua_ls.setup {
    on_attach = lsp_zero.on_attach,
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }

}
