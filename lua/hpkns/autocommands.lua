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

vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("FixTerraformCommentString", { clear = true }),
  callback = function(ev)
    vim.bo[ev.buf].commentstring = "# %s"
  end,
  pattern = { "terraform", "hcl" },
})

