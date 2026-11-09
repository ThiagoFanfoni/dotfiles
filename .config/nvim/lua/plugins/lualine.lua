return {
  "nvim-lualine/lualine.nvim",

  dependencies = { "nvim-tree/nvim-web-devicons" },

  config = function()
    local lualine = require("lualine")
    -- local lazy_status = require("lazy.status") -- For lazy plugin updates

    -- Color palette for lualine
    local colors = {
      bg = "#112638",
      blue = "#65D1FF",
      fg = "#c3ccdc",
      green = "#3EFFDC",
      inactive_bg = "#2c3043",
      red = "#FF4A4A",
      semilightgray = "#b4b4b4",
      violet = "#FF61EF",
      yellow = "#FFDA7B",
    }

    -- Define lualine theme with different sections
    local theme = {
      command = {
        a = { bg = colors.yellow, fg = colors.bg, gui = "bold" },
        b = { bg = colors.bg, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg },
      },

      inactive = {
        a = { bg = colors.inactive_bg, fg = colors.semilightgray, gui = "bold" },
        b = { bg = colors.inactive_bg, fg = colors.semilightgray },
        c = { bg = colors.inactive_bg, fg = colors.semilightgray },
      },

      insert = {
        a = { bg = colors.green, fg = colors.bg, gui = "bold" },
        b = { bg = colors.bg, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg },
      },

      normal = {
        a = { bg = colors.blue, fg = colors.bg, gui = "bold" },
        b = { bg = colors.bg, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg },
      },

      replace = {
        a = { bg = colors.red, fg = colors.bg, gui = "bold" },
        b = { bg = colors.bg, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg },
      },

      visual = {
        a = { bg = colors.violet, fg = colors.bg, gui = "bold" },
        b = { bg = colors.bg, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg },
      },
    }

    -- Set up lualine with the modified theme and sections
    lualine.setup({
      extensions = { "lazy", "fzf" },

      options = {
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        theme = theme,
      },

      sections = {
        lualine_b = { "branch", "diff", "diagnostics" },

        lualine_c = {
          {
            "filename",
            path = 3,
            symbols = { modified = " ●", readonly = " " },
            color = { gui = "bold" },
          },
        },

        lualine_x = {
          {
            function()
              ---@type { get: fun(): string? }
              local mode = require("noice").api.status.mode
              return mode.get()
            end,
            cond = function()
              if not package.loaded["noice"] then
                return false
              end
              ---@type { has: fun(): boolean }
              local mode = require("noice").api.status.mode
              return mode.has()
            end,
            color = { fg = colors.red },
          },
          -- {
          --   lazy_status.updates,
          --   color = { fg = "#ff9e64" },
          --   cond = lazy_status.has_updates,
          --   icon = "", -- Icon for pending updates
          -- },
          "filetype",
        },
        lualine_y = {
          function()
            return vim.api.nvim_buf_line_count(0) .. " lines"
          end,
        },

        lualine_z = { "progress" },
      },
    })
  end,
}
