return {
  "saghen/blink.cmp",

  init = function()
    vim.keymap.set("c", "<Esc>", "<C-c>", {
      noremap = true,
    })
  end,

  opts = {
    cmdline = {
      completion = {
        -- ghost_text = { enabled = true },
        list = {
          selection = {
            auto_insert = true,
            preselect = true,
          },
        },

        menu = {
          auto_show = true,
        },
      },

      keymap = {
        preset = "inherit",
      },
    },

    keymap = {
      preset = "super-tab",

      ["<C-d>"] = { "scroll_documentation_down", "fallback" },
      ["<C-e>"] = { "cancel", "fallback" },
      ["<C-k>"] = { "show_documentation", "hide_documentation" },
      ["<C-l>"] = { "show", "hide" },
      ["<C-u>"] = { "scroll_documentation_up", "fallback" },
      ["<Down>"] = { "select_next", "fallback" },
      ["<Esc>"] = { "cancel", "fallback" },
      ["<Up>"] = { "select_prev", "fallback" },
    },

    signature = {
      enabled = true,
    },

    sources = {
      providers = {
        snippets = {
          opts = {
            friendly_snippets = false,
          },
        },
      },
    },
  },
}
