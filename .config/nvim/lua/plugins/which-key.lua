--- https://github.com/folke/which-key.nvim/issues/968#issuecomment-6823679054

return {
  "folke/which-key.nvim",
  config = function(_, opts)
    local Triggers = require("which-key.triggers")
    local original_add = Triggers.add

    local excluded = {
      vim.keycode("<leader>"),
      vim.keycode("<localleader>"),
    }

    ---@diagnostic disable-next-line: duplicate-set-field
    Triggers.add = function(t)
      original_add(t)

      local keys = vim.keycode(t.keys)
      if vim.tbl_contains(excluded, keys) or #keys ~= 1 then
        return
      end

      local modes = type(t.mode) == "table" and t.mode or { t.mode or "n" }

      ---@diagnostic disable-next-line: param-type-mismatch
      for _, mode in ipairs(modes) do
        local maps =
          vim.list_extend(vim.api.nvim_get_keymap(mode), t.buf and vim.api.nvim_buf_get_keymap(t.buf, mode) or {})
        local has_longer = vim.iter(maps):any(function(m)
          if m.lhs == nil then
            return false
          end
          if m.desc and vim.startswith(m.desc, "which-key-trigger") then
            return false
          end
          return #m.lhs > #keys and vim.startswith(m.lhs, keys)
        end)
        if has_longer then
          vim.keymap.set(mode, t.keys, function()
            require("which-key.state").start({ keys = t.keys })
          end, {
            buffer = t.buf,
            nowait = false,
            desc = "which-key-trigger" .. (t.plugin and " " .. t.plugin or ""),
          })
        end
      end
    end

    require("which-key").setup(opts)
  end,
}
