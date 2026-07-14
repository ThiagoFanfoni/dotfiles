return {
  "folke/noice.nvim",
  opts = {
    routes = {
      {
        filter = {
          event = "lsp",
          kind = "progress",
          any = {
            {
              find = "pyright",
            },
          },
        },
        opts = {
          skip = true,
        },
      },
    },
    lsp = {
      signature = {
        opts = {
          size = {
            max_height = 6,
          },
        },
      },
    },
  },
}
