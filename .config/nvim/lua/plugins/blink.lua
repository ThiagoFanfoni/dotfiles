return {
  "saghen/blink.cmp",
  opts = {
    signature = { enabled = true },

    keymap = {
      preset = "enter",
      ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
      ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
      ["<Esc>"] = { "cancel", "fallback" },
    },

    completion = {
      list = {
        selection = {
          preselect = false,
          auto_insert = true,
        },
      },
    },
  },
}
