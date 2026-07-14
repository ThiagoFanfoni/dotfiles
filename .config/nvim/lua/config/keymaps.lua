-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- vim.keymap.set("c", "<Down>", "<C-n>", { noremap = true })
-- vim.keymap.set("c", "<Up>", "<C-p>", { noremap = true })

local function toggle_terminal()
  if vim.bo.buftype == "terminal" then
    vim.cmd("hide")
    return
  end

  for _, term in ipairs(Snacks.terminal.list()) do
    if term:buf_valid() and term.win and vim.api.nvim_win_is_valid(term.win) then
      term:hide()
      return
    end
  end

  Snacks.terminal.focus(nil, { cwd = vim.fn.expand("%:p:h") })
end

vim.keymap.set({ "n", "t" }, "<C-`>", toggle_terminal, { desc = "Terminal (Buffer Dir)" })
vim.keymap.set({ "n", "t" }, "<C-'>", toggle_terminal, { desc = "Terminal (Buffer Dir)" })
vim.keymap.set("t", "<Esc><Esc>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })

vim.keymap.set("n", "<A-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
vim.keymap.set("n", "<A-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
vim.keymap.set("n", "<A-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
vim.keymap.set("n", "<A-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })
