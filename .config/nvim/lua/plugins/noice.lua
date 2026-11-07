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
