return {
  "folke/snacks.nvim",

  opts = {
    dashboard = { enabled = false },

    picker = {
      layout = {
        fullscreen = true,
      },

      sources = {
        buffers = {
          layout = {
            config = function(layout)
              local preview = layout.layout[2]
              if preview and preview.win == "preview" then
                preview.width = 0.7
              end
            end,
          },
        },

        explorer = {
          actions = {
            bufadd = function(_, item)
              if vim.fn.bufexists(item.file) == 0 then
                local buf = vim.api.nvim_create_buf(true, false)
                vim.api.nvim_buf_set_name(buf, item.file)
                vim.api.nvim_buf_call(buf, vim.cmd.edit)
              end
            end,

            confirm_nofocus = function(picker, item)
              if item.dir then
                picker:action("confirm")
              else
                picker:action("bufadd")
              end
            end,
          },

          auto_close = true,
          exclude = { "node_modules", ".git" },
          hidden = false,
          ignored = false,

          layout = {
            cycle = true,
            layout = {
              border = "rounded",
              box = "horizontal",
              height = 0.95,
              position = "float",
              width = 0,

              {
                box = "vertical",
                min_width = 40,
                width = 40,

                {
                  border = "single",
                  height = 1,
                  title = "{title} {live} {flags}",
                  win = "input",
                },
                { win = "list" },
              },
              {
                border = "left",
                width = 0,
                win = "preview",
              },
            },
            preview = true, ---@diagnostic disable-line: assign-type-mismatch
          },

          win = {
            list = {
              keys = {
                ["L"] = "confirm",
                ["l"] = "confirm_nofocus",
              },
            },
          },
        },

        files = {
          layout = {
            config = function(layout)
              local preview = layout.layout[2]
              if preview and preview.win == "preview" then
                preview.width = 0.8
              end
            end,
          },
        },

        keymaps = {
          layout = { preview = false },
        },
      },
    },
  },
}
