local lsp_zero = require('lsp-zero')
local lspconfig = require('lspconfig')
local util = require("lspconfig.util")
local configs = require("lspconfig.configs")

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf }
        vim.keymap.set('n', 'gd', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gb', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', '<leader>s', vim.lsp.buf.signature_help, opts)
        vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
        vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
        vim.keymap.set('n', '<space>wl', function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, opts)
        vim.keymap.set('n', '<space>d', vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', '<space>f', function()
            vim.lsp.buf.format { async = true }
        end, opts)
    end,
})

-- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/integrate-with-mason-nvim.md
require('mason').setup({})

require('mason-lspconfig').setup({
    ensure_installed = { 'lua_ls', 'ruby_ls', 'bashls', 'solargraph', 'marksman', 'dockerls', 'yamlls' },
    handlers = {
        lsp_zero.default_setup,
    },
})

require('lspconfig').dockerls.setup({})

require('lspconfig').marksman.setup({})

require('lspconfig').ruby_ls.setup({
    default_config = {
        single_file_support = true,
        cmd = { "bundle", "exec", "ruby-lsp" },
        filetypes = { "ruby" },
        root_dir = util.root_pattern("Gemfile", ".git"),
        init_options = {
            -- enabledFeatures = enabled_features,
            formatter = "auto",
        },
        settings = {},
    },
    commands = {
        FormatRuby = {
            function()
                vim.lsp.buf.format({
                    name = "ruby_ls",
                    async = true,
                })
            end,
            description = "Format using ruby-lsp",
        },
    },

})

lspconfig.solargraph.setup({})

lspconfig.yamlls.setup({})

lspconfig.lua_ls.setup {
    on_attach = lsp_zero.on_attach,
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }

}
