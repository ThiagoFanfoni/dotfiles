-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

vim.schedule(function()
  if vim.v.exiting ~= vim.NIL or #vim.api.nvim_get_runtime_file("spell/pt.utf-8.spl", true) > 0 then
    return
  end

  local ok, err = pcall(function()
    require("nvim.spellfile").get("pt")
  end)
  if not ok then
    vim.notify(("Failed to download Portuguese spellfile: %s"):format(tostring(err)), vim.log.levels.WARN)
  end
end)
