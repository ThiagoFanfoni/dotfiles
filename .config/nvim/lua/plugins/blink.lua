return {
  "saghen/blink.cmp",
  opts = {
    completion = {
      keyword = { range = "full" },
      -- list = {
      --   selection = {
      --     preselect = true,
      --   },
      -- },
    },
    fuzzy = { implementation = "prefer_rust_with_warning" },
    keymap = {
      preset = "super-tab",
      ["<Tab>"] = { "snippet_forward", "fallback" },
      ["<S-Tab>"] = { "snippet_backward", "fallback" },
      ["<CR>"] = { "accept", "fallback" },
    },
  },
}
