-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.lazyvim_picker = "snacks"
vim.g.lazyvim_prettier_needs_config = false
vim.g.lazyvim_python_lsp = "basedpyright"
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0

local spellfile = require("nvim.spellfile")
spellfile.config({ confirm = false })
if #vim.api.nvim_get_runtime_file("spell/pt.utf-8.spl", true) == 0 then
  spellfile.get("pt")
end

vim.opt.spell = true
vim.opt.spellfile = vim.fn.stdpath("config") .. "/spell/custom.utf-8.add"
vim.opt.spelllang = { "en_us", "pt_br" }

vim.g.clipboard = {
  name = "osc52-copy-only",
  copy = {
    ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
    ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
  },
  -- Passing empty functions prevents Neovim from polling the terminal for text
  -- when an image is present, eliminating the synchronous hang bug.
  paste = {
    ["+"] = function()
      return { "", "" }
    end,
    ["*"] = function()
      return { "", "" }
    end,
  },
}
