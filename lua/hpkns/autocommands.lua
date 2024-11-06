local api = vim.api
local yamlSettings = api.nvim_create_augroup("YamlSettings", { clear = true })

-- YAML Settings
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*.yaml",
  callback = function()
    vim.cmd "silent! Neoformat"
  end,
  group = yamlSettings,
})
