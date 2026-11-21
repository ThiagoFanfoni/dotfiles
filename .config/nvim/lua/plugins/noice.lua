return {
  "folke/noice.nvim",

  opts = function(_, opts)
    opts.lsp = vim.tbl_deep_extend("force", opts.lsp or {}, {
      signature = {
        opts = {
          size = {
            max_height = 6,
          },
        },
      },
    })

    opts.routes = vim.list_extend(opts.routes or {}, {
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
    })
  end,
}
