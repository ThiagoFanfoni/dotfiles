-- Windows Neovide launches WSL Neovim without Linuxbrew on PATH.
local brew_bin = "/home/linuxbrew/.linuxbrew/bin"
if vim.g.neovide and vim.fn.isdirectory(brew_bin) == 1 then
  vim.env.PATH = brew_bin .. ":" .. (vim.env.PATH or "")
end

-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
