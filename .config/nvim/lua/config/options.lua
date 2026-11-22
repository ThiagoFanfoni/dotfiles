-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local lsp_log = vim.lsp.log
local lsp_log_level = vim.env.NVIM_LSP_LOG_LEVEL or "OFF"
lsp_log.set_level(lsp_log_level)

-- Some Neovim versions still open the LSP log at level OFF.
if lsp_log_level:upper() == "OFF" and lsp_log._set_filename then
  lsp_log._set_filename("/dev/null")
end

vim.g.snacks_animate = false
vim.g.lazyvim_python_lsp = "basedpyright"
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0

local spellfile = require("nvim.spellfile")
spellfile.config({ confirm = false })

vim.opt.spelllang:append("pt_br")
vim.opt.spellfile = vim.fn.stdpath("config") .. "/spell/custom.utf-8.add"
vim.opt.spelloptions:append("camel")

local function is_crostini()
  return vim.fn.isdirectory("/mnt/chromeos") == 1 or vim.fn.filereadable("/dev/.cros_milestone") == 1
end

if is_crostini() then
  vim.g.neovide_theme = "dark"
end

if is_crostini() and not vim.g.neovide then
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

vim.g.neovide_cursor_animation_length = 0
vim.g.neovide_cursor_short_animation_length = 0
