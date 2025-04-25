-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set:
-- https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- 2025
-- https://github.com/LazyVim/LazyVim/blob/ec5981dfb1222c3bf246d9bcaa713d5cfa486fbd/lua/lazyvim/config/autocmds.lua#L4
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
--
-- disable Diagnostics in markdown files — works!
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "markdown" },
  callback = function()
    vim.diagnostic.enable(false)
  end,
})

-- disable Spellcheck in markdown files — not works??
-- vim.api.nvim_create_autocmd({ "FileType" }, {
--   pattern = { "markdown" },
--   callback = function()
--     -- vim.cmd.spell = false
--     vim.cmd.spell = false
--   end,
-- })

-- wrap and check for spell in text filetypes
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "text", "plaintex", "typst", "gitcommit", "markdown" },
  callback = function()
    vim.opt_local.wrap = true
    -- vim.opt_local.spell = false
    vim.opt_global.spell = false
  end,
})

-- Enable habamax colorscheme in markdown
-- vim.api.nvim_create_autocmd("FileType", {
--   -- pattern = { "text", "plaintex", "typst", "gitcommit", "markdown" },
--   pattern = { "markdown" },
--   callback = function()
--     vim.cmd.colorscheme("habamax")
--   end,
-- })
--
-- -- Examples
--
-- vim.api.nvim_create_autocmd("FileType", {
--   group = augroup("wrap_spell"),
--   pattern = { "text", "plaintex", "typst", "gitcommit", "markdown" },
--   callback = function()
--     vim.opt_local.wrap = true
--     vim.opt_local.spell = true
--   end,
-- })
--
