return {
  "folke/noice.nvim",

  opts = {
    lsp = {
      signature = {
        opts = {
          size = {
            max_height = 6,
          },
        },
      },
    },

    routes = {
      {
        filter = {
          event = "notify",
          kind = "debug",
          find = "^Suggestion file not available: pt%.utf%-8%.sug$",
        },
        opts = {
          skip = true,
        },
      },
      {
        filter = {
          any = {
            {
              find = "pyright",
            },
          },
          event = "lsp",
          kind = "progress",
        },

        opts = {
          skip = true,
        },
      },
    },
  },
}
