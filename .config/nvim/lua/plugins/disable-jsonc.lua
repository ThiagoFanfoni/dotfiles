return {
  -- 1. Treesitter: remove jsonc from ensure_installed
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if opts.ensure_installed then
        opts.ensure_installed = vim.tbl_filter(function(lang)
          return lang ~= "jsonc"
        end, opts.ensure_installed)
      end
    end,
  },

  -- 2. Force filetype .json -> json (not jsonc)
  {
    "LazyVim/LazyVim",
    opts = function(_, _)
      vim.filetype.add({
        extension = {
          json = "json",
        },
      })
    end,
  },

  -- 3. LSP: restrict jsonls to json only
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        jsonls = {
          filetypes = { "json" }, -- disable jsonc
        },
      },
    },
  },
}
