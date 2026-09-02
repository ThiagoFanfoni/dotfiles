return {
  "saghen/blink.cmp",

  init = function()
    vim.keymap.set("c", "<Esc>", "<C-c>", {
      noremap = true,
    })
  end,

  opts = {
    sources = {
      providers = {
        snippets = {
          opts = {
            friendly_snippets = false,
          },
        },
      },
    },

    signature = {
      enabled = true,
    },

    keymap = {
      preset = "super-tab",

      ["<Up>"] = { "select_prev", "fallback" },
      ["<Down>"] = { "select_next", "fallback" },
      ["<Esc>"] = { "cancel", "fallback" },
    },

    cmdline = {
      keymap = {
        preset = "inherit",
      },

      completion = {
        -- ghost_text = { enabled = true },
        menu = {
          auto_show = true,
        },

        list = {
          selection = {
            preselect = true,
            auto_insert = true,
          },
        },
      },
    },
  },
}
