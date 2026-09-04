-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.snacks_animate = false
vim.g.lazyvim_python_lsp = "basedpyright"
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0

local spellfile = require("nvim.spellfile")
spellfile.config({ confirm = false })

vim.opt.spellfile = vim.fn.stdpath("config") .. "/spell/custom.utf-8.add"
vim.opt.spelloptions:append("camel")

local function is_crostini()
  return vim.fn.isdirectory("/mnt/chromeos") == 1 or vim.fn.filereadable("/dev/.cros_milestone") == 1
end

if is_crostini() then
  vim.g.clipboard = {
    name = "OSC 52",
    copy = {
      ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
      ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
    },
    paste = {
      ["+"] = require("vim.ui.clipboard.osc52").paste("+"),
      ["*"] = require("vim.ui.clipboard.osc52").paste("*"),
    },
  }
end
