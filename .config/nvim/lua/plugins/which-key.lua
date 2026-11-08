return {
  "folke/which-key.nvim",
  config = function(_, opts)
    local wk = require("which-key.triggers")

    ---@diagnostic disable-next-line: duplicate-set-field
    wk.add = function(t)
      if wk.is_mapped(t) then
        return
      end

      local keys = vim.keycode(t.keys)
      vim.keymap.set(t.mode, t.keys, function()
        require("which-key.state").start({ keys = t.keys })
      end, {
        buffer = t.buf,
        -- Let longer global mappings take precedence.
        nowait = not vim.iter(vim.api.nvim_get_keymap(t.mode)):any(function(m)
          local lhs = vim.keycode(m.lhs)
          return #lhs > #keys and vim.startswith(lhs, keys)
        end),
        desc = "which-key-trigger" .. (t.plugin and " " .. t.plugin or ""),
      })

      wk._triggers[wk.id(t)] = t
    end

    require("which-key").setup(opts)
  end,
}
