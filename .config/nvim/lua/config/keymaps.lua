-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- vim.keymap.set("c", "<Down>", "<C-n>", { noremap = true })
-- vim.keymap.set("c", "<Up>", "<C-p>", { noremap = true })

if vim.g.neovide then
  local modifier = vim.fn.has("macunix") == 1 and "D" or "C"
  vim.keymap.set("n", "<" .. modifier .. "-t>", "<leader>fn", { remap = true, desc = "New File" })
  vim.keymap.set("n", "<C-Tab>", "<S-l>", { remap = true, desc = "Next Buffer" })
  vim.keymap.set("n", "<C-S-Tab>", "<S-h>", { remap = true, desc = "Prev Buffer" })

  local copy_key = vim.fn.has("macunix") == 1 and "<D-c>" or "<C-S-c>"
  vim.keymap.set("x", copy_key, '"+y', { desc = "Copy to clipboard" })

  local paste_key = vim.fn.has("macunix") == 1 and "<D-v>" or "<C-S-v>"
  vim.keymap.set({ "n", "i", "v", "c", "t" }, paste_key, function()
    vim.api.nvim_paste(vim.fn.getreg("+"), true, -1)
  end, { silent = true, desc = "Paste from clipboard" })

  if vim.fn.has("macunix") == 1 then
    local modes = { "i", "x", "n", "s" }
    vim.keymap.del(modes, "<C-s>")
    vim.keymap.set(modes, "<D-s>", "<cmd>w<cr><esc>", { desc = "Save File" })
  end
end

-- local function toggle_terminal()
--   if vim.bo.buftype == "terminal" then
--     vim.cmd("hide")
--     return
--   end
--
--   for _, term in ipairs(Snacks.terminal.list()) do
--     if term:buf_valid() and term.win and vim.api.nvim_win_is_valid(term.win) then
--       term:hide()
--       return
--     end
--   end
--
--   Snacks.terminal.focus(nil, { cwd = vim.fn.expand("%:p:h") })
-- end

-- vim.keymap.set({ "n", "t" }, "<C-`>", toggle_terminal, { desc = "Terminal (Buffer Dir)" })
-- vim.keymap.set({ "n", "t" }, "<C-'>", toggle_terminal, { desc = "Terminal (Buffer Dir)" })
vim.keymap.set("t", "<Esc><Esc>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })

vim.keymap.set("n", "<A-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
vim.keymap.set("n", "<A-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
vim.keymap.set("n", "<A-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
vim.keymap.set("n", "<A-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

vim.keymap.set("n", "<leader>md", "<cmd>delmarks!<cr>", { desc = "Delete All Buffer Marks" })
